import 'package:dev_portfolio/data/model/profile.dart';
import 'package:dev_portfolio/main.dart';
import 'package:dev_portfolio/view/components/link_button.dart';
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
          SizedBox(height: 16.0),
          _profileInfo(context),
          SizedBox(height: 16.0),
          _links(),
          _cover(context),
        ],
      ),
    );
  }

  Wrap _links() {
    return Wrap(
      spacing: 16.0,
      runSpacing: 16.0,
      children:
          profile.links
              .map((link) => LinkButton(link: link, onClick: () {}))
              .toList(),
    );
  }

  Padding _cover(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        profile.aboutText,
        textAlign: TextAlign.center,
        style: context.textTheme.bodyMedium,
      ),
    );
  }

  Column _profileInfo(BuildContext context) {
    return Column(
      children: [
        Text(profile.fullName, style: context.textTheme.headlineMedium),
        Text(
          profile.role,
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
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
        width: screenWidth >= 800 ? 200 : 125,
        height: screenWidth >= 800 ? 200 : 125,
      ),
    );
  }
}
