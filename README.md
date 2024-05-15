# Order API
This is a RESTful API built with Ruby on Rails for managing orders, customers, and products. The API allows you to create orders with associated line items, and it calculates the total price, total VAT, and individual item details for each order.
Prerequisites
To run this application, you'll need to have the following installed:

Ruby (version 3.0.0 or later)
Rails (version 6.1.3.2 or later)
PostgreSQL (or any other supported database)

## Installation

* Unzip the file

* Navigate to the project directory:
```
cd order-api
```
* Install the required gems:
```
bundle install
```
* Create and set up the database:
```
rails db:create
rails db:migrate
```
* To start the Rails server, run:
```
rails server
```

* The API will be accessible at http://localhost:3000.

* API Endpoints
```
Avilable on the attached postman collection
```

## Once you are happy with your code, zip it up and email it back to us along with answers to the following questions (make sure you answer these questions!):

* What command(s) do we run to install and start your server?
```
 Rails s 
```
* Does your solution actually run? 
```
yes
```
* Did you write any tests ? NO
* If you had more time, what improvements would you make if any?
```
Validation and Error Handling: Improve validation and error handling mechanisms for incoming requests. This could include more robust input validation, better error messages, and centralized error handling for consistent responses.
```
* What bits did you find the toughest? What bit are you most proud of? In both cases, why?
```
Toughest Bits:
Calculating Order Totals and VAT: The logic for calculating the total price, total VAT, and individual item details for an order required careful consideration. 

Proudest Bits:
Modularity and Separation of Concerns: I'm proud of the way I structured the code, separating concerns into different methods and models. The OrdersController delegates specific responsibilities to separate methods like process_line_items and set_prices, making the code more modular and easier to maintain.
```
* What one thing could we do to improve this test?
```
Adding more timing to help devs come up with working logic
```



## Authors

John Okari.
ex. John Okari

Live github link: https://github.com/JohnOkari/Oder-api
 
## Licence
MIT License

Copyright (c) [2024] [John Okari]
