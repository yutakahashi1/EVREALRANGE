
<h1 align="center"> :battery: EV REAL RANGE :battery: </h1>  

# Summary
## 🌐 App URL
### **http://52.192.174.12/** 
  
  <br> 
  <br>
  <br>
  
## 💬 Production Background
:bangbang: READMEだけでなくアプリケーション内も英語表記となっております。日本のみならず世界中の電気自動車ユーザーに情報を共有してほしいという思いからです。  
READMEに関して[日本語での紹介文](https://docs.google.com/document/d/1La2AMuKh35N6T-hoDb2Ai1dZvnH0GdFNMCpRIX4GDOU)を別に用意しております。制作背景等をより詳細に記載しておりますので、日本語表記の説明文を参照されたい方はこちらもどうぞご参照ください。

  <br>
  
:white_check_mark:More and more people want to buy Electric Vehicle because of the recent trend, however, they also have "range anxiety" due to misunderstanding some information they saw in the internet or even from the maker.   

:white_check_mark:To share the real range of current EV by EV users. 

  <br>

:white_check_mark:To accelerate the world’s transition to sustainable energy.
  
  <br>
  <br>
  <br>
  
## :package: Basic Function
#### :white_check_mark:Top-page view using anchor   
![6968d31672e9e1bffb3fe05464a74377](https://user-images.githubusercontent.com/62327707/81954357-b7de5d00-9643-11ea-8a8d-6701a918a1a7.gif)  

  <br>

#### :white_check_mark:Posting driving data  

  <br>

#### :white_check_mark:User account function  

  <br>

#### :white_check_mark:Add explanation of technical jargon related to EV, using JavaScript  
![746edbaecd66b3ebc9e7f85afe9db6ae](https://user-images.githubusercontent.com/62327707/82011733-e1819d80-96b0-11ea-894c-9c3b6a4c7648.gif)

  <br>

#### :white_check_mark:Car type list with latest data information 
![YH2mluzzQma7pniTb6cCog_thumb_15dd](https://user-images.githubusercontent.com/62327707/82015498-d717d180-96b9-11ea-85c5-fae8384dd893.jpg)

  <br>
  <br>
  <br>

## :eyes: Highlight Feature
### :chart_with_upwards_trend:Install graphs to be able to understand visually
![](https://i.gyazo.com/fada092134f85827b36415bba0072e09.png)  
![](https://i.gyazo.com/3cd668893e56af61ef25970d4a7a19e0.png)

  <br>
  <br>
  <br>

## :thought_balloon: Planning Installation
### :white_check_mark: Update graphs with Vue.js in terms of better UI/UX

  <br>

### :white_check_mark: Extract data from image using OCR(Google Drive API)

  <br>
  <br>
  <br>

# DB Design
## Users table
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

## Posts table
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

## Comments table
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user

## Cars table
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

## Carmakers table
|Column|Type|Options|
|------|----|-------|
|maker|string|null: false|
|image|string|null: false|
|explanation|text|
### Association
- has_many :cars
