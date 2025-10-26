# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Multi-service Docker Compose stack named "falcon" managing production services on pivoine.art domain. Uses Arty for configuration management with centralized environment variables and custom scripts.

## Architecture

### Compose Include Pattern
Root `compose.yaml` uses Docker Compose's `include` directive to orchestrate multiple service stacks:
- **core**: Shared PostgreSQL 16 + Redis 7 infrastructure
- **proxy**: Traefik reverse proxy with Let's Encrypt SSL
- **sexy**: Directus 11 CMS + SvelteKit frontend
- **awsm**: Next.js application with SQLite
- **track**: Umami analytics (PostgreSQL)
- **gotify**: Push notification server
- **vpn**: WireGuard VPN (wg-easy)

All services connect to a single external Docker network (`falcon_network` by default, defined by `$NETWORK_NAME`).

### Environment Management via Arty
Configuration is centralized in `arty.yml`:
- **envs.default**: All environment variables with sensible defaults
- **scripts**: Common Docker Compose and operational commands
- Variables follow naming pattern: `{SERVICE}_COMPOSE_PROJECT_NAME`, `{SERVICE}_TRAEFIK_HOST`, etc.

Sensitive values (passwords, secrets) live in `.env` and override arty.yml defaults.

### Traefik Routing Architecture
Services expose themselves via Docker labels:
- HTTP → HTTPS redirect on `web` entrypoint (port 80)
- SSL termination on `web-secure` entrypoint (port 443)
- Let's Encrypt certificates stored in `proxy` volume
- Path-based routing: `/api` routes to Directus backend, root to frontend
- Compression middleware applied via labels
- All routers scoped to `$NETWORK_NAME` network

### Database Initialization
`core/postgres/init/01-init-databases.sh` runs on first PostgreSQL startup:
- Creates `directus` database for Sexy CMS
- Creates `umami` database for Track analytics
- Grants privileges to `$DB_USER`

## Common Commands

All commands use `pnpm arty` (leveraging scripts in arty.yml):

### Stack Management
```bash
# Start all services
pnpm arty up

# Stop all services
pnpm arty down

# View running containers
pnpm arty ps

# Follow logs for all services
pnpm arty logs

# Restart all services
pnpm arty restart

# Pull latest images
pnpm arty pull

# View rendered configuration (with variables substituted)
pnpm arty config
```

### Network Setup
```bash
# Create external Docker network (required before first up)
pnpm arty net/create
```

### Database Operations (Sexy/Directus)
```bash
# Export Directus database + schema snapshot
pnpm arty db/dump

# Import database dump + apply schema snapshot
pnpm arty db/import

# Export Directus uploads directory
pnpm arty uploads/export

# Import Directus uploads directory
pnpm arty uploads/import
```

### Deployment
```bash
# Sync .env file to remote VPS
pnpm arty env/sync
```

## Service-Specific Details

### Core Services (core/compose.yaml)
- **postgres**: PostgreSQL 16 Alpine, exposed on host port 5432
  - Uses scram-sha-256 authentication
  - Health check via `pg_isready`
  - Init scripts mounted from `./postgres/init/`
- **redis**: Redis 7 Alpine for caching
  - Used by Directus for cache and websocket storage

### Sexy (sexy/compose.yaml)
Directus headless CMS + SvelteKit frontend:
- **directus**: Directus 11.12.0
  - Admin panel + GraphQL/REST API
  - Traefik routes `/api` path to port 8055
  - Volumes: `directus_uploads` for media, `directus_bundle` for extensions
  - Email via SMTP (IONOS configuration in .env)
- **frontend**: Custom SvelteKit app from ghcr.io/valknarxxx/sexy
  - Serves on port 3000
  - Shared `directus_bundle` volume for Directus extensions

### Proxy (proxy/compose.yaml)
Traefik 3.x reverse proxy:
- Global HTTP→HTTPS redirect
- Let's Encrypt via TLS challenge
- Dashboard disabled (`api.dashboard=false`)
- Reads labels from Docker socket (`/var/run/docker.sock`)
- Scoped to `$NETWORK_NAME` network via provider configuration

### AWSM (awsm/compose.yaml)
Next.js app with embedded SQLite:
- Serves awesome-app list directory
- Optional GitHub token for API rate limits
- Optional webhook secret for database updates
- Database persisted in `awesome_data` volume

## Important Environment Variables

Key variables defined in `arty.yml` and overridden in `.env`:
- `NETWORK_NAME`: Docker network name (default: `falcon_network`)
- `ADMIN_EMAIL`: Used for Let's Encrypt and service admin accounts
- `DB_USER`, `DB_PASSWORD`: PostgreSQL credentials
- `CORE_DB_HOST`, `CORE_DB_PORT`: PostgreSQL connection (default: `postgres:5432`)
- `CORE_REDIS_HOST`, `CORE_REDIS_PORT`: Redis connection (default: `redis:6379`)
- `{SERVICE}_TRAEFIK_HOST`: Domain for each service
- `{SERVICE}_TRAEFIK_ENABLED`: Toggle Traefik exposure
- `SEXY_DIRECTUS_SECRET`: Directus security secret
- `TRACK_APP_SECRET`: Umami analytics secret

## Volume Management

Each service uses named volumes prefixed with project name:
- `core_postgres_data`, `core_redis_data`: Database persistence
- `core_directus_uploads`, `core_directus_bundle`: Directus media/extensions
- `awesome_data`: AWSM SQLite database
- `proxy_letsencrypt_data`: SSL certificates

Volumes can be inspected with:
```bash
docker volume ls | grep falcon
docker volume inspect <volume_name>
```

## Troubleshooting

### Services won't start
1. Ensure external network exists: `pnpm arty net/create`
2. Check if services reference correct `$NETWORK_NAME` in labels
3. Verify `.env` has required secrets (compare with `arty.yml` envs.default)

### SSL certificates failing
1. Check `ADMIN_EMAIL` is set in `.env`
2. Ensure ports 80/443 are accessible from internet
3. Inspect Traefik logs: `docker logs proxy_app`

### Database connection errors
1. Check PostgreSQL is healthy: `docker ps` (should show healthy status)
2. Verify database exists: `docker exec core_postgres psql -U $DB_USER -l`
3. Check credentials match between `.env` and service configs

### Directus schema migration
- Export schema: `pnpm arty db/dump` (creates `sexy/directus.yaml`)
- Import to new instance: `pnpm arty db/import` (applies schema snapshot)
- Schema file stored in `sexy/directus.yaml` for version control
