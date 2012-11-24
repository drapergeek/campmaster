Campmaster
============================
[![Build Status](https://secure.travis-ci.org/drapergeek/campmaster.png?master)](https://travis-ci.org/drapergeek/campmaster) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/drapergeek/campmaster)

Project setup
-------------

Get the code.

    git clone git@github.com:drapergeek/wuzup.git

Set up the project's dependencies.

    cd project
    rake dev:setup

This will automatically add a heroku remote for staging and production.

Running tests:

    rake


Use [Foreman](http://goo.gl/oy4uw) to run the app locally.

    foreman start

It uses your `.env` file and `Procfile` to run processes just like Heroku's
[Cedar](https://devcenter.heroku.com/articles/cedar/) stack.

Anytime any development data is needed, add it to the dev:prime tasks.  At any
point you can reset your local development data with:

    rake dev:prime


Deploy
------
After code is commited to the master branch, it is automatically deployed to
heroku if all the tests pass.  You can also manually deploy:

    git push staging

Run migrations (if necessary).

    heroku run rake db:migrate --app campmaster-staging
    heroku restart --app campmaster-staging
