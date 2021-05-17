import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:recruiting/layouts/constants.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class JobApplicantTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final boxShadow = [
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.1),
        blurRadius: 3.0,
        offset: Offset(0, 3),
      )
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: boxShadow,
      ),
      child: Row(
        children: [
          Expanded(
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
                          "Timeline",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              fontSize: kFontSizeLg,
                              fontWeight: FontWeight.w500,
                              color: TWTwoColors.gray.shade900,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        JobApplicantTimelineList(),
                        const SizedBox(height: 24.0),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(0.375 * 16.0),
                              )),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      vertical: 18.0, horizontal: 32.0)),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith(
                                      (Set<MaterialState> states) {
                                const Set<MaterialState> interactiveStates =
                                    <MaterialState>{
                                  MaterialState.pressed,
                                  MaterialState.hovered,
                                  MaterialState.focused,
                                };
                                if (states.any(interactiveStates.contains)) {
                                  return TWTwoColors.blue.shade700;
                                }
                                return TWTwoColors.blue.shade600;
                              }),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                            child: Text("Schedule new event",
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: kFontSizeSm,
                                ))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class JobApplicationEvent {
  JobApplicationEvent({
    required this.step,
    required this.startDate,
  });

  final String step;
  final DateTime startDate;
}

class JobApplicantTimelineList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        JobApplicantTimelineListItem(
          event: JobApplicationEvent(
            step: "application",
            startDate: DateTime.parse("2021-03-12 14:18:04Z"),
          ),
        ),
        const SizedBox(height: 4.0),
        JobApplicantTimelineListItem(
          event: JobApplicationEvent(
            step: "phone screening",
            startDate: DateTime.parse("2021-03-15 14:18:04Z"),
          ),
        ),
        const SizedBox(height: 4.0),
        JobApplicantTimelineListItem(
          event: JobApplicationEvent(
            step: "interview",
            startDate: DateTime.parse("2021-03-20 14:18:04Z"),
          ),
          divider: false,
        ),
      ],
    );
  }
}

class JobApplicantTimelineListItem extends StatelessWidget {
  const JobApplicantTimelineListItem(
      {Key? key, required this.event, this.divider = true})
      : super(key: key);

  final JobApplicationEvent event;
  final bool divider;

  Widget _buildIcon(BuildContext context) {
    switch (event.step) {
      case "application":
        return Container(
          width: 32.0,
          height: 32.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadiusFull),
            color: TWTwoColors.gray.shade500,
          ),
          child: Center(
            child: Image.asset("assets/images/user.png"),
          ),
        );
      default:
        if (event.startDate.isAfter(DateTime.now())) {
          // calendar
          return Container(
            width: 32.0,
            height: 32.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadiusFull),
              color: TWTwoColors.blue.shade500,
            ),
            child: Center(
              child: Image.asset("assets/images/calendar.png"),
            ),
          );
        } else {
          // checkmark
          return Container(
            width: 32.0,
            height: 32.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadiusFull),
              color: TWTwoColors.green.shade500,
            ),
            child: Center(
              child: Image.asset("assets/images/check.png"),
            ),
          );
        }
    }
  }

  Widget _buildText(BuildContext context) {
    switch (event.step) {
      case "application":
        return RichText(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            text: 'Applied to ',
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: kFontSizeSm,
                color: TWTwoColors.gray.shade500,
              ),
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Frontend Developer',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: kFontSizeSm,
                    fontWeight: FontWeight.w500,
                    color: TWTwoColors.gray.shade900,
                  ),
                ),
              ),
            ],
          ),
        );
      default:
        if (event.startDate.isAfter(DateTime.now())) {
          return RichText(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              text: "Upcoming ",
              style: GoogleFonts.inter(
                  textStyle: TextStyle(
                fontSize: kFontSizeSm,
                color: TWTwoColors.gray.shade500,
              )),
              children: <TextSpan>[
                TextSpan(
                  text: event.step,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontSize: kFontSizeSm,
                      fontWeight: FontWeight.w500,
                      color: TWTwoColors.gray.shade900,
                    ),
                  ),
                ),
                TextSpan(
                  text: " scheduled",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontSize: kFontSizeSm,
                      color: TWTwoColors.gray.shade500,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return RichText(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              text: "Completed ",
              style: GoogleFonts.inter(
                  textStyle: TextStyle(
                fontSize: kFontSizeSm,
                color: TWTwoColors.gray.shade500,
              )),
              children: <TextSpan>[
                TextSpan(
                  text: event.step,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontSize: kFontSizeSm,
                      fontWeight: FontWeight.w500,
                      color: TWTwoColors.gray.shade900,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: divider ? 64.0 : 0.0,
        maxHeight: 64.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: divider ? MainAxisSize.max : MainAxisSize.min,
            children: [
              _buildIcon(context),
              if (divider) ...[
                const SizedBox(height: 4.0),
                Expanded(
                  child: VerticalDivider(
                    width: 1.0,
                    color: TWTwoColors.gray.shade200,
                  ),
                ),
                const SizedBox(height: 2.0),
              ],
            ],
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: _buildText(context),
            ),
          ),
          const SizedBox(width: 8.0),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(DateFormat.MMMd().format(event.startDate)),
          ),
        ],
      ),
    );
  }
}
