# README

## Overview

This application is an implementation of Event Sourcing for a realtime core banking engine.

The API consists of 2 basic methods:

- Load: Add money to a user (credit)
- Authorize: Conditionally remove money from a user (debit)

These endpoints are exposed in [routes.rb](config/routes.rb).

NOTE: In a production application, I would expose and namespace these routes in something like:

```rb
/api/v1/users/load
/api/v1/users/authorization
```

Below are other assumptions I made:

- You cannot Load an account with a Debit. The API schema seemed to allow this. Likewise, you cannot Credit in the Authorize path.
- Only a single currency is supported (USD, but it's arbitrary).

## Prerequisites

- Ruby on Rails for application layer
- SQLite for the database

## Getting Started

Requires Ruby and SQLite.

```bash
rvm install 2.7.5
bundle # Download gems
rails db:migrate # Setup the database
rails db:seed # Setup some users. See db/seeds.rb
rails s # Start application server
```

1. How do you stand-up a publicly facing service?
2. What considerations are you making to scale the service?
3. How are you constructing tests?
4. How are new versions built and deployed?

## ASCII Art

I used Dall-E to generate an image with the prompt:

```
stick of butter with hands and legs typing on a computer in an empty room with a light blue background; graphic art
```

Then I fed that image into https://www.ascii-art-generator.org/ to generate a colored ASCII art version.

![image](./ascii.png)
