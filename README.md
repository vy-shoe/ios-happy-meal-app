## ios-happy-mealz-app

# Purpose
Writing a native iOS app in Swift using UIKit that allows users to browse recipes sorted alphabetically by category using the following API:
https://www.themealdb.com/api.php

# Endpoints
There are 3 primary endpoints that HappyMealz should utilize:
1. https://www.themealdb.com/api/json/v1/1/categories.php for fetching the list of categories.
2. https://www.themealdb.com/api/json/v1/1/filter.php?c=CATEGORY for fetching the list of meals in a category.
3. https://www.themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID for fetching the meal details by its ID.

# Formatting
Categories and meals are displayed alphabetically with meals sorted into their respective categories.

When a user selects a meal, they are taken to a detail view that includes:
1. Meal name
2. Instructions
3. Ingredients/measurements

# Other Notes
There are many null/empty values from the API. The API is poorly designed in many respects, and this has been an opportunity to see how I can convert imperfectly formatted data into workable models.

My code takes into consideration protocols and delegate pattern as well as MVC architecture to structure is as an app that is ready for future additions although the UI and code readability must be developed to be a production ready app. 
There are no unit tests or third part apps. The app should compile using the latest version of Xcode.