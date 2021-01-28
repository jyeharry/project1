# General Assembly Project 1

## BarHop

The task for this project was to create a CRUD app using Ruby on Rails.

BarHop is used to search for bars and night clubs around a particular area, displaying them in a card like format and allowing users to save them to their profile. The cards display only core information, such as club name, address, website, a photo and phone number. This allows the user to quickly look through the bars in a certain area to help them make up their mind for their next night out, avoiding any extra fluff you would get with a search engine query.

I had a lot fun making this web-app, not only because it solves a problem for me but also because Bootstrap makes it so easy to create beautiful components on your site.

### How it works

When the user enters a location in the search bar, the location is passed to the Geocoder API in one of the controllers.

Geocoder takes the location and gets its latitude and longitude coordinates and passes these to the Google Places API which does a search for places of type 'bar' and 'night_club' around those coordinates.

Up to 20 results are returned and they are then cycled through and added to the database one by one where they are displayed in the 'Explore bars' page permanently, meaning users won't have to use the APIs to search for the same place again.

## Future updates

I'd like to come back to this project and add a carousel functionality to the cards so users can cycle through several cards instead of just one, to help them get a better understanding of the bars vibe.

I'd also like to add a filter button to the 'Explore bars' page as well as pagination to make looking through the results much easier. At this stage all the results just pile on forever with no means of sorting through them.

Lastly (or not, I'm sure I'll think of more features), some AJAX would come in real handy to prevent the page from reloading every single time a card is saved or unsaved.

Other than that I'm sure I'll find ways to shorten some code.

## Technologies used

BarHop was created with:

* Ruby on Rails 5.2.4.4
* PostgreSQL 13
* Bootstrap 4
* HTML
* Some small amounts of CSS and jQuery

The APIs I used in this app were:

* Geocoder
* Google Places.

A ruby gem also had to be downloaded in order to use Google Places with ruby, which can be found [here](https://github.com/qpowell/google_places)

## Technical Requirements

* **Models.** Your app should have at least 3 models. Make sure they are
associated correctly!
* **Views.** Use partials to DRY (Don’t Repeat Yourself) up your views.
* **Handles invalid data.** Forms in your application should validate data and
handle incorrect inputs. Validate sign up information, verify valid email
addresses and secure passwords.
* **Use Gems** Use a GEM that talks to an API to add functionality to your app.
* **User Login.** Make sure you have basic authentication and authorization set up (if you need it).
* **Heroku.** Deploy your code to Heroku.

## Optional Add-ons

* Bootstrap
