// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:magic_view/factory.dart';

class MagicDialog extends StatefulWidget {
  final Widget child;

  double? maxHeight;
  Color? background;
  double? elevation;
  double? padding;
  double? cornerRadius;

  /// Jika false, child tidak dibungkus [SingleChildScrollView].
  final bool scrollable;

  MagicDialog(
      {super.key,
      required this.child,
      this.maxHeight,
      this.background,
      this.elevation,
      this.padding,
      this.cornerRadius,
      this.scrollable = true});

  @override
  State<StatefulWidget> createState() => MagicDialogState();
}

class MagicDialogState extends State<MagicDialog> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double deviceWidth = MediaQuery.of(context).size.width;
      double width = MediaQuery.of(context).size.width;
      if (deviceWidth > MagicFactory.limitMediumLargeScreen) {
        width = 600;
      } else if (deviceWidth > MagicFactory.limitSmallMediumScreen) {
        width = 600;
      } else {
        width = width - 40;
      }

      double deviceHeight = MediaQuery.of(context).size.height;
      final dialogMaxHeight = widget.maxHeight ?? deviceHeight - 100;

      return Center(
        child: Container(
          margin: MediaQuery.of(context).viewInsets,
          constraints: BoxConstraints(
              maxWidth: width,
              minHeight: 10,
              maxHeight: dialogMaxHeight),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.cornerRadius ?? 16),
            ),
            elevation: widget.elevation,
            color: widget.background ?? Colors.white,
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: widget.scrollable
                  ? SingleChildScrollView(
                      child: Wrap(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(widget.padding ?? 16.0),
                            child: widget.child,
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.all(widget.padding ?? 16.0),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: dialogMaxHeight -
                              (widget.padding ?? 16.0) * 2,
                        ),
                        child: widget.child,
                      ),
                    ),
            ),
          ),
        ),
      );
    });
  }
}
