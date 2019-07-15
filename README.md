# README

## Requirement
Create an app using Rails, Postgres, and Bootstrap that lets a user create, store, and view notes. Each note should have a title, body, and tags.

## Setup
1) Run following command
```
bundle install
rake db:create db:migrate
```

## Run Project
1) To start server
```
rails s
```
2) Open browser. type `http://localhost:3000`

## Project flow
1) To create note user must login or sign up(if no account present).
2) User can attach or create tags for each notes. Tags will be create if not present.
3) User can filter notes by tags.

