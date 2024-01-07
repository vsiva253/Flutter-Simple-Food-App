// widgets/location_display_widget.dart
import 'package:flutter/material.dart';

class LocationDisplayWidget extends StatelessWidget {
  final String currentAddress;

  LocationDisplayWidget({required this.currentAddress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_on),
          Text(
            ' $currentAddress',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
