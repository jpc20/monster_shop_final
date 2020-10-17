# Monster Shop Extensions - Bulk Discount
### BE Mod 2 Week 5/5 Final Solo Project

This is the final project for Module 2 of Turing's Back End program. It is an extension to our group project <a href="https://github.com/jpc20/monster_shop_2003">View our Monster Shop 2003</a>, a fictitious e-commerce platform where users can register to place items into a shopping cart and 'check out'. Users who work for a merchant can mark their items as 'fulfilled'; the last merchant to mark items in an order as 'fulfilled' will be able to get "shipped" by an admin.  

### Whats new?
With this extension in place, Merchants have CRUD functionality over discounts. Merchants can access their discounts from the merchant dashboard where they can view, edit and delete their discounts as well as create new discounts. Discounts get applied in the cart when a default user adds an item to their cart from a merchant with a bulk discount active. If the quantity of the item in the cart goes over the quantity for the discount, the discount percent kicks in and the totals in the cart reflect the discounted price. The order price will also be discount when the user checks out.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

```javascript
brew install ruby -2.5.3
gem install rails -5.1.7
```

### Installing

#### Clone repository:
```javascript
git clone git@github.com:jpc20/monster_shop_final.git
```
#### Navigate into directory:
```javascript
cd monster_shop_2003
```
#### Install gems:
```javascript
bundle install
```
#### Configure databases:
```javascript
rails db:{create,migrate,seed}
```

## Running the tests

```javascript
bundle exec rspec
```

## Deployment: (http://localhost:3000)

```javascript
rails s
```

## Built With

* [Rails 5.1.x](https://guides.rubyonrails.org/) - The web framework used
* [Postgresql](https://www.postgresql.org/) - Database


## Authors

**Jack Cullen** - *Extension work* - [jpc20](https://github.com/jpc20)
