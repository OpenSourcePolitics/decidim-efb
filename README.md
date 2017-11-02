# decidim-efb

Citizen Participation and Open Government application.

This is the open-source repository for decidim-efb, based on [Decidim](https://github.com/decidim/decidim).

## Deploying the app

An opinionated guide to deploy this app to Heroku can be found at [https://github.com/codegram/decidim-deploy-heroku](https://github.com/codegram/decidim-deploy-heroku).

## Setting up the application


```ruby
bundle install
bin/rails db:create db:migrate db:seed # setup database and create some fake development data
```
For your development you can use those accounts :
- Admin system login :  `system@example.org` / `decidim123456`
- Admin login : `admin@example.org` / `decidim123456`.
- User login : `user@example.org` / `decidim123456`.

You're good to go!
