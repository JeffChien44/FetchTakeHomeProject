# Fetch Take Home Project

## Table of Contents
- Features
- Installation
- Architecture

## Features
Meal List: View a list of meal in dessert category.
Meal Detail: Tap on a meal to view detailed information, including image, instructions and ingredient/measure.

## Installation
1. Open FetchTakeHomeProject.xcodeproj in Xcode.
2. Build and run the app on a simulator or connected device.

### Architecture
This app follows MVVM pattern, here are the overview of each class
#### Model
- MealList: The model that stores the total count of meal from dessert category
- MealDetail: The model that stores meal id, name, instructions, ingredients/measure, etc. 
#### View
- MealListView: The first view of this app, user can see all the meals from dessert category in this page
- MealDetailView: The view that has the detail of meal, it has name, instructions, ingredients/measure, etc.
#### ViewModel
- BaseViewModel: Parent class for MealListViewModel and MealDetailViewModel, stores error message and state of the view  
- MealListViewModel: View model that handles meal list  
- MealDetailViewModel: View model that handles meal detail
#### Others
- NetworkManager: An API wrapper that calls API from https://themealdb.com/api.php

