Added trigger function in postgresql which updates a boolean flag(field called 'table_updated') in books table,  whenever name field of book gets updated.

#steps to install/run the app

run- 'bundle install'
run- yarn install --check-files
setup DB settings in database.yml
create and migrate DB- rake db:create, rake db:migrate
rake db:seed to add test entry into books table

make sure redis server is running and run sidekiq

bundle exec sidekiq

modify the db update check time interval in config/schedule.rb
run- whenever --update-crontab (which will add job to crontab)

To test the functionality, You can load book via console and update the name of book
i.e. 

rails c
book = Book.last
book.name = "test123"
book.save!

This will update the table_updated flag to 'true' hence will catch via cronjob,

You can access sidekiq UI via - http://localhost:3000/sidekiq  (mounted it in routes)

