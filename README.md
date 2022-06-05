# SH:24 Full Stack Engineer Tech Test

This is an implementation of the SH:24 Tech Test written in Ruby using the Rails framework.

## Ruby environment

This application requires Ruby 2.7.2 and Ruby bundler.
A Ruby version manager such as [rvm](https://rvm.io) is recommended.
If you have Ruby set up you can use `gem install bundler` to install bundler,
followed by `bundle install` to install the necessary dependencies.

### Running tests

Use `bundle exec rake test` to run unit tests, or `bundle exec rake test:system` to run end-to-end system tests.

### Running the app

To start the app in development mode use `bundle exec rails server`;\
open <http://127.0.0.1:3000> to view it in the browser.

### Development setup

To set up Git hooks, use `bundle exec overcommit --install && bundle exec overcommit --sign` to install overcommit.

If you need to manually check the Ruby code
(which is not normally necessary, as it happens on commit),
then use `bundle exec rubocop`.
