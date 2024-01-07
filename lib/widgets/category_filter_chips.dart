// widgets/category_filter_chips.dart
import 'package:flutter/material.dart';

class CategoryFilterChips extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final Function(String) onCategorySelected;

  CategoryFilterChips({
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: categories.map((category) {
            return _buildFilterChip(context, category);
          }).toList(),
        ),
      ),
    );
  }

  FilterChip _buildFilterChip(BuildContext context, String label) {
    return FilterChip(
      label: Text(
        label,
        style: TextStyle(
          color: selectedCategory.toLowerCase() == label.toLowerCase()
              ? Colors.black
              : Colors.black,
        ),
      ),
      selected: selectedCategory.toLowerCase() == label.toLowerCase(),
      backgroundColor: selectedCategory.toLowerCase() == label.toLowerCase()
          ? Colors.pink // Set your desired background color
          : null,
      onSelected: (isSelected) {
        onCategorySelected(isSelected ? label : "All");
      },
    );
  }
}
