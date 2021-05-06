import 'package:flutter/material.dart';

double calculateBMR(gender, weight, height, age) {
  if (gender == 0) {
    return 66 + (6.3 * weight) + (12.9 * height) - (6.8 * age);
  } else {
    return 655 + (4.3 * weight) + (4.7 * height) - (4.7 * age);
  }
}

double calculateFBMR(bmr, fitness) {
  if (fitness == 1) {
    return bmr * 1.2;
  } else if (fitness == 2) {
    return bmr * 1.375;
  } else if (fitness == 3) {
    return bmr * 1.55;
  } else if (fitness == 4) {
    return bmr * 1.725;
  } else {
    return bmr * 1.9;
  }


}
List lst = ['0', '0', '0', '0', '0', '0'];

int calculateFitness(daysActive) {
  if (daysActive <= 1) {
    return 1;
  } else if (daysActive <= 3) {
    return 2;
  } else if (daysActive <= 5) {
    return 3;
  } else if (daysActive == 6) {
    return 4;
  } else {
    return 5;
  }
}

void main() => runApp(const MyApp());

/// This is the main application widget.
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

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}
int fbmr = 0;
int fbmr2 = 0;
String text = 'Not calculated yet';
/// This is the private State class that goes with MyStatefulWidget.
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
                      Text(
                        'Male',
                      ),

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
          var sgender = lst[4]; // A string
          var gender = int.parse(sgender);
          var sweight = lst[2];
          var weight = int.parse(sweight);
          var sheight = lst[1];
          var height = int.parse(sheight);
          var sage = lst[0];
          var age = int.parse(sage);
          var bmr = calculateBMR(gender, weight, height, age);
          var sdaysActive = lst[3];
          var daysActive = int.parse(sdaysActive);
          var fitness = calculateFitness(daysActive);
          @override
          int fbmr = calculateFBMR(bmr, fitness).round();
          fbmr2 = fbmr;
          calculate(fbmr);
          lst[5] = fbmr;
          print('Your daily calorie need is ${fbmr.round()} calories.');
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
class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}

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
                    print(lst);

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
