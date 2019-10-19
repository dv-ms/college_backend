# Read me first

Working versions:  
Ruby -- 2.6.3  
Rails -- 5+  
Bundler -- 2+  
rvm -- 1.8+  
gem -- 2.5.2.1  


To install rvm, ruby and rails please follow these instructions:  
## Linux
```
sudo apt-get install gpgv2
```
```
sudo apt-get install curl
```
```
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
```
```
\curl -sSL https://get.rvm.io | bash -s stable --rails
```
```
rvm use ruby-2.6.3
```
  

Chech versions:
```
ruby -v
```
```
rvm -v
```
```
rails -v
```
  

To install gem (package manager for Ruby/Rails):
```
sudo apt-get install gem
```
  

Go to project root directory and run the following to install bundler (dependecies and version manager for Ruby on Rails):
```
gem install bundler
```
  

The following command installs the project dependecies via bundler
```
bundle install
```
  

Check and correct the database configuration:
```
sudo nano config/database.yml
```
Please note: Ensure that the database details are correct for all environments.
  

If running for the first time, run:
```
rails db:setup
```
Else / Then run:
```
rails server
```
Go to http://localhost:3000
