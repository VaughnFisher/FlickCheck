# README

## FlickCheck
FlickCheck is a super rad movie review site

### Extra Features
- Allows users to create an account and log in
- Allows users to add movies not already found in the database
- Pretty sleek design if I do say so myself

### Installation:
Install Dependencies
```
bundle install
```
Create file: /config/initializers/tmdb.rb
```
Tmdb::Api.key("YOUR_API_KEY_HERE")
```
Setup database
```
rails db:migrate
rails db:seed
```
Run
```
rails s
```
## Thank you for considering me for TCI's SE intern position!
