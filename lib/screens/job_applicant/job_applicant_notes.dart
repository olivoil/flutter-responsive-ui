import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recruiting/layouts/constants.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tailwind_colors/tailwind_colors.dart';
import 'package:timeago/timeago.dart' as timeago;

class JobApplicantNotes extends StatelessWidget {
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
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Notes",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontSize: kFontSizeLg,
                      fontWeight: FontWeight.w500,
                      color: TWTwoColors.gray.shade900,
                    ),
                  ),
                ),
              ),
              Divider(
                color: TWTwoColors.gray.shade200,
                height: 34.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 24.0,
                  bottom: 24.0,
                  left: 24.0,
                ),
                child: JobApplicantNotesList(),
              ),
              JobApplicantNewNote(),
            ],
          ),
        ),
      );
    });
  }
}

class JobApplicantNotesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        JobApplicantNotesListItem(
          date: DateTime.parse("2021-03-12T16:04:00Z"),
          text:
              "Ducimus quas delectus ad maxime totam doloribus reiciendis ex. Tempore dolorem maiores. Similique voluptatibus tempore non ut.",
          name: "Alicia Edwards",
          avatar: "assets/images/avatar_alicia_edwards.png",
        ),
        const SizedBox(height: 32.0),
        JobApplicantNotesListItem(
          date: DateTime.parse("2021-03-12T18:04:00Z"),
          text:
              "Et ut autem. Voluptatem eum dolores sint necessitatibus quos. Quis eum qui dolorem accusantium voluptas voluptatem ipsum. Quo facere iusto quia accusamus veniam id explicabo et aut.",
          name: "Tom Warner",
          avatar: "assets/images/avatar_tom_warner.png",
        ),
        const SizedBox(height: 32.0),
        JobApplicantNotesListItem(
          date: DateTime.parse("2021-03-13T11:04:00Z"),
          text:
              "Expedita consequatur sit ea voluptas quo ipsam recusandae. Ab sint et voluptatem repudiandae voluptatem et eveniet. Nihil quas consequatur autem. Perferendis rerum et.",
          name: "Kirsten Watson",
          avatar: "assets/images/avatar_kirsten_watson.png",
        ),
      ],
    );
  }
}

class JobApplicantNotesListItem extends StatelessWidget {
  const JobApplicantNotesListItem(
      {Key? key,
      required this.date,
      required this.text,
      required this.name,
      required this.avatar})
      : super(key: key);

  final DateTime date;
  final String text;
  final String name;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Image.asset(
              avatar,
              width: 40.0,
              height: 40.0,
            ),
          ],
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: kFontSizeSm,
                    fontWeight: FontWeight.w500,
                    color: TWTwoColors.gray.shade900,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                text,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: kFontSizeSm,
                    fontWeight: FontWeight.normal,
                    color: TWTwoColors.gray.shade700,
                  ),
                ),
              ),
              const SizedBox(height: 4.0),
              Row(
                children: [
                  Text(
                    timeago.format(date),
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: kFontSizeSm,
                        fontWeight: FontWeight.w500,
                        color: TWTwoColors.gray.shade500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Container(
                    width: 2.0,
                    height: 2.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorderRadiusFull),
                      color: TWTwoColors.gray.shade900,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // ignore: avoid_print
                      print('reply pressed');
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color?>(Colors.transparent),
                      overlayColor:
                          MaterialStateProperty.all<Color?>(Colors.transparent),
                      foregroundColor: MaterialStateProperty.all<Color>(
                          TWTwoColors.gray.shade900),
                    ),
                    child: Text(
                      "Reply",
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: kFontSizeSm,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class JobApplicantNewNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TWTwoColors.gray.shade50,
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/images/avatar_whitney_francis.png",
                  width: 40.0,
                  height: 40.0,
                ),
              ],
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    minLines: 4,
                    maxLines: 8,
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        fontSize: kFontSizeSm,
                      ),
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Add a note',
                      contentPadding: const EdgeInsets.all(14.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: TWTwoColors.blue.shade500),
                        borderRadius: BorderRadius.circular(kBorderRadiusMd),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: TWTwoColors.gray.shade300),
                        borderRadius: BorderRadius.circular(kBorderRadiusMd),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/question_mark.png",
                            width: 20.0,
                            height: 20.0,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            "Markdown is okay.",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: kFontSizeSm,
                                color: TWTwoColors.gray.shade500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        child: Text(
                          "Comment",
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: kFontSizeSm,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
