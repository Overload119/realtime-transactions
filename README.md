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

This was a cool project, and I learned a lot - since I'm not really a backend engineer it helped me stretch into different areas of development.

- DDD (Domain Driven Design)
- CQRS (Command & Query Responsibility Separation)
- Event Sourcing
- How to do all the above in the Ruby on Rails stack

The first thing I had to take a look at is OpenAPI specification which was new to me.

Unfortunately it's not super-supported in the RoR (Ruby on Rails) ecosystem, but I did find some help resources on https://openapi.tools.

Some articles I read that helped make sense of this all...

- https://kickstarter.engineering/event-sourcing-made-simple-4a2625113224
- https://dev.to/isalevine/building-an-event-sourcing-pattern-in-rails-from-scratch-355h
- https://railseventstore.org/docs/v2/app/
- https://andela.com/insights/building-scalable-applications-using-event-sourcing-and-cqrs/

### Tests

While I wish I could take advantage of some of the libraries in other [ecosystems](https://openapi.tools/) around OpenAPI, I ended up writing tests manually.

I was particularly interested in some of the [fuzzing solutions](https://forallsecure.com/mayhem-for-api) out there.

These were my areas of focus:

1. You can go back in time and replay balances to rebuild a user's balance.
2. This requirement is met: "Authorization declines should be saved, even if they do not impact balance calculation."
3. Valid cases such as Authorizing and Load work according to the specification.
4. Error cases (invalid request or responses) would be denied.

Before I wrote tests, I used queries in CURL as I was building and monitored the good old fashioned terminal.

```bash
curl -X 'PUT' \
  'http://localhost:3000/load/12345' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "messageId": "12345",
  "userId": "2226e2f9-ih09-46a8-958f-d659880asdfA",
  "transactionAmount": {
    "amount": "100.20",
    "currency": "USD",
    "debitOrCredit": "CREDIT"
  }
}'

curl -X 'PUT' \
  'http://localhost:3000/authorization/12345' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "messageId": "12345",
  "userId": "2226e2f9-ih09-46a8-958f-d659880asdfA",
  "transactionAmount": {
    "amount": "1.10",
    "currency": "USD",
    "debitOrCredit": "DEBIT"
  }
}'
```

In a production system, I would spend more time to:

- Setup test coverage calculations to understand test coverage.
- Investigate whether or not fuzzing could be productionized.
- Create E2E (end-to-end) tests, spinning up browsers to go through certain flows.
- Setup a CI pipeline to build the test environment and run tests on each PR.
- Create a suite of testing utilities to make it faster to add tests.
- Load tests and performance tests.

Other questions to explore:

1. How do you stand-up a publicly facing service?
2. What considerations are you making to scale the service?
3. How are you constructing tests?
4. How are new versions built and deployed?

## Prerequisites

- Ruby on Rails for application layer
- SQLite for the database

## Getting Started

Requires Ruby and SQLite.

```bash
rvm install 2.7.5
bundle # Download gems
rails db:migrate # Setup the database
rails db:seed # Creates some user to be used for the API. See db/seeds.rb
rails s # Start application server
```

## ASCII Art

I used Dall-E to generate an image with the prompt:

```
stick of butter with hands and legs typing on a computer in an empty room with a light blue background; graphic art
```

Then I fed that image into https://www.ascii-art-generator.org/ to generate a colored ASCII art version.

![image](./ascii.png)
