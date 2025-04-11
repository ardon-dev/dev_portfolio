import 'package:dev_portfolio/main.dart';
import 'package:flutter/material.dart';

class LocationChip extends StatelessWidget {
  const LocationChip({super.key, required this.location});

  final String location;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(location),
      avatar: Icon(Icons.location_on, size: 16.0),
      side: BorderSide(style: BorderStyle.none),
      backgroundColor: context.colorScheme.surfaceContainerHigh,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      labelStyle: context.textTheme.labelSmall,
    );
  }
}
