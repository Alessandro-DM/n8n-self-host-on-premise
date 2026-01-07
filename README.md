# n8n-self-host-on-premise

## n8n with PostgreSQL
Starts n8n with PostgreSQL as database.

### Start
To setup and run the docker compose containers:
```
sh setup-env.sh
```

To start n8n with PostgreSQL simply start docker-compose by executing the following command in the current folder.
```
docker-compose up -d
```
To stop it execute:
```
docker-compose stop
```
### Configuration
The default name of the database, user and password for PostgreSQL can be changed in the .env file in the current directory.

### Run n8n Tunnel
```
docker run -it --rm \
 --name n8n \
 -p 5678:5678 \
 -v n8n_data:/home/node/.n8n \
 docker.n8n.io/n8nio/n8n \
 start --tunnel
```

### To inspect Docker's logs:
```
docker compose logs -f n8n
```

### To create the n8n tunnel with just Docker (without Docker Compose)

```
docker run -it --rm \
--name n8n \
-p 5678:5678 \
-v n8n_data:/home/node/.n8n \
-e N8N_TUNNEL_SUBDOMAIN=example123 \
docker.n8n.io/n8nio/n8n \
start --tunnel
```

### To use the n8n Tunnel
go to this page ([text](https://docs.n8n.io/hosting/installation/docker/#next-steps)), scroll down to "n8n with tunnel" section. If you are:
- just using Docker you can use this command:
```
docker run -it --rm \          
--name n8n \
-p 5678:5678 \
-v n8n_data:/home/node/.n8n \
-e N8N_TUNNEL_SUBDOMAIN=example123 \
docker.n8n.io/n8nio/n8n \
start --tunnel
```
- using Docker Compose then you need to install the "tunnel service" at this page ([text](https://github.com/localtunnel/localtunnel)) and basically use these commands:
```
npm install -g localtunnel
```
to install the local tunnel. Then you use this other command to run it (make sure you run in another terminal docker compose up):
```
sh launch-tunnel.sh
```

### To manually export the workflows
```
docker exec -it n8n-self-host-on-premise-n8n-1 n8n export:workflow --output=/home/node/.n8n/workflows/all-workflows.json --all
```
or

```
sh workflow-sync.sh
```