# README

* Ruby version 3.0.0

How i proceeded this problem.

First I created a Beer class with 3 attributes, id, name and description. That data I received from the api had many attributes but I map only three attributes and make the beers objects and add beers objects in the array and return that array as json response.

Then I realised i can create a Beer Service Class which will consume/use punk api service class to fetch data from punk api.
The Beer Service class is used in the beers controller.

Here in each class i tried to follow the dry principle and single responsible principle.

Extra question:
    • What happens if in a couple of months, we are asked to get beers from 2 different external APIs? What would we have to change? 
    
Because of the above structure we will have flexibility to add multiple apis and fetch data from those apis.
 New Service class will be created and then it will be integrated into beer service class. 