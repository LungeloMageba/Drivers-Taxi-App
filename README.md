# Taxi app
 This is a iOS & Android Ride Sharing and Taxi Apps like Uber, myTaxi & Lyft Clone.
 
# How to run the app
1. download the project from github
2. download android studio
3. install Flutter on your computer
4. install the flutter plugin on android studio
5. open the project in android studio
6. install all the dependencies using 'pub get'
7. download the emulator. 
8. run the project on the emulator you've downlaoded.

# How to use the Drivers app
1. Sign up as a driver and Register your vehicle/ login if you already have an account.
2. press the 'now offline' button so that you can be online and riders/ passengers will be able send ride requests to you.

3. a blue dialog box with a 'cancel' and 'accept' button will pop up on the screen when ever you have been requested for a ride. to cancel the ride request press 'cancel' to accept the ride request select 'accept'.if you accept the ride request directions to the passengers current location will be drawn on your map.

5.when you've arrived to the users current location press the 'arrived' button, wait for the user to get in the car press the 'lets go' button then follow the directions(pollyline) to the users destination.

6.click 'end trip' if you've reached the destination.

7.collect payment.

# User Stories
- a user can recieve ride requests.

# Features
- Sign up, vehicle registration and login
 -all form fields are validated.


-GeoFire[Get Driver Location Updates] and Online Offline Driver
 -Get Driver Current Location
 -Drive can go online and offline driver
 -update driver location at real time

-Push Notification System
 -Push Notifications System- FCM Generate Token   for each Device
 -Send Push Notification using Firebase Cloud Messaging
 -Retrieve user rideRequest information from Database using user rideRequestId
 -display notification dialog box with user ride request information
 -play notification received sound on driver phone
 
-Allow a driver to accept userRideRequest
 -driver accept userRideRequest and show initial user trip details to driver

Draw polyline from driver current location to user pickup location

  

 
 


