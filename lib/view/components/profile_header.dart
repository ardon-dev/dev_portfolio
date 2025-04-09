import 'package:dev_portfolio/data/model/profile.dart';
import 'package:dev_portfolio/main.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final Profile profile;

  const ProfileHeader({super.key, required this.profile});

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
        Text(profile.fullName, style: context.textTheme.displaySmall),
        Text(profile.role, style: context.textTheme.titleMedium),
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
