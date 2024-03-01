import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bottom.dart';
import 'first.dart';
import 'package:firebase_auth/firebase_auth.dart';

class open extends StatefulWidget {
  const open({super.key});

  @override
  State<open> createState() => openState();
}

class openState extends State<open> {
  @override
  void initState() {
    super.initState();
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Future.delayed(Duration(seconds: 5)).then((value) {
        Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (ctx) => bottom()),
        );
      });
    } else {
      Future.delayed(Duration(seconds: 5)).then((value) {
        Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (ctx) => first()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/image3.jpg"),
                fit: BoxFit.fill),
          ),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(left: 25, right: 25, top: 25),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 170,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: Image.asset(
                              'images/image4.png',
                              width: 170,
                              height: 170,
                            ),
                          ),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('~~ Shecure ~~',
                              style: GoogleFonts.salsa(
                                  fontSize: 33,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,color: Colors.pink)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('A Women Safety App',
                              style: GoogleFonts.salsa(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,color: Colors.pink)),
                        ],
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                          " Let's Start ",textAlign: TextAlign.center,
                          style: GoogleFonts.salsa(
                              fontSize: 15,fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink)),
                      SizedBox(
                        height: 10,
                      ),
                      SpinKitFadingCircle(
                        color: Colors.pink,
                        size: 50.0,
                      )
                    ],
                  ),
                ),
              )
          ),
        )
    );
  }
}