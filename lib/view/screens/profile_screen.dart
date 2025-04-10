import 'package:dev_portfolio/main.dart';
import 'package:dev_portfolio/view/components/experience_card.dart';
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

    return LayoutBuilder(
      builder: (context, constrains) {
        double horizontalPadding;
        if (constrains.maxWidth >= 1200) {
          horizontalPadding = 250;
        } else if (constrains.maxWidth >= 800) {
          horizontalPadding = 150;
        } else {
          horizontalPadding = 16; // Para móviles
        }

        return ListView(
          padding: EdgeInsets.only(
            top: 16,
            bottom: 16,
            left: horizontalPadding,
            right: horizontalPadding,
          ),
          children: [
            // Header
            ProfileHeader(profile: viewModel.profile),

            // Cover and contact
            _cover(context, viewModel.profile.aboutText),

            //LinkHeader(links: viewModel.profile.links),
            Padding(
              padding: const EdgeInsets.only(
                top: 24.0,
                left: 16.0,
                bottom: 8.0,
              ),
              child: Text(
                'Experiencia',
                style: context.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            _experience(context, viewModel),
            _education(viewModel),

            // Experience
          ],
        );
      },
    );
  }

  Card _education(ProfileViewmodel viewModel) {
    return Card(
      elevation: 0,
      child: Column(
        children:
            viewModel.profile.experience
                .map((exp) => ExperienceCard(experience: exp))
                .toList(),
      ),
    );
  }

  Card _experience(BuildContext context, ProfileViewmodel viewModel) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16.0,
          children:
              viewModel.profile.experience
                  .map((exp) => ExperienceCard(experience: exp))
                  .toList(),
        ),
      ),
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
