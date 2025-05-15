import 'package:flutter/material.dart';
import 'package:magic_view/factory.dart';

class MagicLayout extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const MagicLayout(
      {super.key,
      required this.largeScreen,
      this.mediumScreen,
      this.smallScreen});

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width <
        MagicFactory.limitSmallMediumScreen;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >
            MagicFactory.limitSmallMediumScreen &&
        MediaQuery.of(context).size.width < MagicFactory.limitMediumLargeScreen;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >
        MagicFactory.limitMediumLargeScreen;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > MagicFactory.limitMediumLargeScreen) {
          return largeScreen;
        } else if (constraints.maxWidth < MagicFactory.limitMediumLargeScreen &&
            constraints.maxWidth > MagicFactory.limitSmallMediumScreen) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}
