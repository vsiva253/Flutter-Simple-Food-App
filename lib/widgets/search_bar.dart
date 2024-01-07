// widgets/search_bar.dart
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) onTextChanged;

  SearchWidget({
    required this.searchController,
    required this.onTextChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 6),
      child: Card(
        elevation: 5, // Set your desired elevation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            // border: Border.all(
            //   color: Colors.grey,
            //   width: 0,
            // ),
          ),
          child: TextField(
            controller: searchController,
            onChanged: onTextChanged,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              border: OutlineInputBorder(
                gapPadding: 0,
                borderSide: BorderSide.none,
              ),
              hintText: 'Search restaurants...',
              prefixIcon: IconButton(
                icon: Icon(Icons.search, color: Colors.grey),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
