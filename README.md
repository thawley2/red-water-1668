# Order Up

This repository requires and has been tested on Ruby v2.7.4 and is based on Rails 5.2.8.

RSpec and Shoulda-Matchers have been installed and set up.

## Setup

1. Fork this repo
1. Clone your fork
1. `git clone <paste_repo>`
1. `cd <this_repo_name>`
1. `bundle install`
1. `rails db:{drop,create,migrate}`

When you run `bundle exec rspec` you should have 5 passing tests.

## Instructions

* Work on this assessment independently. DO NOT discuss with anyone.
* You are allowed to use any references including notes, Google, lesson plans, etc.
* Read each story carefully before you start working.
* Commit Frequently, about every 15 - 30 minutes
* Push your code to your fork once the time is up (not before!)

## Submission

Once the time for the assessment is up, push your code to your fork and create a pull request to the `turingschool-examples` repository. Include the following:

* Your Name
* A reflection on how you felt you did with this challenge and what story you got through

## Requirements

* TDD all new work. Features should have >98% coverage.
* Model methods and relationships must be fully tested (100%).

## Not Required

* No visual styling is required or expected.
* You do not need to test for or create any model validations.

## Overview
Order Up is an app that tracks chefs, the dishes that they make, and the ingredients that are in those dishes. Chefs have many dishes. Dishes belong to a chef. Dishes have many Ingredients and Ingredients have many dishes. Ingredients should have a name and calories.
 
Two migrations have been made for you. The one to many relationship has been set up. You will need to create migrations for the many to many relationship between ingredients and dishes. You do not need to do model testing for validations, just make sure you test any relationships and model methods that you create.
 
(Note: The plural of dish is dishes. The plural of chef is chefs.)

## User Stories
Story 1 of 3
```
As a visitor
When I visit a dish's show page
I see the dish’s name and description
And I see a list of ingredients for that dish
and a total calorie count for that dish
And I see the chef's name.
```
 
Story 2 of 3
```
As a visitor
When I visit a dish's show page
I see a form to add an existing Ingredient to that Dish
When I fill in the form with the ID of an Ingredient that exists in the database
And I click Submit
Then I am redirected to that dish's show page
And I see that ingredient is now listed. 
```

Story 3 of 3
```
As a visitor
When I visit a chef's show page
I see a link to view a list of all ingredients that this chef uses in their dishes.
When I click on that link
I'm taken to a chef's ingredients index page
and I can see a unique list of names of all the ingredients that this chef uses.
```
 
Extension
```
As a visitor
When I visit a chef's show page
I see the three most popular ingredients that the chef uses in their dishes
(Popularity is based off of how many dishes use that ingredient)
```
