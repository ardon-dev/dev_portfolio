import 'package:dev_portfolio/data/model/education.dart';
import 'package:dev_portfolio/main.dart';
import 'package:dev_portfolio/view/components/location_chip.dart';
import 'package:flutter/material.dart';

class EducationCard extends StatelessWidget {
  final Education education;
  const EducationCard({super.key, required this.education});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            _head(context, education),
            SizedBox(height: 16.0),
            _description(context),
          ],
        ),
      ),
    );
  }

  Row _description(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.arrow_right_rounded),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: Text(
              education.description,
              style: context.textTheme.bodyMedium,
            ),
          ),
        ),
      ],
    );
  }

  Row _head(BuildContext context, Education education) => Row(
    spacing: 16.0,
    children: [
      // Logo
      ClipRRect(
        borderRadius: BorderRadius.circular(36.0),
        child: Image.asset(education.logo, width: 36, height: 36),
      ),

      // Institution
      _headInfo(context),

      // Location
      LocationChip(location: education.location),
    ],
  );

  Expanded _headInfo(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          // Career
          SizedBox(
            width: double.infinity,
            child: Text(
              education.career,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Institution
          SizedBox(
            width: double.infinity,
            child: Text(
              education.institution,
              style: context.textTheme.labelMedium,
            ),
          ),

          // Period
          SizedBox(
            width: double.infinity,
            child: Text(
              "${education.startDate} - ${education.endDate}",
              style: context.textTheme.labelSmall,
            ),
          ),

          // Status
          // SizedBox(
          //   width: double.infinity,
          //   child: Text(
          //     education.status,
          //     style: context.textTheme.labelSmall?.copyWith(
          //       color: context.colorScheme.primary,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
