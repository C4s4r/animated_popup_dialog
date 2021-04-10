library animated_popup_dialog;

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:motion_widget/motion_widget.dart';
import './widgets/custom_textfield.dart';

enum PopupMode { Child, Text, Textfield }

class AnimatedPopupDialog extends StatelessWidget {
  PopupMode mode;

  /// Manually set the `width` value of the PopupDialog.
  /// If null, 30% of the available width are used.
  double width;

  /// The widget displayed inside the PopupDialog
  Widget child;

  /// When using `AnimatedPopupDialog.text()` or `AnimatedPopupDialog.textfield()`,
  /// this sets the title text of the PopupDialog.
  String title;

  /// When using `AnimatedPopupDialog.text()`, this sets the content text of the PopupDialog.
  String description;

  /// When using `AnimatedPopupDialog.textfield()`, this sets the hint text of the textfield.
  String textFieldText;

  /// Manually set the text within the button.
  String buttonText;

  /// Wether to use the PopupDialog with a transition or not.
  final bool useWithTransition;

  AnimatedPopupDialog({
    this.width,
    @required this.child,
    this.buttonText = 'Close',
    this.useWithTransition = true,
  }) {
    mode = PopupMode.Child;
  }

  AnimatedPopupDialog.text({
    this.width,
    @required this.title,
    @required this.description,
    this.buttonText = 'Close',
    this.useWithTransition = true,
  }) {
    mode = PopupMode.Text;
  }

  AnimatedPopupDialog.textfield({
    this.width,
    @required this.title,
    @required this.textFieldText,
    this.buttonText = 'Close',
    this.useWithTransition = true,
  }) {
    mode = PopupMode.Textfield;
  }

  CustomTextField textField;
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    if (mode == PopupMode.Textfield)
      textField = CustomTextField(
        textFieldController: this.textFieldController,
        textFieldText: this.textFieldText,
      );

    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          // Background-Gradient
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  radius: 1,
                  center: Alignment.center,
                  colors: [
                    Colors.grey.withOpacity(0.8),
                    //Color.fromRGBO(53, 53, 53, 0.40),
                    Colors.white.withOpacity(0)
                    //Color.fromRGBO(206, 206, 206, 0.36),
                  ],
                ),
              ),
            ),
          ),
          // Content
          Motion<Column>(
            mainAxisAlignment: MainAxisAlignment.center,
            durationMs: 900,
            children: [
              MotionElement(
                mode: MotionMode.TRANSLATE,
                interval: Interval(0, 1, curve: Curves.elasticOut),
                displacement: useWithTransition ? 50 : 0,
                child: Center(
                  child: Container(
                    width: width == null ? media.size.width * 0.3 : width,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.16), blurRadius: 20, offset: Offset(0, 3))
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (mode == PopupMode.Child) child,
                        // Title
                        if (mode == PopupMode.Text || mode == PopupMode.Textfield)
                          Padding(
                            padding: EdgeInsets.only(bottom: 20, top: 10),
                            child: Text(
                              title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(color: Color.fromRGBO(51, 51, 51, 1), fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        // Text
                        if (mode == PopupMode.Text)
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Text(
                              description,
                              style:
                                  Theme.of(context).textTheme.bodyText2.copyWith(color: Color.fromRGBO(51, 51, 51, 1)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        // TextField
                        if (mode == PopupMode.Textfield) textField,
                        // Button
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            ),
                            onPressed: () {
                              if (mode == PopupMode.Textfield) {
                                Navigator.pop(context, textFieldController.value.text);
                              } else {
                                Navigator.pop(context);
                              }
                            },
                            child: Text(buttonText),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
