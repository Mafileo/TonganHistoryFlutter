import 'package:flutter/material.dart';

class About extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("The History of Tonga"),
          Text("v1.0"),
          Text("Thank you for using my app. This app is designed for users who want to learn more about the history of the Kingdom of Tonga. There will be updates in future time."),
          Text("Inspired by The History of Everything app by Google."),
          Text("Developer"),
          Text("Daniel Mafile'o"),
          Text("Animation and Graphic designer"),
          Text("Daniel Mafile'o"),
          Text("Written content"),
          Text('History Of Tonga Wikipedia')
        ],
      ),
    );
  }
}