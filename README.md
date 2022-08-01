Added trigger function to update a flag whenever change made to books table 

#steps to run the app

Do bundle install running 
bundle install
yarn install --check-files
create and migrate DB
setup DB settings in database.yml
rake db:create, rake db:migrate

#added 2 test books
rake db:seed 

make sure redis server is running and run sidekiq

bundle exec sidekiq

modify the update check time interval in config/schedule.rb
add whenever to run via crontab running below command
whenever --update-crontab

To test, you need to update name of book field via console, 

