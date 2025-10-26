#!/bin/bash
# Setup script for production database

set -e

echo "🚀 Setting up Awesome App Database for Production"
echo "=================================================="

# Configuration
DB_DIR="${AWESOME_DB_VOLUME:-/var/lib/awesome/data}"
REPO="valknarness/awesome-app"
ARTIFACT_NAME="awesome-database"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo -e "${RED}Please run as root (use sudo)${NC}"
    exit 1
fi

# Step 1: Create data directory
echo -e "\n${BLUE}Step 1: Creating data directory...${NC}"
mkdir -p "$DB_DIR"
echo "✓ Directory created: $DB_DIR"

# Step 2: Check for GitHub CLI
echo -e "\n${BLUE}Step 2: Checking for GitHub CLI...${NC}"
if ! command -v gh &> /dev/null; then
    echo -e "${RED}GitHub CLI (gh) is not installed${NC}"
    echo "Install from: https://cli.github.com/"
    echo ""
    echo "Quick install:"
    echo "  Ubuntu/Debian: sudo apt install gh"
    echo "  macOS: brew install gh"
    exit 1
fi
echo "✓ GitHub CLI found"

# Step 3: Check authentication
echo -e "\n${BLUE}Step 3: Checking GitHub authentication...${NC}"
if ! gh auth status &> /dev/null; then
    echo -e "${YELLOW}Not authenticated. Running 'gh auth login'...${NC}"
    gh auth login
fi
echo "✓ Authenticated"

# Step 4: Download database
echo -e "\n${BLUE}Step 4: Downloading latest database...${NC}"

# Create temp directory
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

echo "Fetching latest workflow run..."
RUN_ID=$(gh run list --repo "$REPO" --workflow "db.yml" --status success --limit 1 --json databaseId --jq '.[0].databaseId')

if [ -z "$RUN_ID" ]; then
    echo -e "${RED}No successful database builds found${NC}"
    echo "You may need to trigger a database build first:"
    echo "  gh workflow run db.yml --repo $REPO"
    exit 1
fi

echo "Latest successful run: $RUN_ID"
echo "Downloading artifact..."

gh run download "$RUN_ID" --repo "$REPO" --name "$ARTIFACT_NAME"

# Step 5: Extract and install database
echo -e "\n${BLUE}Step 5: Installing database...${NC}"

if [ -f awesome.db ]; then
    # Backup existing database if it exists
    if [ -f "$DB_DIR/awesome.db" ]; then
        BACKUP="$DB_DIR/awesome.db.backup.$(date +%Y%m%d_%H%M%S)"
        echo "Backing up existing database to: $BACKUP"
        cp "$DB_DIR/awesome.db" "$BACKUP"
    fi

    # Copy new database
    echo "Installing new database..."
    cp awesome.db "$DB_DIR/"

    # Copy metadata if exists
    if [ -f db-metadata.json ]; then
        cp db-metadata.json "$DB_DIR/"
    fi

    # Set correct permissions (nextjs user = 1001:1001)
    chown -R 1001:1001 "$DB_DIR"
    chmod -R 755 "$DB_DIR"

    echo "✓ Database installed"

    # Show database info
    DB_SIZE=$(du -h "$DB_DIR/awesome.db" | cut -f1)
    echo "Database size: $DB_SIZE"

    if command -v sqlite3 &> /dev/null && [ -f db-metadata.json ]; then
        echo -e "\n${GREEN}Database Statistics:${NC}"
        cat db-metadata.json | jq '.'
    fi
else
    echo -e "${RED}Database file not found in artifact${NC}"
    exit 1
fi

# Cleanup
cd - > /dev/null
rm -rf "$TEMP_DIR"

# Step 6: Restart container (if running)
echo -e "\n${BLUE}Step 6: Restarting container...${NC}"
if command -v docker &> /dev/null; then
    COMPOSE_FILE="${COMPOSE_FILE:-/opt/awesome/compose.production.yml}"

    if [ -f "$COMPOSE_FILE" ]; then
        echo "Restarting container..."
        docker compose -f "$COMPOSE_FILE" restart awesome-app

        # Wait for health check
        echo "Waiting for container to be healthy..."
        sleep 5

        # Check status
        docker compose -f "$COMPOSE_FILE" ps awesome-app

        echo -e "\n${GREEN}✓ Setup complete!${NC}"
        echo -e "\nYour app should now be running with the latest database."
        echo "Visit: https://awesome.pivoine.art"
    else
        echo -e "${YELLOW}Note: Compose file not found at $COMPOSE_FILE${NC}"
        echo "Please restart your container manually"
    fi
else
    echo -e "${YELLOW}Docker not found - please restart your container manually${NC}"
fi

echo -e "\n${GREEN}🎉 Database setup complete!${NC}"
