import 'package:flutter/material.dart';
import 'package:recruiting/layouts/constants.dart';
import 'package:recruiting/layouts/main_layout.dart';
import 'package:recruiting/layouts/max_width_container.dart';
import 'package:recruiting/screens/job_applicant/job_applicant_header.dart';
import 'package:recruiting/screens/job_applicant/job_applicant_information.dart';
import 'package:recruiting/screens/job_applicant/job_applicant_notes.dart';
import 'package:recruiting/screens/job_applicant/job_applicant_timeline.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// Screen showing the details of a job applicant
class JobApplicantScreen extends StatelessWidget {
  const JobApplicantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: MaxWidthContainer(
        maxWidth: getValueForScreenType<double>(
            context: context, mobile: kMaxWidthXl3, desktop: kMaxWidthXl7),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 40.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: JobApplicantHeader(),
              ),
              const SizedBox(height: 16.0),
              ScreenTypeLayout(
                mobile: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getValueForScreenType<double>(
                        context: context, mobile: 0.0, tablet: 8.0),
                  ),
                  child: Column(
                    children: [
                      JobApplicantInformation(),
                      const SizedBox(height: 12.0),
                      JobApplicantNotes(),
                      const SizedBox(height: 12.0),
                      JobApplicantTimeline(),
                    ],
                  ),
                ),
                desktop: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            JobApplicantInformation(),
                            const SizedBox(height: 12.0),
                            JobApplicantNotes(),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          children: [
                            JobApplicantTimeline(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
