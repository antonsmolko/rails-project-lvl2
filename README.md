### Hexlet tests and linter status:
[![Actions Status](https://github.com/antonsmolko/rails-project-lvl2/workflows/hexlet-check/badge.svg)](https://github.com/antonsmolko/rails-project-lvl2/actions)
[![CI](https://github.com/antonsmolko/rails-project-lvl2/actions/workflows/ci.yml/badge.svg)](https://github.com/antonsmolko/rails-project-lvl2/actions/workflows/ci.yml)

[Demo](https://antonsmolko-rails-project-lvl2.herokuapp.com)

## Installation
    $ make prepare
    $ make setup
    $ make start

## Usage
    // testing
    $ make test for testing

    // rubocop lint and tesing
    $ make check

    // fixtures load
    $ make fixtures-load

    // drop db
    $ make clean
    
    // reset db
    $ make db-reset

    // rubocop lint
    $ make lint

    // rubocop -A
    $ make linter-fix

    // deploy on heroku
    $ make deploy

    // start heroku console
    $ make heroku-console

    // output heroku logs
    $ make heroku-logs
    