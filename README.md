##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [3.3.5]
- Rails [7.2.2]
- Postgresql

##### 1. Check out the repository

```bash
git clone git@github.com:unique-thinker/user_app.git
```

##### 2. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
```

##### 3. Run Rspec test case

Run the following commands to run rspec test.

```ruby
bundle exec rspec spec/models
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you cn visit the site with the URL http://localhost:3000
