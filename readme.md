# Dynamic Online Marketplace

## Project Overview
Dynamic Online Marketplace is an e-commerce platform designed to offer users a dual selling option: **Selling** and **Auctioning**. Unlike traditional platforms in Thailand, which usually support only one type of selling method, this marketplace provides flexibility to sellers, allowing them to list items under **First-hand**, **Second-hand**, or **Antique** categories.

The platform supports a comprehensive auctioning system, giving buyers and sellers a complete online shopping experience with features such as seller ratings, product reviews, and more.

## Key Features
- **Dual Selling Options**: Sellers can choose to either list their products for direct sale or auction them off to the highest bidder.
- **Category-based Marketplace**: Products are organized into specialized marketplaces for First-hand, Second-hand, and Antique goods.
- **Seller Ratings and Reviews**: Buyers can view ratings and read reviews, enabling them to make more informed purchasing decisions.
- **Auction Features**: The auctioning system supports starting bids, bid increments, and auction durations for competitive bidding.

## Project Structure

### Business Rules & Constraints
- **User Registration**: Users must register with a valid email and secure password to participate in the marketplace.
- **Product Listings**: Sellers must specify details for each product, including category, price, and description.
- **Bidding**: Auction listings must include a starting bid, bid increment, and a specific auction duration.
- **Compliance**: The platform adheres to all relevant laws and regulations related to online marketplaces and consumer protection.

### Database Structure
The platform utilizes a **relational database** to store user, product, auction, and transaction data. Key entities include:
- **Customer**: Stores information about registered users.
- **Seller**: Manages data about sellers and their listings.
- **Product**: Details about each product in the marketplace.
- **Auction**: Auction-specific information including bids and winning criteria.
- **Review**: Manages product reviews and ratings from customers.

### Queries & Reports
The system supports various queries and reports for detailed insights, such as:
- **Top Sellers**: Identifies the sellers with the highest revenue.
- **Top-rated Products**: Lists products based on average customer ratings.
- **Low Stock Products**: Finds sellers whose products are running low on stock.
- **Auction Insights**: Tracks auctions with no bids and calculates total bid amounts.

## Operations & Transactions
The platform supports essential CRUD operations for managing customers, sellers, products, and auctions. Key operations include:
- **INSERT**: Add new customers, sellers, products, auctions, and orders.
- **UPDATE**: Modify customer and seller information, product descriptions, and order statuses.
- **DELETE**: Remove records for customers, sellers, products, and reviews.

## Diagrams
- **Conceptual Diagram**: Outlines the high-level structure of the marketplace and its entities.
- **Logical Diagram**: Provides a detailed breakdown of the database design.
- **Extended Entity Relationship (EER) Diagram**: Represents relationships between key entities in the database.

## Team Members
- **Anawat Pradabsuk** (124039)
- **Ritik Sareen** (123844)
- **Tanzil Al Sabah** (123845)
- **Munthitra Thadthapong** (124022)

## Course Information
- **Course**: AT82.02 Data Modeling and Management
- **Instructor**: Dr. Chutiporn Anutariya

## Conclusion
This Dynamic Online Marketplace project demonstrates a comprehensive approach to building a scalable and feature-rich e-commerce platform. The project focuses on enabling both direct sales and auctions, providing a unique value proposition for sellers and buyers alike in the Thai marketplace.

Thank you for your interest in our project!

