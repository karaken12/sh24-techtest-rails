# TODO

Some ideas and thoughts about what could be done next to make the application better.

* Add fake responses to API calls (e.g. [with Sinatra](https://thoughtbot.com/blog/how-to-stub-external-services-in-tests#create-a-fake-hello-sinatra))
* Make the front-end prettier
* Format recognised postcodes more nicely when displayed back to the user
* Tell users that unrecognised postcodes are... well, unrecognised!
* Gracefully handle the API being slow or unavailable
* Switch configuration files to use a database (shouldn't be hard in Rails!)
* Condense `ApplicationController` and `PostcodeController` into one?
* Add GitHub actions for testing
* Add Docker option for testing and running the application
