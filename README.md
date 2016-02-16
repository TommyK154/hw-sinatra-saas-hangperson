Hangperson
=============================================================

A classic Hangman game using Sinatra framework with RESTful routes and service-oriented architecture. Users create a new game which triggers an API call to get a random word. Cookies are used to preserve the word and user's guesses. Safeguards in place to prevent "cheating" by adding "/win" (or "/lose") to the end of the URL. Tested using RSpec and Cucumber. Deployed to Heroku.
