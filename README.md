# README
# EV REAL RANGE
# Summary
## 🌐 App URL
### **http://52.192.174.12/**  

## 💬 Production Background
:white_check_mark:More and more people want to buy Electric Vehicle because of the recent trend, however, they also have "range anxiety" due to misunderstanding some information in the internet.   

:white_check_mark:To share the real range of current EV by EV users  

:white_check_mark:To accelerate the world’s transition to sustainable energy

:white_check_mark:
### :chart_with_upwards_trend:






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
