import 'package:flutter/material.dart';
class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Index Cards'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent[400],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // BUTTON !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
              Padding (
                padding: EdgeInsets.symmetric(vertical: 20.0),
              ),
              ButtonTheme(
                minWidth: 350.0,
                height: 200.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("test"),
                ),
              ),
              Padding (
                padding: EdgeInsets.symmetric(vertical: 8.0),
              ),
              ButtonTheme(
                minWidth: 350.0,
                height: 200.0,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("test2"),
                ),
              ),
              Padding (
                padding: EdgeInsets.symmetric(vertical: 8.0),
              ),
              ButtonTheme(
                minWidth: 350.0,
                height: 200.0,
                child: RaisedButton(
                  onPressed: () {
                  },
                  child: Text("test3"),
                ),
              ),
              Padding (
                padding: EdgeInsets.symmetric(vertical: 8.0),
              ),
              ButtonTheme(
                minWidth: 350.0,
                height: 200.0,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("test4"),
                ),
              ),
            ],
          ), ),
      ),
    );
  }
}
