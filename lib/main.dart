import 'package:flutter/material.dart';
import 'package:flutter_log_in/settings.dart';
import 'package:flutter_log_in/login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget{
  _LogPage createState() => new _LogPage();
}

class _LogPage extends State<MyApp> {
  
  String _title = "PLZ login";
  Widget _screen;
  login2 _login;
  settings _settings;
  bool _authenticated;

  _LogPage(){
    _login = new login2(onSubmit: (){onSubmit();});
    _settings = new settings();
    _screen = _login;
    _authenticated = false;
  }

  void onSubmit(){print(
    'Login with: ' + _login.username + ' ' + _login.password);
    //If it's the User => "user" and pass => "password", you will login
    if(_login.username == 'user' && _login.password == 'password'){
      _setAuthenticated(true);
    }
  }
  void _goHome(){ 
    print('go Home $_authenticated'); 
    setState(() {
      if(_authenticated == true) {_screen = _settings;}
      else{_screen = _login;}
    });
  }
  void _logout(){ 
    print('log out');
    _setAuthenticated(false);
  }
  void _setAuthenticated(bool auth){
    setState(() {
      if(auth == true) {
        _screen = _settings;
        _title = "welcome";
        _authenticated = true;
      }else{
        _screen = _login;
        _title = "Please Login";
        _authenticated = false;
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return new MaterialApp (
      title: "login Demo",
      home: new Scaffold (
        appBar: new AppBar(
          title: new Text(_title),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.home), onPressed: (){_goHome();},),
            new IconButton(icon: new Icon(Icons.exit_to_app), onPressed: (){_logout();},),
          ],
        ),
        body: _screen,
      ),
    );
  }
}


