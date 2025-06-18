# FROM Backend Hiring Project


### Prerequisites
- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/)

### Steps

1. **Clone the repository:**
   ```bash
   git clone <repo-url>
   cd from-backend-hiring
   ```

2. **Build and start all services:**
   ```bash
   docker-compose up --build
   ```

3. The web service will be available at [http://localhost:8000/](http://localhost:8000/)

### Services
- `hiring-web`: Django app (served via Gunicorn/Uvicorn)
- `hiring-db`: PostGIS-enabled PostgreSQL database
- `hiring-redis`: Redis instance

### Troubleshooting
- If you encounter issues with Docker, ensure the `entrypoint.sh` script exists and is executable.
- Check Docker logs for errors:
  ```bash
  docker-compose logs
  ```
