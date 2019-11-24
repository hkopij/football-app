# Football-app

#### About

Football-app is an app based on apifootball.com API. It allows the user to subscribe to specific leagues and display their league tables.

#### Running locally

Before running this app locally you should set up a few most popular leagues with:
- rails db:seed

There are also Cron jobs set up with a Whenever gem, so you should run:
- whenever --update-crontab

And finally, you should run rake tasks to have all the available leagues updated (as they are preset to update once a day)
- rake countries:import_available_countries
- rake leagues:import_available_leagues
- rake leagues:import_league_details

#### Functionality

- App stores all of the available leagues in its DB after correctly setting it up.
- Search function, to easily find specific leagues (by name of the country or by name of the league)
- App requests from API table only of these leagues, that are added by the user to available leagues (whenever gem is set up to run rake task once an hour to update league table, so it might not be available instantly)
- User can sort tables specific column (for example, goals scored/lost)

#### To do

- Frontend, as the app is focused on the backend side

#### Gems used in this project

- Devise - simple authentication for users
- Json - handling API responses
- Ransack - basic search of available leagues
- jquery - sorting of league tables
