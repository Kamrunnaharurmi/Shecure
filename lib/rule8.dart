import 'package:flutter/material.dart';
import 'rules.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class rule8 extends StatefulWidget {
  const rule8({super.key});

  @override
  State<rule8> createState() => rule8State();
}

class rule8State extends State<rule8> {
  FlutterTts flutterTts = FlutterTts();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/image2.jpg"),
                  fit: BoxFit.cover),
            ),

            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                actions: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Image.asset(
                      'images/image4.png',
                      width: 35,
                      height: 35,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
                elevation: 0.0,
                backgroundColor: Colors.pink,
                centerTitle: true,
                title: Text('Women Laws',
                    style: GoogleFonts.salsa(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                leading: IconButton(
                  onPressed: (){
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => rules()));
                  },
                  icon:Icon(Icons.arrow_back_ios,color: Colors.white),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
                  child: Column(
                    children: [
                      Text(
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.salsa(
                              fontSize: 15,fontWeight: FontWeight.bold
                          ),
                          "354B. Assault or use of criminal force to woman with intent to disrobe\n"),
                      Text(
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.salsa(fontSize: 13),
                          "Any man who assaults or uses criminal force to any woman or abets such act with the intention of disrobing or compelling her to be naked, shall be punished with imprisonment of either description for a term which shall not be less than three years but which may extend to seven years, and shall also be liable to fine.\n\n"),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              flutterTts.speak("354B. Assault or use of criminal force to woman with intent to disrobe\nAny man who assaults or uses criminal force to any woman or abets such act with the intention of disrobing or compelling her to be naked, shall be punished with imprisonment of either description for a term which shall not be less than three years but which may extend to seven years, and shall also be liable to fine.\n\n");
                              flutterTts.setLanguage("en-US");
                              flutterTts.setSpeechRate(0.5);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              shape: const CircleBorder(),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(1),
                                  child: Image.asset('images/soundon.jpg',
                                    width: 35,
                                    height: 35,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              flutterTts.stop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              shape: const CircleBorder(),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(1),
                                  child: Image.asset('images/soundoff.jpg',
                                    width: 35,
                                    height: 35,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            )
        )
    );
  }
}