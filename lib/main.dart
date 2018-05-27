import 'package:flutter/material.dart';
import 'package:loginapp/settings.dart';
import 'package:loginapp/login.dart';
import 'package:loginapp/screens/home.dart';
import 'package:loginapp/screens/second.dart';
import 'package:loginapp/screens/third.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _title = 'Please Login';
  Widget _screen;
  Login _login;
  Settings _settings;
  Home _home;
  Second _second;
  Third _third;
  bool _authenticated;

  _MyAppState() {
    _login = new Login(
      onSubmit: () {
        onSubmit();
      },
    );
    _settings = new Settings();
    _screen = _login;
    _authenticated = false;

    _home = new Home();
    _second = new Second();
    _third = new Third();
  }

  void onSubmit() {
    print('Login with:' + _login.username + ' ' + _login.password);
    if (_login.username == 'user' && _login.password == 'password') {
      _setAuthenticated(true);
    }
  }

  void _goHome() {
    print('goHome');
    setState(() {
      if (_authenticated == true) {
        _screen = _settings;
      } else {
        _screen = _login;
      }
    });
  }

  void _logout() {
    print('_logout');
    _setAuthenticated(false);
  }

  void _setAuthenticated(bool auth) {
    setState(() {
      if (auth == true) {
        _screen = _settings;
        _title = 'Welcome';
        _authenticated = true;
      } else {
        _screen = _login;
        _title = 'Please login';
        _authenticated = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Login',
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => _home,
        '/Second': (BuildContext context) => _second,
        '/Third': (BuildContext context) => _third
      },
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(_title),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.home),
                onPressed: () {
                  _goHome();
                }),
            new IconButton(
                icon: new Icon(Icons.exit_to_app),
                onPressed: () {
                  _logout();
                }),
          ],
        ),
        body: _screen,
      ),
    );
  }
}
