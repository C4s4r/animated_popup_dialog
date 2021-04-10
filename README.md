# Animated Popup Dialog
[![GitHub last commit](https://img.shields.io/github/last-commit/C4s4r/animated_popup_dialog?label=last%20updated)](https://github.com/C4s4r/animated_popup_dialog)
[![GitHub](https://img.shields.io/github/license/C4s4r/animated_popup_dialog)](https://opensource.org/licenses/BSD-3-Clause)


A package that provides an animated dialog to display a child, text or textfield in a modern look.

## Getting Started

As usual, begin by adding the package to your pubspec.yaml file, see [install instruction](https://pub.dev/packages/animated_popup_dialog/install).

Here is a basic setup with the Animated Popup Dialog:
```dart
import 'package:flutter/material.dart';
import 'package:animated_popup_dialog/animated_popup_dialog.dart';

class GettingStartedExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Popup with text'),
          onPressed: () {
            Navigator.of(context).push(PageRouteBuilder(
              opaque: false, // needed for transparent background
              pageBuilder: (context, _, __) {
                return AnimatedPopupDialog.text(
                  title: 'Title',
                  description:
                      'For details regarding fonts see ...',
                );
              },
            ));
          },
        ),
      ),
    );
  }
}

```

## Different types of the PopupDialog
You can use one of the following modes:
* **`AnimatedPopupDialog()`**: Creates a PopupDialog that allows to place any widget you want as a child.
* **`AnimatedPopupDialog.text()`**: Creates a PopupDialog with a title and a description.
* **`AnimatedPopupDialog.textfield()`**: Creates a PopupDialog with a title and a textfield.

## Getting the return of the textfield
To get the textfield value when the PopupDialog is closed, use as following:
```dart
ElevatedButton(
  child: Text('Popup with textfield'),
  onPressed: () async {
    String result = await Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      pageBuilder: (context, _, __) {
        return AnimatedPopupDialog.textfield(
          title: 'Title',
          textFieldText: 'textFieldText',
        );
      },
    ));
  },
),
```
