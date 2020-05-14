# README
# EV REAL RANGE
# Summary
## 🌐 App URL
### **http://52.192.174.12/**  

## 💬 Production Background
:white_check_mark:More and more people want to buy Electric Vehicle because of the recent trend, however, they also have "range anxiety" due to misunderstanding some information they saw in the internet.   

:white_check_mark:To share the real range of current EV by EV users  

:white_check_mark:To accelerate the world’s transition to sustainable energy
## Basic Function
#### :white_check_mark:Top-page view using anchor   
![6968d31672e9e1bffb3fe05464a74377](https://user-images.githubusercontent.com/62327707/81954357-b7de5d00-9643-11ea-8a8d-6701a918a1a7.gif)  
#### :white_check_mark:posting driving data  
#### :white_check_mark:



## :eyes: Highlight Feature
### :chart_with_upwards_trend:  
![](https://i.gyazo.com/fada092134f85827b36415bba0072e09.png)  
![](https://i.gyazo.com/3cd668893e56af61ef25970d4a7a19e0.png)






# DB Design
## users table
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
|image|string|
|admin|boolean|default: false|
|car_id|integer|null: false, foreign_key: true|
|carmaker_id|integer|null: false, foreign_key: true|
### Association
- has_many :posts
- has_many :comments
- belongs_to :car
- belongs_to :carmaker

## posts table
|Column|Type|Options|
|------|----|-------|
|date|date|null: false|
|StartTime|time|null: false|
|EndTime|time|null: false|
|temperature|string|null: false|
|weather|string|null: false|
|driving_status|string|null: false|
|driving_mode|string|null: false|
|distance|integer|null: false|
|consumption|integer|null: false|
|image|text|
|text|text|
|user_id|integer|null: false, foreign_key: true|
|car_id|integer|null: false, foreign_key: true|
|carmaker_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments
- belongs_to :car
- belongs_to :carmaker

## comments table
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user

## cars table
|Column|Type|Options|
|------|----|-------|
|car_type|string|null: false|
|image|string|null: false|
|WLTP_range|integer|null: false|
|EPA_range|integer|null: false|
|carmaker_id|integer|null: false, foreign_key: true|
### Association
- has_many :posts
- has_many :users
- belongs_to :carmaker

## carmakers table
|Column|Type|Options|
|------|----|-------|
|maker|string|null: false|
|image|string|null: false|
|explanation|text|
### Association
- has_many :cars
