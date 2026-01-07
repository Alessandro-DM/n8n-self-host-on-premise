#!/bin/bash

# n8n Workflows Export Script
# This script exports all n8n workflows to individual JSON files

echo "🔄 Exporting n8n workflows..."

# Change to the project directory
cd "$(dirname "$0")"

# Check if n8n container is running
if ! docker compose ps n8n | grep -q "Up"; then
    echo "❌ n8n container is not running. Please start it with: docker compose up -d"
    exit 1
fi

# Create workflows directory if it doesn't exist
echo "📁 Creating workflows directory..."
docker compose exec n8n mkdir -p /home/node/.n8n/workflows

# Get list of all workflows
echo "📋 Getting list of workflows..."
docker compose exec n8n n8n list:workflow

echo ""
echo "💾 Exporting all workflows to local directory..."

# Export all workflows to a single file
echo "📁 Exporting all workflows to single file..."
docker compose exec n8n n8n export:workflow --output=/home/node/.n8n/workflows/all-workflows.json --all

# Check if export was successful
if docker compose exec n8n test -f /home/node/.n8n/workflows/all-workflows.json; then
    echo "✅ Export successful!"
else
    echo "❌ Export failed. Check n8n logs for details."
    docker compose logs --tail=10 n8n
    exit 1
fi

echo "✅ Export complete! Files saved to:"
echo "   📂 n8n_data/workflows/"
echo ""
ls -la n8n_data/workflows/