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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                child: Text('Popup with child'),
                onPressed: () {
                  Navigator.of(context).push(PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (context, _, __) {
                      return AnimatedPopupDialog(
                        child: Icon(Icons.access_alarm),
                      );
                    },
                  ));
                },
              ),
              ElevatedButton(
                child: Text('Popup with text'),
                onPressed: () {
                  Navigator.of(context).push(PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (context, _, __) {
                      return AnimatedPopupDialog.text(
                        title: 'AnimatedPopupDialog',
                        description:
                            'For details regarding the use of the package, see https://github.com/C4s4r/animated_popup_dialog',
                      );
                    },
                  ));
                },
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
