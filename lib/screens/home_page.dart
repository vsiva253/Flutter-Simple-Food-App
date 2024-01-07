// home_page.dart
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:temp_practice/data/modals/restaurant_modal.dart';
import 'package:temp_practice/data/services/api_service.dart';
import 'package:temp_practice/widgets/category_filter_chips.dart';
import 'package:temp_practice/widgets/location_display_widget.dart';
import 'package:temp_practice/widgets/restaurant_card.dart';
import 'package:temp_practice/widgets/search_bar.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LocationService locationService = LocationService();
  List<Restaurant> restaurants = [];
  TextEditingController searchController = TextEditingController();
  String selectedCategory = "All";

  @override
  void initState() {
    super.initState();
    _initializeData();
    _requestLocationPermission();
  }

  Future<void> _initializeData() async {
    await locationService.getCurrentLocation();
    final lat = locationService.currentPosition.latitude;
    final lng = locationService.currentPosition.longitude;

    try {
      final loadedRestaurants = await Api.getRestaurants(lat, lng);
      setState(() {
        restaurants = loadedRestaurants;
      });
    } catch (error) {
      print('Error loading restaurants: $error');
      // Handle error gracefully
    }
  }

  // Inside _HomePageState class
  Future<void> _requestLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print('Location permission granted');
    } else {
      print('Location permission denied');
      // Handle permission denial
    }
  }

  List<Restaurant> _filterRestaurantsByCategory() {
    if (selectedCategory == "All") {
      return restaurants;
    } else {
      return restaurants
          .where((restaurant) => restaurant.tags
              .toLowerCase()
              .contains(selectedCategory.toLowerCase()))
          .toList();
    }
  }

  List<Restaurant> _filterRestaurantsBySearch(String searchText) {
    final filteredByCategory = _filterRestaurantsByCategory();

    print("Search Text: $searchText");

    if (searchText.isEmpty) {
      return filteredByCategory;
    } else {
      final filteredList = filteredByCategory
          .where((restaurant) =>
              restaurant.name.toLowerCase().contains(searchText.toLowerCase()))
          .toList();

      print("Filtered List: $filteredList");

      return filteredList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.white,
        activeColor: Colors.blue,
        color: Colors.black,
        curveSize: 0,
        cornerRadius: 0,
        height: 50,
        style: TabStyle.fixedCircle,
        items: [
          TabItem(icon: Icons.favorite, title: 'Favorites'),
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        initialActiveIndex: 1,
        onTap: (int index) {
          // Handle tab item taps
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            LocationDisplayWidget(
                currentAddress: locationService.currentAddress),
            CategoryFilterChips(
              categories: [
                'All',
                'Chicken',
                'Pizza',
                'Burger'
              ], // Add more categories as needed
              selectedCategory: selectedCategory,
              onCategorySelected: (category) {
                setState(() {
                  selectedCategory = category;
                });
              },
            ),
            SearchWidget(
              searchController: searchController,
              onTextChanged: (text) {
                setState(() {});
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Restaurants",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount:
                    _filterRestaurantsBySearch(searchController.text).length,
                itemBuilder: (context, index) {
                  final restaurant =
                      _filterRestaurantsBySearch(searchController.text)[index];
                  return RestaurantCard(restaurant: restaurant);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
