# Volunteer Tracker!

#### This Web Application tracks projects and the volunteers working on them. Using one-to-many relationships, the volunteer will belong to only one project while a project can have multiple volunteers using full CRUD functionality.

#### By Rosie Gardner

## Technologies Used

* Ruby
* Pry
* Gem
* Sinatra
* Postgres
* SQL

## Setup/Installation Requirements

* https://github.com/rosiegardner/volunteer-tracker.git
* Clone of download this repository onto your desktop
* Navigate to the top-level of directory
* Open VScode.
* CD into root directory and bundle install project
* Open Postgres and set up database:
* `createdb volunteer_tracker`
* `psql volunteer_tracker < database_backup.sql`
* `createdb -T volunteer_tracker volunteer_tracker_test`
* Run `ruby app.rb` in command line to start server

## Behavior Driven Development / User Stories

1) A user can view, add, update, and delete projects.
2) A user can view, add, update, and delete volunteers.
3) A user can add or delete volunteers from a projects.
4) A user can search for a volunteer by name.
5) A user can search for a project by title.


## Known Bugs

* Do not use Apostrophe when creating projects

## License

MIT

Copyright (c) 2022 Rosie Gardner < rosiegardner78@gmail.com >