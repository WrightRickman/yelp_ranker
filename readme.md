# Readme.md

App can be found [HERE (enigmatic-everglades-5042.herokuapp.com)](http://enigmatic-everglades-5042.herokuapp.com/)

In my possession I have many urls, all consiting of a place and a profession (e.g. physiciansnewyorkny.com). The professions run the gamut of medical, legal, and hospitality fields and the places include many of the largest cities in the US.

The goal of this project is to take this list of URLs, and using one program, generate a list of the highest rated business on Yelp of the type and location in the URL (e.g. pysiciansnewyorkny will display the best doctors in New York).

Users who sign up gain the ability to upvote/downvote each item. Items that get downvoted before zero (negative numbers) are removed from the list and replaced by a new result.

## Basic Functionality 

A user types in a supported url. The url is parsed and passed into the Yelp api. 

There is also a normal Yelp search for you to rank.

Users should be able to log in and upvote or downvote businesses.

Upvoted business appear higher on the list.

Downvoted businesses appear lower. If they drop into the negatives they are be removed from the list and replaced. If you search again, these results will not return, allowing for greater discovery.

## Data Model

This app uses three models:

results: stores the hash for each business from the Yelp API, and the name pulled from the hash for easy searching and dedupes.

users: stores usernames and passwords for each user.

There is also a table of the seed urls that acts as a lib.

## APIs and Gems Used

This app uses the Yelp API.

To use the Yelp API it requires the OAuth gem for authentification. 

In addition this app used rspec, capybara, and devise.

## Future Iterations

Navigating to a supported url will automatically show the results for that profession

Allow the user to mark businesses as favorites

Add Google Map functionality.

