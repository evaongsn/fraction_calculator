import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String dropdownMath = '+';
  final TextEditingController _number1 = TextEditingController();
  final TextEditingController _number2 = TextEditingController();
  final TextEditingController _number3 = TextEditingController();
  final TextEditingController _number4 = TextEditingController();
  String resultformat = '';
  double fraction1 = 0.0;
  double fraction2 = 0.0;
  double fraction3 = 0.0;
  double fraction4 = 0.0;
  double result = 0.0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.blue[50],
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[400],
          title: Text('Fraction Calculator'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(150, 2, 150, 2),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 25,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueGrey[400])),
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: _number1,
                      autofocus: false,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(150, 2, 150, 2),
                    child: Divider(
                      color: Colors.blueGrey[400],
                      thickness: 3,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(150, 2, 150, 2),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 25,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueGrey[400])),
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: _number2,
                      autofocus: false,
                    ),
                  ),
                ],
              ),
              Container(
                child: DropdownButton<String>(
                    value: dropdownMath,
                    style: TextStyle(fontSize: 30, color: Colors.black),
                    iconSize: 30,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownMath = newValue;
                      });
                    },
                    items: <String>['+', '-', '*', '/']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value, child: Text(value));
                    }).toList()),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(150, 2, 150, 2),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 25,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueGrey[400])),
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: _number3,
                      autofocus: false,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(150, 2, 150, 2),
                    child: Divider(
                      color: Colors.blueGrey[400],
                      thickness: 3,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(150, 2, 150, 2),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 25,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueGrey[400])),
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: _number4,
                      autofocus: false,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: MaterialButton(
                      color: Colors.blueGrey[600],
                      child: Text(
                        "Calculate",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onPressed: _onPress,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: FlatButton(
                      color: Colors.grey[600],
                      child: Text('Clear'),
                      onPressed: () {
                        _number1.clear();
                        _number2.clear();
                        _number3.clear();
                        _number4.clear();
                      },
                    ),
                  ),
                ],
              ),
              Text(
                'Result: $resultformat',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPress() {
    setState(() {
      fraction1 = double.parse(_number1.text);
      fraction2 = double.parse(_number2.text);
      fraction3 = double.parse(_number3.text);
      fraction4 = double.parse(_number4.text);
      if (dropdownMath == '+') {
        result = (fraction1 / fraction2) + (fraction3 / fraction4);
      } else if (dropdownMath == '-') {
        result = (fraction1 / fraction2) - (fraction3 / fraction4);
      } else if (dropdownMath == '*') {
        result = (fraction1 / fraction2) * (fraction3 / fraction4);
      } else if (dropdownMath == '/') {
        result = (fraction1 / fraction2) / (fraction3 / fraction4);
      }
      resultformat = format(result);
    });
  }

  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }
}
