This repository contains the orchestration logic for the CVE Scraper and Processor. It leverages Kompose to bridge the gap between local development with Docker Compose and production-like deployment on Minikube.

This project manages four distinct services running in separate containers:
* Python Scraper: Ingests data from NVD.
* Go Processor: Processes and stores data.
* RabbitMQ: Message broker for service decoupling.
* MongoDB Atlas: Connected as an external service/secret.
