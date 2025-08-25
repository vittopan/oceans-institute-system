# Oceans Institute System

Prototype system for UWA Oceans Institute to integrate and display member expertise data.

## Features
- Information goes here

## Tech Stack
This a possible tech stack subject to change of course.
- Python
- SQL
- JSON/CSV

## Folder Structure
```
oceans-institute-system/
├── data/                 # Place holder for data
├── scripts/              # Scripts for processing and integration
├── display/              # Possible UI Mockups
├── docs/                 # Technical and API notes
├── README.md             # Project overview
├── requirements.txt      # dependencies
├── corteza-sandbox       # hannah's sandbox install for corteza
└── .gitignore
```

## Running Corteza Sandbox Install 

### 1. Prerequisites
Install Docker Desktop according to the website instructions. 
(Recommended) Complete the two Welcome to Docker tutorials inside Docker Desktop. They take ~10 minutes and give useful background.
### 2. Clone this repository 
### 3. Set correct permissions

Open a terminal in the ```corteza-sandbox``` folder and run:
```
sudo chown -R 1001:1001 data/db
sudo chown -R 4242:4242 data/server
```

This should ensure persistent storage will work correctly.

### 4. Start Corteza
Run:

```
docker-compose up -d
```

Check everything is running:
```
docker-compose ps
```

**Optional:** confirm in Docker Desktop that the container is active

**Optional:** sanity check
```
docker compose up -d
docker compose exec db psql -h localhost -U "$DB_USER" -d "$DB_NAME" -c "select 1;"
```
Expect a single row with 1 column



### 5. Access Corteza

Open http://localhost:8080 in a Private/Incognito window. You should see a login page.
Create admin account, and log in.
STMP is not configured so you won't receive a confirmation email (and you won't need to).

(If you ever change AUTH_*, recreate server and log in again in a fresh Incognito tab.) 

After you've done this the first time you can open http://localhost:18080 in non-incognito browser.


### 6. Optional: Import the sample modules 
Through the Corteza GUI, you can import ```module-export.json```. As of writing (25/08/2025), the modules are not completely set up and the configuration has not been validated. However, they will help you get up and running faster. 




### Common gotchas (fast fixes)

* **“token is unauthorized”** → your browser has an old cookie or secrets changed. Use Incognito, keep `AUTH_*` stable, recreate `server`.
* **Silent 500 with no server logs** → request didn’t reach the server (wrong host) or session rejected. Check DevTools Response; re-login in Incognito.
* **`role "root" does not exist`** → you ran `psql` without `-U`. Use the exact DB user from `.env`.
* **Apple Silicon warning** → ensure you’re using standard images (above work on M-series Macs). If you pinned an amd64-only image, switch to the tags shown.
* **Port conflicts** → change published ports (e.g., `5433:5432`, `8081:80`) in `docker-compose.yaml` and update your URL.




## Author
Vittorio Panaia, Hannah Meager, Kaoma Kabange, Linshan Xiao, Spencer Kinder, Yusuke Matsuki

