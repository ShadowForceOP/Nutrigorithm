import 'package:flutter/material.dart';
import 'cards.dart';
import 'calculator.dart';

List lst = ['0', '0', '0', '0', '0', '0'];
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}


class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}


class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _fbmr = 0;
  TextEditingController controller;
  TextEditingController controller2;
  TextEditingController controller3;
  TextEditingController controller4;
  TextEditingController controller5;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();
    controller4 = TextEditingController();
    controller5 = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    super.dispose();
  }

  void clearText() {
    controller.clear();
    controller2.clear();
    controller3.clear();
    controller4.clear();
    controller5.clear();
    _fbmr = 0;
    calculate(_fbmr);
  }
  List<bool> _selections = List.generate(2, (_) => false);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your age in years',
                  ),
                  controller: controller,
                ),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your height in inches',
                  ),
                  controller: controller2,
                ),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your weight in pounds',
                  ),
                  controller: controller3,
                ),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter how many times a week you exercise',
                  ),
                  controller: controller4,
                ),),
              Container(
                height: 30,
                child: Center(
                  child: Text(
                    'What gender are you?',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                  child: ToggleButtons(
                    children: <Widget>[
                      Text('Male',),
                      Text('Female',)
                    ],
                    isSelected: _selections,
                    onPressed: (int index) {
                      setState(() {
                        if (_selections[0] == _selections[1]) {
                          _selections[index] = !_selections[index];
                        }
                        else if (index == 0) {
                          _selections[0] = !_selections[0];
                          _selections[1] = !_selections[1];
                          lst[4] = '1';
                        } else {
                          _selections[1] = !_selections[1];
                          _selections[0] = !_selections[0];
                          lst[4] = '0';
                        }
                      });
                    },
                  )),
              Container(
                height: 45,
                child: Center(
                  child: Text(
                    '$_fbmr calories needed per day',
                    style: TextStyle(color: Colors.black, fontSize: 40,),
                  ),
                ),
              ),
              Padding (
                  padding: EdgeInsets.all(75),
                  child:
                  ElevatedButton(
                    child: Text('Reset Form'),
                    onPressed: () {
                      clearText();
                    },style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                    onSurface: Colors.grey,
                  ),
                  )
              )
            ],)
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondRoute()),
          );
          lst[0]= (controller.text);
          lst[1]= (controller2.text);
          lst[2]= (controller3.text);
          lst[3]= (controller4.text);
          calculate(fbmr);
        },
        label: const Text ('Calculate calorie needs'),
        tooltip: 'Calculate your average calorie needs per day',
      ), floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
  void calculate(int fbmr) {
    setState(() {
      _fbmr = fbmr;
    });
  }
}


