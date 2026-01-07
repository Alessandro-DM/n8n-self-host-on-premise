clear

figlet Setup and Run Docker Compose Environment

chmod -R 755 ./n8n_data
chmod +x workflow-sync.sh

echo "Pruning unused Docker resources..."
read -p "This will remove all unused Docker resources. Continue? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    docker system prune -af
else
    echo "Skipping Docker cleanup."
fi

echo "Stopping and removing existing containers..."
docker compose down

echo "Building and starting containers..."
docker compose up -d

echo "Waiting for services to initialize..."
sleep 10

echo "Current running Docker containers:"
docker ps