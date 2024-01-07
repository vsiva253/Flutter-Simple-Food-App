# Restaurant Finder App

## Overview
This Flutter application fetches the user's last known location, displays the address, and allows searching for nearby restaurants. It features a category filter, a list of nearby restaurants, and a bottom navigation bar for navigation.

## Screenshots
![Screenshot1](screenshots/screenshot1.png)
![Screenshot2](screenshots/screenshot2.png)
![Screenshot3](screenshots/screenshot3.png)

## Features
1. **Location Service:**
   - Fetches the user's last known location.
   - Displays the address of the user's location.

2. **Search Bar:**
   - Allows users to search for restaurant names in the nearby area.

3. **Category Filters:**
   - Horizontal scrollable list of category filters with single selection.

4. **Nearby Restaurants:**
   - Displays a vertical scrollable list of nearby restaurants.
   - Utilizes the provided API to fetch restaurant details.

5. **Bottom Navigation Bar:**
   - Includes 5 menu items for navigation.
   - Uses a third-party library for customization.

## API Details
- **Base URL:** [https://theoptimiz.com/restro/public/api/](https://theoptimiz.com/restro/public/api/)
- **Endpoint:** `get_resturants`
- **API URL:** [https://theoptimiz.com/restro/public/api/get_resturants](https://theoptimiz.com/restro/public/api/get_resturants)
- **Request Type:** POST
- **Request Body:**
  ```json
  {
    "lat": 25.22,
    "lng": 45.32
  }
