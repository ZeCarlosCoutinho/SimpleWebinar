# README

This project was done for a small assignment, which aimed at making a very simplified version of WebinarGeek's API.

The assignment basically involved replicating an extremely simplified schema file from WebinarGeek's API and creating an API with 2 endpoints:
- Retrieve a list of broadcasts
- (Create and) Subscribe a subscriber to a broadcast

Also, the API should automatically create a personal token for the user so that they can be unsubscribed later. The task only involved generating and storing the token.

## Testing

Note: This assumes you have Rails and all the Gems installed.

To run the tests, run the following command:
```sh
bundle exec rspec
```
