import 'package:flutter/material.dart';

class Third extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Third'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text('This Third Screen'),
              new RaisedButton(
                child: new Text('Back'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new RaisedButton(
                child: new Text('Home'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/Home');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
