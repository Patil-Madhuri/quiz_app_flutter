import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter Calculator",
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int firstnum;
  int secondnum;
  String texttodisplay = "";
  String res;
  String operatortoperform;
  void btnClicked(String btnvalue) {
    debugPrint(" btnClicked btn value" + btnvalue);

    if (btnvalue == "C") {
      texttodisplay = "";
      firstnum = 0;
      secondnum = 0;
      res = "";
      operatortoperform = "";
    } else if (btnvalue == "+" ||
        btnvalue == "-" ||
        btnvalue == "X" ||
        btnvalue == "/") {
      firstnum = int.parse(texttodisplay);
      res = "";
      operatortoperform = btnvalue;
    } else if (btnvalue == "=") {
      secondnum = int.parse(texttodisplay);
      if (operatortoperform == "+") {
        res = (firstnum + secondnum).toString();
      }
      if (operatortoperform == "-") {
        res = (firstnum - secondnum).toString();
      }
      if (operatortoperform == "X") {
        res = (firstnum * secondnum).toString();
      }
      if (operatortoperform == "/") {
        res = (firstnum / secondnum).toString();
      }
    } else {
      res = int.parse(texttodisplay + btnvalue).toString();
    }
    setState(() {
      texttodisplay = res;
    });
  }

  Widget customBtn(String btnValue) {
    // debugPrint("btn value"+ btnValue);
    return Expanded(
      child: OutlineButton(
        onPressed: () => btnClicked(btnValue),
        child: Text(
          "$btnValue",
          style: TextStyle(fontSize: 25.0),
        ),
        padding: EdgeInsets.all(25.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculator")),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "$texttodisplay",
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                customBtn("9"),
                customBtn("8"),
                customBtn("7"),
                customBtn("+"),
              ],
            ),
            Row(
              children: <Widget>[
                customBtn("6"),
                customBtn("5"),
                customBtn("4"),
                customBtn("-"),
              ],
            ),
            Row(
              children: <Widget>[
                customBtn("3"),
                customBtn("2"),
                customBtn("1"),
                customBtn("X"),
              ],
            ),
            Row(
              children: <Widget>[
                customBtn("C"),
                customBtn("0"),
                customBtn("="),
                customBtn("/"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: "My App",
// //       theme: ThemeData(primarySwatch: Colors.deepPurple),
// //       home: Scaffold(
// //           appBar: AppBar(
// //             title: Text("My App"),
// //           ),
// //           body: Center(
// //           //     child: Text(
// //           //   "******** !!!!!!! ######## Hello World ######## !!!!!!!!!! ********",
// //           //   style: TextStyle(
// //           //       backgroundColor: Colors.black,
// //           //       color: Colors.white,
// //           //       fontSize: 30.0),
// //           //   softWrap: true,
// //           //   maxLines: 1,
// //           //   // overflow: TextOverflow.ellipsis)
// //           // )
// //               // IconButton(
// //               //   onPressed: () {},
// //               //   icon: Icon(Icons.accessibility),
// //               //   iconSize: 40,
// //               //   splashColor: Colors.red,
// //               //   color: Colors.green,
// //               //   highlightColor: Colors.indigo,
// //               // ),
// //               )),
// //     );
// //   }
// // }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.yellow
//         ),
//         title: "My stateful Widget",
//       home: HomePage()
//     );
//   }
// }
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int counter = 0;
// counterChange(){
//   setState(() {
//     counter+= 1;
//   });
// }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      appBar: AppBar(
//        title: Text(
//          "App Bar"
//        ),
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.all(20.0),
//              child: Text(
//                "$counter",
//                style: TextStyle(color: Colors.green,
//                fontSize: 20.0,
//                fontWeight: FontWeight.bold),
//              ),
//            ),
//            RaisedButton(
//              onPressed: counterChange,
//              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
//              child: Text(
//                "Click Me",
//                style: TextStyle(fontWeight: FontWeight.bold),
//              ),
//              color: Colors.cyan,
//            )
//          ],
//        ),
//      ),
//     );
//   }
// }
