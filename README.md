# BetterUp Full Stack Engineer Interview Project

Prototype for a web application for scheduling an appointment.

### System requirements

- Ruby 2.7.1

## Setup

- run `rails db:setup`
- run `rails availability:import data.csv`
- start rails server (`rails s` locally)
- visit localhost:3000 (or respective server root) and book an appointment!

## Summary

- Took ~5 hours to implemement
- Tradeoffs
  - haven't implemented system tests.
  - basic ux.
  - would refactor to allow user to view in their local time.
  - would likely use custom code for the calendar.
  - would refactor / clean up some views.
  - did not query for entire unavailable dates.
  - not all unit tests completed.

- What went well:
  - layouts and modeling.

- What could be improved.
  - Time zone could be selected by user, and availability shown in that respect
  - query to hide calendar dates when no availability exists.
  - ux could be improved.
  - error handling on import and views.
  - validation that appointment is within coaches available times.
  - refactor queris.
  - finish unit tests.

## TODO

- implement system tests.
- implement further unit tests.
- refactor queries.
- refactor views.
