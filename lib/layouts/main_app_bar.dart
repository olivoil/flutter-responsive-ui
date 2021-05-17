import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recruiting/layouts/constants.dart';
import 'package:recruiting/layouts/max_width_container.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double _preferredHeight = 109.0;

  @override
  Widget build(BuildContext context) {
    final boxShadow = [
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.1),
        offset: Offset(0.0, 1.0),
        blurRadius: 3.0,
      ),
    ];

    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Container(
        height: _preferredHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: boxShadow,
        ),
        child: MaxWidthContainer(
          maxWidth: kMaxWidthXl7,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/logo.png"),
                        if ([DeviceScreenType.desktop]
                            .contains(sizingInformation.deviceScreenType)) ...[
                          const SizedBox(width: 16.0),
                          Text(
                            "Dashboard",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: Colors.grey[900],
                                fontSize: kFontSizeSm,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          Text(
                            "Jobs",
                            style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: kFontSizeSm,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          Text(
                            "Applicants",
                            style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: kFontSizeSm,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          Text(
                            "Company",
                            style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: kFontSizeSm,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ]
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Image.asset(
                              "assets/images/notification_icon.png"),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Image.asset("assets/images/avatar.png"),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Divider(
                    height: 16.0,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (sizingInformation.isMobile) ...[
                      Image.asset("assets/images/arrow_narrow_left.png"),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        "Back to Applicants",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: Colors.grey[700],
                            fontSize: kFontSizeSm,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                    if (sizingInformation.isDesktop ||
                        sizingInformation.isTablet) ...[
                      Image.asset("assets/images/home.png"),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        "/",
                        style: TextStyle(
                          color: Colors.grey[400],
                        ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        "Jobs",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: Colors.grey[500],
                            fontSize: kFontSizeSm,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        "/",
                        style: TextStyle(
                          color: Colors.grey[400],
                        ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        "Front End Developer",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: Colors.grey[500],
                            fontSize: kFontSizeSm,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        "/",
                        style: TextStyle(
                          color: Colors.grey[400],
                        ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        "Applicants",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: Colors.grey[500],
                            fontSize: kFontSizeSm,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ]
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  Size get preferredSize => Size.fromHeight(_preferredHeight);
}
