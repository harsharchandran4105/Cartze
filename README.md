# Cartzy – Campus Marketplace App

Cartzy is a mobile marketplace application built using Flutter and Firebase that allows students within a campus to buy and sell products easily.  
The application provides separate flows for buyers and sellers, enabling product listing, browsing, reservation, and order management.

--------------------------------------------------

FEATURES

User Authentication
- User registration and login using Firebase Authentication
- Secure password handling

Seller Features
- Upload products with image, price, and description
- View reserved orders for their products
- Manage listed products

Buyer Features
- Browse products uploaded by sellers
- Search for products
- Reserve products
- View reserved orders in profile

General Features
- Profile page displaying user information
- Order tracking for both buyers and sellers
- Firebase Realtime Database integration
- Clean and simple UI built with Flutter

--------------------------------------------------

TECH STACK

Flutter – Mobile app development  
Firebase Authentication – User login and registration  
Firebase Realtime Database – Backend database  
Dart – Programming language  
Image Picker – Product image selection  

--------------------------------------------------

DATABASE STRUCTURE

Users

users
   uid
      name
      rollNo
      email


Products

products
   productId
      name
      price
      description
      image
      sellerId


Orders

orders
   orderId
      productName
      price
      buyerId
      sellerId
      status

--------------------------------------------------

APPLICATION FLOW

1. User registers and logs in.
2. Seller uploads products to the marketplace.
3. Buyers browse available products.
4. Buyers reserve products.
5. Reserved products disappear from the marketplace.
6. Sellers can view reserved products in their profile.
7. Buyers can view their reserved orders in their profile.

--------------------------------------------------

APPLICATION SCREENS

Register Page  
Login Page  
Role Selection Page  
Home Page (Marketplace)  
Product Details Page  
Seller Upload Page  
Buyer Profile Page  
Seller Profile Page  

--------------------------------------------------

INSTALLATION

Clone the repository

git clone https://github.com/harsharchandran4105/Cartze.git

Navigate to the project directory

cd Cartze

Install dependencies

flutter pub get

Run the application

flutter run

--------------------------------------------------

FUTURE IMPROVEMENTS

- Payment integration
- Product rating and reviews
- In-app messaging between buyer and seller
- Push notifications for orders
- Improved product filtering

--------------------------------------------------

AUTHOR

Harsha R Chandran

GitHub  
https://github.com/harsharchandran4105

--------------------------------------------------

LICENSE

This project is developed for academic purposes.
