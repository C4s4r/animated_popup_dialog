import 'package:flutter/material.dart';
import 'package:animated_popup_dialog/animated_popup_dialog.dart';

void main() {
  runApp(AnimatedPopupDialogExample());
}

class AnimatedPopupDialogExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimatedPopupDialog Example',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'AnimatedPopupDialog Example'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showPopup1 = false;
  bool showPopup2 = false;
  bool showPopup3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          // Buttons
          Center(
            child: SizedBox(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    child: Text('Popup with child'),
                    onPressed: () => setState(() => showPopup1 = !showPopup1),
                  ),
                  ElevatedButton(
                    child: Text('Popup with text'),
                    onPressed: () => setState(() => showPopup2 = !showPopup2),
                  ),
                  ElevatedButton(
                    child: Text('Popup with textfield'),
                    onPressed: () => setState(() => showPopup3 = !showPopup3),
                  ),
                ],
              ),
            ),
          ),
          // Popups
          if (showPopup1)
            AnimatedPopupDialog(
              child: Icon(Icons.access_alarm),
              closeHandler: () => setState(() => showPopup1 = !showPopup1),
            ),
          if (showPopup2)
            AnimatedPopupDialog.text(
              title: 'Title',
              text:
                  'For details regarding fonts from package dependencies, see https://flutter.dev/custom-fonts/#from-packages',
              closeHandler: () => setState(() => showPopup2 = !showPopup2),
            ),
          if (showPopup3)
            AnimatedPopupDialog.textfield(
              title: 'Title',
              textFieldText: 'textFieldText',
              closeHandler: () => setState(() => showPopup3 = !showPopup3),
            ),
        ],
      ),
    );
  }
}
