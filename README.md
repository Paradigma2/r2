# R2 README

* [Ruby version] 2.7.4
* [Rails version] 5.2.6

####[System dependencies] 
* bundle install

####[Configuration]
Database:
* export DB_HOST=<host>, otherwise 127.0.0.1
* export DB_PORT=<port>, otherwise 5432
* export DB_USERNAME=<user>, otherwise postgres
* export DB_PASSWORD=<password>, otherwise secret

Mailer:
* export GOOGLE_USERNAME=<username>
* export GOOGLE_USERNAME=<password>
* export TEST_MAIL=<mail for seeded ads>

####[Database creation]
```
docker run --name <name> /
-p 5432:5432 /
-e POSTGRES_PASSWORD=secret /
-d postgres
```
Then create 2 schemas, r2_dev and r2_test

####[Database initialization]
* rake db:migrate
* rake db:migrate RAILS_ENV=test
* rake db:seed

####[Run tests]
rspec

####[Rubocop]
rubocop
