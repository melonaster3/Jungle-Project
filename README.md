# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

![Front-Page](https://github.com/melonaster3/Jungle-Project/blob/master/public/README-PICS/Front-page.JPG?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## App Features

    - Users are able to add product items to their cart 
    - Users are able to buy items using the stripe payment 
    - Users can browse either all the categories or specific categories of plants
    - Users can sign up with email, name and password and also sign in using their email and password 
    - When logged in, admin can add, delete prdocuts and access admin endpoints
    - When an order is completed, an automated email recipet will be sent 
    - Testing done with Rspec and Cypress
    
    
    
![Product-List](https://github.com/melonaster3/Jungle-Project/blob/master/public/README-PICS/List-Plants.JPG?raw=true)

![Cart](https://github.com/melonaster3/Jungle-Project/blob/master/public/README-PICS/cart.JPG?raw=true)

![SpecificListing](https://github.com/melonaster3/Jungle-Project/blob/master/public/README-PICS/specific-listing.JPG?raw=true)


## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
