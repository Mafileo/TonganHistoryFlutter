import 'package:flutter/material.dart';

class About extends StatelessWidget {
  Widget title(String s) {
    return Text(
      s,
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black54),
    );
  }

  Widget text(String s) {
    return Text(
      s,
      style: TextStyle(fontSize: 15, color: Colors.black54),
    );
  }

  Widget spacer() {
    return SizedBox(
      height: 25,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            Text(
              "The History of Tonga",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black
              ),
            ),
            spacer(),
            text("v1.0"),
            spacer(),
            text(
                "Thank you for using my app. This app is designed for users who want to learn more about the history of the Kingdom of Tonga. There will be updates in future time."),
            text("Inspired by The History of Everything app by Google."),
            spacer(),
            title("Developer"),
            text("Daniel Mafile'o"),
            spacer(),
            title("Animation and Graphic designer"),
            text("Daniel Mafile'o"),
            spacer(),
            title("Written content"),
            text('History Of Tonga Wikipedia')
          ],
        ),
      ),
    );
  }
}
