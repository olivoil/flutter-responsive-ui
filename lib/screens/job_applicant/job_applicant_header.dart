import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recruiting/layouts/constants.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class JobApplicantHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Flex(
        direction:
            sizingInformation.isDesktop ? Axis.horizontal : Axis.vertical,
        mainAxisAlignment: sizingInformation.isDesktop
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.start,
        mainAxisSize:
            sizingInformation.isDesktop ? MainAxisSize.max : MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/applicant_avatar.png"),
              const SizedBox(width: 8.0),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      "Ricardo Cooper",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          fontSize: kFontSizeXl2,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[900],
                        ),
                      ),
                    ),
                    RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: 'Applied for ',
                        style: DefaultTextStyle.of(context).style,
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Frontend Developer',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: ' on August 25, 2020'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Flexible(
            child: Flex(
              direction:
                  sizingInformation.isMobile ? Axis.vertical : Axis.horizontal,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: sizingInformation.isMobile ? double.infinity : null,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.375 * 16.0),
                      )),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 18.0, horizontal: 32.0)),
                      backgroundColor: MaterialStateProperty.resolveWith(
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
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Text("Advance to offer",
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: kFontSizeSm,
                        ))),
                  ),
                ),
                const SizedBox(width: 16.0, height: 16.0),
                SizedBox(
                  width: sizingInformation.isMobile ? double.infinity : null,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.375 * 16.0),
                      )),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 18.0, horizontal: 32.0)),
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                        const Set<MaterialState> interactiveStates =
                            <MaterialState>{
                          MaterialState.pressed,
                          MaterialState.hovered,
                          MaterialState.focused,
                        };
                        if (states.any(interactiveStates.contains)) {
                          return TWTwoColors.gray.shade50;
                        }
                        return Colors.white;
                      }),
                      foregroundColor:
                          MaterialStateProperty.all(TWTwoColors.gray.shade700),
                    ),
                    child: Text("Disqualify",
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
      );
    });
  }
}
