# Jungle 🦁

Welcome to the Jungle! Jungle is a mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example from Lighthouse Labs.

The project is meant to feature the front-end and back-end uses of rails, as well as simulating working on a project that is half completed. 

Features:
- Checkout confirmation when a transaction is processed
- "SOLD OUT" buttons on products with no quantity left
- User and Admin logins, and views security
- Formatted money UI and notifications for an empty cart


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
