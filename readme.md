<~ Readme.md ~>

In my possession I have many urls, all consiting of a place and a profession (e.g. physiciansnewyorkny.com). The professions run the gamut of medical, legal, and hospitality fields and the places include many of the largest cities in the US.

The goal of this project is to take this list of URLs, and using one program, generate a list of the highest rated business on Yelp of the type and location in the URL (e.g. pysiciansnewyorkny will display the best doctors in New York).

Users who sign up gain the ability to upvote/downvote each item. Items that get downvoted before zero (negative numbers) are removed from the list and replaced.

*Note*

API test files are located in lib/preprod

<~ Basic Functionality ~> 

Users should be able to navigate to the site and see the ten best results for that profession from Yelp automatically.

Users should be able to log in and upvote or downvote businesses.

Upvoted business should appear higher on the list.

Downvoted businesses should appear lower. If they drop into the negatives they should be removed from the list and replaced.

<~ Data Model ~>

This app uses three models:

results: stores the hash for each business from the Yelp API, and the name pulled from the hash for easy searching and dedupes.

users: stores usernames and passwords for each user.

rankings: acts as a join table tying results to users. Also stores the rank for a particular result. Rank is an integer that is in/decremented when the result is up/downvoted, a funtion only available to users. 

<~ APIs and Gems Used ~>

This app uses the Yelp API.

To use the Yelp API it requires the OAuth gem for authentification. 

In addition this app will be developed through testing, so rspec and capybara are necessary. 

<~ Future Iterations ~>

Allow the user to mark businesses as favorites

Add Google Map functionality.

