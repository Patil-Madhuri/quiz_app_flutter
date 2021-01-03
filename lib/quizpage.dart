import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:demo/result.dart';
import 'package:flutter/material.dart';

class LoadJson extends StatelessWidget {
  String langname;
  LoadJson(this.langname);
  String assettoload;

  // a function
  // sets the asset to a particular JSON file
  // and opens the JSON
  setasset() {
    if (langname == "Python") {
      assettoload = "assets/files/python.json";
    } else if (langname == "Java") {
      assettoload = "assets/files/java.json";
    } else if (langname == "Javascript") {
      assettoload = "assets/files/js.json";
    } else  {
      assettoload = "assets/files/cpp.json";
    } 
    debugPrint("assettoload=" + assettoload);
  }

  @override
  Widget build(BuildContext context) {
    setasset();
    return Scaffold(
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString(assettoload),
        builder: (context, snapshot) {
          List mydata = json.decode(snapshot.data.toString());
          if (mydata == null) {
            return Center(
              child: Text("Loading..."),
            );
          } else {
            return QuizPage(data: mydata);
          }
        },
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  final data;
  QuizPage({Key key, @required this.data}) : super(key: key);
  @override
  _QuizPageState createState() => _QuizPageState(data: data);
}

class _QuizPageState extends State<QuizPage> {
  List data;
  _QuizPageState({this.data});
  int i = 1;
  int marks = 0;
  int timer = 30;
  bool canceltimer = false;
  String showtimer = "";
  Color colortoshow = Colors.cyan;
  Color right = Colors.green;
  Color wrong = Colors.red;
  Map<String, Color> btncolor = {
    "a": Colors.cyan,
    "b": Colors.cyan,
    "c": Colors.cyan,
    "d": Colors.cyan,
  };
  var randomArray;

  @override
  void initState() {
    super.initState();
    // genrandomarray();
    starttimer();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  // genrandomarray() {
  //   var distinctIds = [];
  //   var rand = new Random();
  //   for (int i = 0;;) {
  //     distinctIds.add(rand.nextInt(10));
  //     randomArray = distinctIds.toSet().toList();
  //     if (randomArray.length < 10) {
  //       continue;
  //     } else {
  //       break;
  //     }
  //   }
  //   print(randomArray);
  // }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  void nextquestion() {
    canceltimer = false;
    timer = 30;
    setState(() {
      if (i < 10) {
        i++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ResultPage(marks: marks),
        ));
      }
      btncolor["a"] = Colors.cyan;
      btncolor["b"] = Colors.cyan;
      btncolor["c"] = Colors.cyan;
      btncolor["d"] = Colors.cyan;
      // disableAnswer = false;
    });
    starttimer();
  }

  void checkanswer(String k) {
    if (data[2][i.toString()] == data[1][i.toString()][k]) {
      // ans is coreect
      marks = marks + 5;
      colortoshow = right;
    } else {
      // ans is incorrect
      colortoshow = wrong;
    }
    setState(() {
      canceltimer = true;
      btncolor[k] = colortoshow;
      Timer(Duration(seconds: 2), nextquestion);
    });
  }

  Widget choicebutton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(k),
        child: Text(
          // "choice",
          data[1][i.toString()][k],
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Alike",
            fontSize: 16.0,
          ),
          maxLines: 1,
        ),
        color: btncolor[k],
        splashColor: Colors.indigo[700],
        highlightColor: Colors.indigo[700],
        minWidth: 200.0,
        height: 45.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "Quizstar",
                  ),
                  content: Text("You Can't Go Back At This Stage."),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Ok',
                      ),
                    )
                  ],
                ));
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  data[0][i.toString()],
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "Quando",
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              // child: AbsorbPointer(
              // absorbing: disableAnswer,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    choicebutton('a'),
                    choicebutton('b'),
                    choicebutton('c'),
                    choicebutton('d'),
                  ],
                ),
              ),
              // ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topCenter,
                child: Center(
                  child: Text(
                    showtimer,
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
