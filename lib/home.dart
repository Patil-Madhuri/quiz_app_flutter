import 'package:demo/quizpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> languageName = ['Python', 'Java', 'Javascript', 'C++'];
  List<String> images = [
    "assets/images/py.png",
    "assets/images/java.png",
    "assets/images/js.png",
    "assets/images/cpp.png"
  ];
  List<String> des = [
    "Python is one of the most popular and fastest programming language since half a decade.\nIf You think you have learnt it.. \nJust test yourself !!",
    "Java has always been one of the best choices for Enterprise World. If you think you have learn the Language...\nJust Test Yourself !!",
    "Javascript is one of the most Popular programming language supporting the Web.\nIt has a wide range of Libraries making it Very Powerful !",
    "C++, being a statically typed programming language is very powerful and Fast.\nit's DMA feature makes it more useful. !"  ];

  Widget customCard(String langName, String image, String desc) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: InkWell(
          onTap: () {
            debugPrint('langName=' + langName);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoadJson(langName)));
          },
          child: Material(
            color: Colors.cyan,
            elevation: 10.0,
            borderRadius: BorderRadius.circular(25.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(75.0),
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                          child: ClipOval(
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage(image),
                            ),
                          ),
                        ),
                      )),
                  Center(
                    child: Text(
                      langName,
                      // "$langName",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: "Quanto",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      desc,
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontFamily: "Alike"),
                      maxLines: 5,
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quiz Star",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          customCard(languageName[0], images[0], des[0]),
          customCard(languageName[1], images[1], des[1]),
          customCard(languageName[2], images[2], des[2]),
          customCard(languageName[3], images[3], des[3]),
        ],
      ),
    );
  }
}
