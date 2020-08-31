PWA Dealer Services App
The PWA Dealer app is built for the PWA Dealership that officer after sales vehicle service and repair support to the dealerships customers. Customer are required to sign up and login to there accounts to reserve a service appointment. Are allowed to select multiple service items, update or delete a service.

Installation
Ruby
https//https://github.com/Pwako11/pwa_dealer_service_app
The application confirms to RESTful routes to create, show, edit, and delete items from the
database
Usage
Once downloaded, in your terminal cd to the root directory /pwa_dealer_service_app.

Then, deploy your local server using the command shotgun.

Open up your preferred web browser and navigate to the url localhost:9393 where you will be with the welcome page.


Home page

First time visitors can view the home page details and then scroll to the bottom to signup for a user account.


signup link

This bring up the signup form. New user will be required to provide a username, email and password.


Signup form

Once a user is signup, they will be directed to their Account home page. Here a user will see a personalized welcome message with count and list of upcoming service appointments. the user can then navigate back to the dealer service homepage to make service selections through a link on the page.


User Account home page.

The user can then select a service on the homepage by licking the links for each respective service. This brings them to a show page where they can then decide to proceed with an add to cart action.


add to cart

The add to cart option will request the user to enter special requests and a preferred time for their service. This fields are mandatory and should have data in them. Once complete the user will be presented with a first chance to edit their selection. the user can now change the notes entered in the special request field, proceed to review service summary page, continue adding services or delete the selected option.


Finally the user can review all their service selections, in summary form on their User homepage. At this point the user can edit an entry, delete an entry, return to shop or logout of the app.