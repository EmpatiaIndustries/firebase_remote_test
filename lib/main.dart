import 'package:flutter/material.dart';

void main() => runApp(FirebaseRemoteApp());

class FirebaseRemoteApp extends StatefulWidget {
  final List<String> _colors = [
    'Verde',
    'Rojo',
    'Azul',
    'Lila',
  ];

  final TextStyle _styleForColor = new TextStyle(
      fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white);

  final TextStyle _styleForLetter = new TextStyle(
      fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  State<StatefulWidget> createState() => _FirebaseRemoteAppState();
}

class _FirebaseRemoteAppState extends State<FirebaseRemoteApp> {
  int _position = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Remote App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firebase Remote Test'),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        backgroundColor: _backgroundColor(),
        body: Center(
          child: Container(child: _colorName()),
        ),
        floatingActionButton: _nextButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget _colorName() {
    String _selectedColor = widget._colors[_position];
    String _letter = 'A';
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('$_selectedColor', style: widget._styleForColor),
        Divider(),
        Text('$_letter', style: widget._styleForLetter),
      ],
    ));
  }

  Widget _nextButton() {
    return FloatingActionButton(
      onPressed: this._nextColor,
      backgroundColor: Colors.black,
      child: Icon(Icons.autorenew_outlined),
    );
  }

  Color _backgroundColor() {
    String _color = widget._colors[_position];

    switch (_color) {
      case 'Verde':
        return Colors.green;
      case 'Rojo':
        return Colors.red;
      case 'Azul':
        return Colors.blue;
      case 'Lila':
        return Colors.deepPurple;
      default:
        return Colors.black;
    }
  }

  void _nextColor() {
    if (_position == 3) {
      setState(() {
        _position = 0;
      });
    } else {
      setState(() {
        _position = _position + 1;
      });
    }
  }
}
