import 'package:dev_portfolio/main.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Card(
      elevation: 0,
      child: Column(
        children: [
          SizedBox(height: 16),
          _profileImage(screenWidth),
          _profileInfo(context),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Column _profileInfo(BuildContext context) {
    return Column(
      children: [
        Text('Edgard Ardon', style: context.textTheme.displaySmall),
        Text('Description', style: context.textTheme.titleMedium),
      ],
    );
  }

  ClipRRect _profileImage(double screenWidth) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(300),
      child: Image.asset(
        'images/me.png',
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
        width: screenWidth >= 800 ? 250 : 150,
        height: screenWidth >= 800 ? 250 : 150,
      ),
    );
  }
}
