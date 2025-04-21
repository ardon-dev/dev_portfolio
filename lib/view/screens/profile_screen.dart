import 'package:dev_portfolio/main.dart';
import 'package:dev_portfolio/view/components/education_card.dart';
import 'package:dev_portfolio/view/components/experience_card.dart';
import 'package:dev_portfolio/view/components/profile_header.dart';
import 'package:dev_portfolio/viewmodel/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProfileViewmodel>(context);
    viewModel.fetchProfile();

    return SizedBox(
      width: 800,
      child: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Header
          ProfileHeader(profile: viewModel.profile),

          // Experience
          _sectionTitle(context, 'Experiencia'),
          _experience(context, viewModel),

          // Education
          _sectionTitle(context, 'Educación'),
          _education(viewModel),
        ],
      ),
    );
  }

  Padding _sectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: context.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  Card _education(ProfileViewmodel viewModel) {
    final education = viewModel.profile.education;
    final itemCount = education.isNotEmpty ? education.length * 2 - 1 : 0;

    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16.0,
          children: List.generate(itemCount, (index) {
            if (index.isEven) {
              final cardIndex = index ~/ 2;
              return EducationCard(
                education: viewModel.profile.education[cardIndex],
              );
            } else {
              return Divider();
            }
          }),
        ),
      ),
    );
  }

  Card _experience(BuildContext context, ProfileViewmodel viewModel) {
    final experiences = viewModel.profile.experience;
    final itemCount = experiences.isNotEmpty ? experiences.length * 2 - 1 : 0;

    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16.0,
          children: List.generate(itemCount, (index) {
            if (index.isEven) {
              final cardIndex = index ~/ 2;
              return ExperienceCard(
                experience: viewModel.profile.experience[cardIndex],
              );
            } else {
              return Divider();
            }
          }),
        ),
      ),
    );
  }
}
