import 'package:dev_portfolio/data/model/experience.dart';
import 'package:dev_portfolio/main.dart';
import 'package:flutter/material.dart';

class ExperienceCard extends StatelessWidget {
  final Experience experience;
  const ExperienceCard({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: context.colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _company(context, experience),
            SizedBox(height: 8.0),
            Divider(),
            SizedBox(height: 8.0),
            // Tasks
            Column(
              spacing: 8.0,
              children:
                  experience.tasks.map((task) => _task(task, context)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Row _task(String task, BuildContext context) {
    return Row(
      children: [
        Icon(Icons.arrow_right_rounded),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: Text(task, style: context.textTheme.bodyMedium),
          ),
        ),
      ],
    );
  }

  Row _company(BuildContext context, Experience experience) => Row(
    spacing: 16.0,
    children: [
      // Logo
      ClipRRect(
        borderRadius: BorderRadius.circular(36.0),
        child: Image.network(experience.logo, width: 36, height: 36),
      ),

      // Position
      _headInfo(experience, context),

      // Location
      _locationChip(experience, context),
    ],
  );

  Expanded _headInfo(Experience experience, BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          // Role
          SizedBox(
            width: double.infinity,
            child: Text(
              experience.role,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Company
          SizedBox(
            width: double.infinity,
            child: Text(experience.place, style: context.textTheme.labelMedium),
          ),

          // Period
          SizedBox(
            width: double.infinity,
            child: Text(
              "${experience.startDate} - ${experience.endDate}",
              style: context.textTheme.labelSmall,
            ),
          ),
        ],
      ),
    );
  }

  Chip _locationChip(Experience experience, BuildContext context) {
    return Chip(
      label: Text(experience.location),
      avatar: Icon(Icons.location_on, size: 16.0),
      side: BorderSide(style: BorderStyle.none),
      backgroundColor: context.colorScheme.surfaceContainerHigh,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      labelStyle: context.textTheme.labelSmall,
    );
  }
}
