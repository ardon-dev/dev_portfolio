import 'package:dev_portfolio/main.dart';
import 'package:dev_portfolio/view/components/link_header.dart';
import 'package:dev_portfolio/view/components/profile_header.dart';
import 'package:dev_portfolio/viewmodel/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProfileViewmodel>(context);
    viewModel.fetchProfile();

    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        ProfileHeader(profile: viewModel.profile),
        _cover(context, viewModel.profile.aboutText),
        LinkHeader(links: viewModel.profile.links),
      ],
    );
  }

  Card _cover(BuildContext context, String aboutText) => Card(
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Presentación', style: context.textTheme.titleLarge),
          SizedBox(height: 16.0),
          Text(
            aboutText,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium,
          ),
        ],
      ),
    ),
  );
}
