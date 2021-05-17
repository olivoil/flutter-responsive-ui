import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recruiting/layouts/constants.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class JobApplicantInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final boxShadow = [
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.1),
        blurRadius: 3.0,
        offset: Offset(0, 3),
      )
    ];

    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: boxShadow,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Applicant Information",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: kFontSizeLg,
                            fontWeight: FontWeight.w500,
                            color: TWTwoColors.gray.shade900,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        "Personal details and application.",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: kFontSizeSm,
                            color: TWTwoColors.gray.shade500,
                          ),
                        ),
                      ),
                    ],
                  )),
              Divider(
                color: TWTwoColors.gray.shade200,
                height: 34.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (sizingInformation.isMobile) ...[
                      const JobApplicantInfoProp(
                          title: "Application for",
                          value: "Frontend Developer"),
                      const SizedBox(height: 16.0),
                      const JobApplicantInfoProp(
                          title: "Salary Expectation", value: "\$120,000"),
                      const SizedBox(height: 16.0),
                      const JobApplicantInfoProp(
                          title: "Email address",
                          value: "ricardocoopoer@example.com"),
                      const SizedBox(height: 16.0),
                      const JobApplicantInfoProp(
                          title: "Phone", value: "+1 555-555-5555"),
                    ],
                    if (sizingInformation.isTablet ||
                        sizingInformation.isDesktop) ...[
                      Row(
                        children: const [
                          Expanded(
                            child: JobApplicantInfoProp(
                                title: "Application for",
                                value: "Frontend Developer"),
                          ),
                          Expanded(
                            child: JobApplicantInfoProp(
                                title: "Email address",
                                value: "ricardocoopoer@example.com"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        children: const [
                          Expanded(
                            child: JobApplicantInfoProp(
                                title: "Salary Expectation",
                                value: "\$120,000"),
                          ),
                          Expanded(
                            child: JobApplicantInfoProp(
                                title: "Phone", value: "+1 555-555-5555"),
                          ),
                        ],
                      ),
                    ],
                    const SizedBox(height: 16.0),
                    const JobApplicantInfoProp(
                      title: "About",
                      value:
                          "Fugiat ipsum ipsum deserunt culpa aute sint do nostrud anim incididunt cillum culpa consequat. Excepteur qui ipsum aliquip consequat sint. Sit id mollit nulla mollit nostrud in ea officia proident. Irure nostrud pariatur mollit ad adipisicing reprehenderit deserunt qui eu.",
                    ),
                    const SizedBox(height: 16.0),
                    JobApplicationInfoAttachmentList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class JobApplicationInfoAttachmentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Attachments",
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: TWTwoColors.gray.shade500,
              fontSize: kFontSizeSm,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: TWTwoColors.gray.shade200,
            ),
            borderRadius: BorderRadius.circular(kBorderRadiusMd),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const JobApplicationInfoAttachmentListItem(
                  fileName: "resume_frontend_developer.pdf"),
              Divider(color: TWTwoColors.gray.shade200, height: 1.0),
              const JobApplicationInfoAttachmentListItem(
                  fileName: "coverletter_frontend_developer.pdf"),
            ],
          ),
        ),
      ],
    );
  }
}

class JobApplicationInfoAttachmentListItem extends StatelessWidget {
  const JobApplicationInfoAttachmentListItem({Key? key, required this.fileName})
      : super(key: key);

  final String fileName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              children: [
                Image.asset("assets/images/paper_clip.png"),
                const SizedBox(width: 8.0),
                Text("file", // fileName
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                      fontSize: kFontSizeSm,
                      color: TWTwoColors.gray.shade900,
                    ))),
              ],
            ),
          ),
          TextButton(
              onPressed: () {
                // ignore: avoid_print
                print('download pressed');
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(16.0)),
                backgroundColor: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) {
                  const Set<MaterialState> interactiveStates = <MaterialState>{
                    MaterialState.pressed,
                    MaterialState.hovered,
                    MaterialState.focused,
                  };

                  if (states.any(interactiveStates.contains)) {
                    return TWTwoColors.blueGray.shade50;
                  }

                  return null;
                }),
                foregroundColor: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) {
                  const Set<MaterialState> interactiveStates = <MaterialState>{
                    MaterialState.pressed,
                    MaterialState.hovered,
                    MaterialState.focused,
                  };

                  if (states.any(interactiveStates.contains)) {
                    return TWTwoColors.blue.shade500;
                  }

                  return TWTwoColors.blue.shade600;
                }),
              ),
              child: Text("Download",
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: kFontSizeSm,
                  )))),
        ],
      ),
    );
  }
}

class JobApplicantInfoProp extends StatelessWidget {
  const JobApplicantInfoProp({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: TWTwoColors.gray.shade500,
              fontSize: kFontSizeSm,
            ),
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          value,
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              fontWeight: FontWeight.normal,
              color: TWTwoColors.gray.shade900,
              fontSize: kFontSizeSm,
            ),
          ),
        ),
      ],
    );
  }
}
