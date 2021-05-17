import 'package:flutter/material.dart';
import 'package:recruiting/layouts/constants.dart';
import 'package:recruiting/layouts/main_app_bar.dart';
import 'package:recruiting/layouts/max_width_container.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: MainAppBar(),
          body: LayoutBuilder(builder: (context, viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                  // minWidth: viewportConstraints.maxWidth,
                ),
                child: MaxWidthContainer(
                  maxWidth: kMaxWidthXl7,
                  child: child,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
