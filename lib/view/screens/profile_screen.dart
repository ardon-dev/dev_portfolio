import 'package:dev_portfolio/view/components/link_header.dart';
import 'package:dev_portfolio/view/components/profile_header.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [ProfileHeader(), LinkHeader()],
    );
  }
}
