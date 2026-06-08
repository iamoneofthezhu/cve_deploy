This repository contains the orchestration logic for the CVE pipeline. It leverages Kompose to bridge the gap between local development with Docker Compose and production-like deployment on Minikube.

This project manages six distinct services running in separate containers:
* Python Scraper (`python-cve`): Ingests CVE data from NVD and publishes to RabbitMQ. Runs as a Kubernetes Job.
* Go Processor (`go-cve`): Consumes messages from RabbitMQ, generates semantic embeddings, and stores data in MongoDB Atlas.
* Python Query API (`python-api`): FastAPI service that accepts natural language queries, converts them to vector embeddings using Gemini, and performs vector search against MongoDB Atlas. Supports filtering by status and published date range.
* Frontend (`frontend-cve`): Next.js web UI for searching CVEs using natural language queries.
* RabbitMQ: Message broker for decoupling the scraper and processor.
* MongoDB Atlas: Connected as an external service via secret.

**Deployment targets**

The same manifests support both Minikube and Google Cloud. Each deployment YAML contains commented lines for both targets — swap two fields per service to switch environments:

* Minikube: use the short image name (e.g. `go-cve`) with `imagePullPolicy: Never` so Kubernetes pulls from the local Minikube Docker daemon.
* Google Cloud: use the full Artifact Registry path (e.g. `us-central1-docker.pkg.dev/<project>/my-repo/go-cve:latest`) with `imagePullPolicy: IfNotPresent`.
