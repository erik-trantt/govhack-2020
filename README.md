# Team "Gone with the Win"

## Installation
This app needs Ruby version 2.6.6 on your computer. If you need help with installing Ruby using `rbenv`, you can follow this [guide](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-18-04#step-1-%E2%80%93-install-rbenv-and-dependencies).


## Setup

```bash
git@github.com:erik-trantt/govhack-2020.git
cd govhack-2020
bundle install
yarn install --check-files

# run app for first time
rails db:migrate db:create
```

## Run the app
```bash
# starting the server
rails server

# shortcut to start the server
rails s
```

&#169; 2020 Gone With The Win