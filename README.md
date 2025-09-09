<img width="1563" height="1266" alt="serveair" src="https://github.com/user-attachments/assets/0be5d215-f189-4138-89fb-a7bde7b370e1" />

# Serve Air

A freight management platform developed for **Server Air** to handle air cargo operations.  
It provides APIs for managing shipments, tracking flights, and automating operational workflows.  

## 🚀 Features
- Ruby on Rails API backend.
- Data modeling for shipments, invoices, and cargo tracking.
- Background jobs for syncing data with external services.
- Role-Based Access Control (RBAC).
- RESTful API for integration with other services.

## 🛠️ Tech Stack
- Ruby on Rails
- PostgreSQL
- Sidekiq & Redis (background jobs)
- Docker
- RSpec & Capybara (testing)

## ⚙️ Setup & Run
```bash
# Install dependencies
bundle install

# Setup database
rails db:create db:migrate db:seed

# Run background jobs
bundle exec sidekiq

# Run server
rails s
