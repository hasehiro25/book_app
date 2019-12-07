# book_app

Book application for rails practice at fjrod boot camp.
- ruby 2.6.5
- rails 6.0.1

## Requirements
needs `imagemagick` to resize images.
```
# for homebrew(mac)
brew install imagemagick
```
## Installation
```ruby
bundle install
bundle exec rails db:migrate
bundle exec rails s
```

make a .env file with these properties to allow oauth with github
```
GITHUB_ID=[your_github_id]
GITHUB_SECRET=[github_secret]
```
