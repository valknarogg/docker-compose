#!/bin/bash
set -e

# PostgreSQL initialization script for compose core stack
# This script runs on first database initialization
# Creates all databases required by compose.sh stacks

echo "Starting compose database initialization..."

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    -- Create databases for compose services
    -- Main application database
    SELECT 'CREATE DATABASE directus'
    WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'directus')\gexec
    
    -- n8n workflow database
    SELECT 'CREATE DATABASE umami'
    WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'umami')\gexec
    
    -- Grant privileges to all databases
    GRANT ALL PRIVILEGES ON DATABASE directus TO $POSTGRES_USER;
    GRANT ALL PRIVILEGES ON DATABASE umami TO $POSTGRES_USER;

    -- Log success
    SELECT 'Compose databases initialized:' AS status;
    SELECT datname FROM pg_database 
    WHERE datname IN ('directus', 'umami')
    ORDER BY datname;
EOSQL

echo ""
echo "✓ PostgreSQL initialization completed"
echo "✓ All compose databases created successfully"
echo ""
echo "Databases available:"
echo "  • directus     - Sexy application database"
echo "  • umami        - Tracking database"
echo ""
