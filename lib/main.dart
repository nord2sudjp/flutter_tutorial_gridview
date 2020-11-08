import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateful',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateful'),
        ),
        body: Center(
          //child: ClickGood(),
          //child: ChangeForm(),
          child: DropDown(),
        ),
      ),
    );
  }
}

class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {

  String _defaultValue = 'りんご';
  List<String> _list = <String>['りんご', 'オレンジ', 'みかん', 'ぶどう'];
  String _text = '';

  void _handleChange(String newValue) {
    setState(() {
      _text = newValue;
      _defaultValue = newValue;
    });
  }

  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: <Widget>[
            Text(
              "$_text",
              style: TextStyle(
                  color:Colors.blueAccent,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500
              ),
            ),
            DropdownButton<String>(
              value: _defaultValue,
              onChanged: _handleChange,
              items: _list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        )
    );
  }
}

class ChangeForm extends StatefulWidget {
  @override
  _ChangeFormState createState() => _ChangeFormState();
}

class _ChangeFormState extends State<ChangeForm> {
  int _count = 0;

  void _handlePressed() {
    setState(() { //クリックするとカウントアップ
      _count++;
    });
  }

  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: <Widget>[
            Text(
              "$_count", //これでcountを表示する
              style: TextStyle(
                  color:Colors.blueAccent,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500
              ),
            ),
            FlatButton(
              onPressed: _handlePressed, // 押すと_handlePressedを呼び出す
              color: Colors.blue,
              child: Text(
                '更新',
                style: TextStyle(
                    color:Colors.white,
                    fontSize: 20.0
                ),
              ),
            )
          ],
        )
    );
  }
}

class ClickGood extends StatefulWidget {
  @override
  _ClickGoodState createState() => _ClickGoodState();
}

class _ClickGoodState extends State<ClickGood> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _handleTap,
        child: Container(
          child: Column(
              children: <Widget>[
                Container(
                  child: Center(
                    child: new Icon(
                      Icons.thumb_up,
                      color: _active ? Colors.orange[700] : Colors.grey[500],
                      size: 100.0,
                    ),
                  ),
                  width: 200.0,
                  height: 200.0,
                ),
                Container(
                  child: Center(
                    child: Text(
                      _active ? 'Active' : 'Inactive',
                      style: TextStyle(fontSize: 32.0, color: Colors.white),
                    ),
                  ),
                  width: 200.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: _active ? Colors.orange[700] : Colors.grey[600],
                  ),
                ),
              ]
          ),
        )
    );
  }
}