import 'package:flutter/material.dart';
import 'settings.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget{
  _LogPage createState() => new _LogPage();
}

class _LogPage extends State<MyApp> {
  
  String _title = "PLZ login";

  @override
  Widget build(BuildContext context){
    return new MaterialApp (
      title: "login Demo",
      home: new Scaffold (
        appBar: new AppBar(
          title: new Text(_title),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.home), onPressed: null,),
            new IconButton(icon: new Icon(Icons.exit_to_app), onPressed: null,),
          ],
        ),
        body: new settings(),
      ),
    );
  }
}


