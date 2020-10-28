import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());
enum Gender { MALE, FEMALE }
enum Age { YES, NO }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _hcontroller = TextEditingController();
  final TextEditingController _wcontroller = TextEditingController();
  double h = 0.0,
      w = 0.0,
      result1 = 0.0,
      result2 = 0.0,
      result3 = 0.0,
      resultx = 0.0,
      resulty = 0.0;

  Gender _genderValue = Gender.MALE;
  Age _ageValue = Age.YES;

  clearTextInput() {
    _hcontroller.clear();
    _wcontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Lean Body Mass Calculator'),
            ),
            resizeToAvoidBottomPadding: false,
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Gender",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FlatButton.icon(
                        label: const Text('Male'),
                        icon: Radio(
                          value: Gender.MALE,
                          groupValue: _genderValue,
                          onChanged: (Gender value) {
                            setState(() {
                              _genderValue = value;
                            });
                          },
                        ),
                        onPressed: () {
                          setState(() {
                            _genderValue = Gender.MALE;
                          });
                        },
                      ),
                      FlatButton.icon(
                        label: const Text('Female'),
                        icon: Radio(
                          value: Gender.FEMALE,
                          groupValue: _genderValue,
                          onChanged: (Gender value) {
                            setState(() {
                              _genderValue = value;
                            });
                          },
                        ),
                        onPressed: () {
                          setState(() {
                            _genderValue = Gender.FEMALE;
                          });
                        },
                      ),
                    ],
                  ),

                  Text(
                    "Age 14 or younger?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FlatButton.icon(
                        label: const Text('Yes'),
                        icon: Radio(
                          value: Age.YES,
                          groupValue: _ageValue,
                          onChanged: (Age value) {
                            setState(() {
                              _ageValue = value;
                            });
                          },
                        ),
                        onPressed: () {
                          setState(() {
                            _ageValue = Age.YES;
                          });
                        },
                      ),
                      FlatButton.icon(
                        label: const Text('No'),
                        icon: Radio(
                          value: Age.NO,
                          groupValue: _ageValue,
                          onChanged: (Age value) {
                            setState(() {
                              _ageValue = value;
                            });
                          },
                        ),
                        onPressed: () {
                          setState(() {
                            _ageValue = Age.NO;
                          });
                        },
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: TextField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: "Height (cm)",
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: _hcontroller,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: TextField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: "Weight (kg)",
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: _wcontroller,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: RaisedButton(
                          color: Colors.green,
                          textColor: Colors.white,
                          child: Text("Calculate"),
                          onPressed: _calculate,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: RaisedButton(
                          child: Text("Clear"),
                          onPressed: clearTextInput,
                        ),
                      ),
                    ],
                  ),
                  //Text("Result: $result"),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 25, 50, 15),
                    child: Text(
                      "Result: ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 50, 5),
                    child: Text(
                      "The lean body mass based on different formulas: ",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                  ),
                  Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Table(
                        defaultColumnWidth: FixedColumnWidth(150.0),
                        border: TableBorder.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 2),
                        children: [
                          TableRow(children: [
                            Column(children: [
                              Text('Formula',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold))
                            ]),
                            Column(children: [
                              Text('Lean Body Mass',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold))
                            ]),
                          ]),
                          TableRow(children: [
                            Column(children: [Text('Boer')]),
                            Column(children: [
                              Text(result1.toStringAsFixed(1) + " kg")
                            ]),
                          ]),
                          TableRow(children: [
                            Column(children: [Text('James')]),
                            Column(children: [
                              Text(result2.toStringAsFixed(1) + " kg")
                            ]),
                          ]),
                          TableRow(children: [
                            Column(children: [Text('Hume')]),
                            Column(children: [
                              Text(result3.toStringAsFixed(1) + " kg")
                            ]),
                          ]),
                          TableRow(children: [
                            Column(children: [Text('Peters')]),
                            Column(children: [
                              Text(resulty.toStringAsFixed(1) + " kg")
                            ]),
                          ]),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 50, 10),
                      child: Text(
                        "* Peters formula is only for children.",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ]),
                ])));
  }

  void _calculate() {
    setState(() {
      h = double.parse(_hcontroller.text);
      w = double.parse(_wcontroller.text);

      if (_genderValue == Gender.MALE && _ageValue == Age.NO) {
        result1 = 0.407 * w + 0.267 * h - 19.2;
        result2 = 1.1 * w - 128 * (w / h) * (w / h);
        result3 = 0.32810 * w + 0.33929 * h - 29.5336;
        resulty = 0.0;
      } else if (_genderValue == Gender.FEMALE && _ageValue == Age.NO) {
        result1 = 0.252 * w + 0.473 * h - 48.3;
        result2 = 1.07 * w - 148 * (w / h) * (w / h);
        result3 = 0.29569 * w + 0.41813 * h - 43.2933;
        resulty = 0.0;
      } else if (_genderValue == Gender.MALE && _ageValue == Age.YES) {
        result1 = 0.407 * w + 0.267 * h - 19.2;
        result2 = 1.1 * w - 128 * (w / h) * (w / h);
        result3 = 0.32810 * w + 0.33929 * h - 29.5336;
        resultx = 0.0215 * pow(w, 0.6469) * pow(h, 0.7236);
        resulty = 3.8 * resultx;
      } else if (_genderValue == Gender.FEMALE && _ageValue == Age.YES) {
        result1 = 0.252 * w + 0.473 * h - 48.3;
        result2 = 1.07 * w - 148 * (w / h) * (w / h);
        result3 = 0.29569 * w + 0.41813 * h - 43.2933;
        resultx = 0.0215 * pow(w, 0.6469) * pow(h, 0.7236);
        resulty = 3.8 * resultx;
      } 
      //else if (_hcontroller.isEmpty){
      //print ('Please provide a valid height value. Please provide a valid weight value.');
      //}
    });
  }
}
