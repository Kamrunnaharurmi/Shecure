import 'package:flutter/material.dart';
import 'rules.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class rule11 extends StatefulWidget {
  const rule11({super.key});

  @override
  State<rule11> createState() => rule11State();
}

class rule11State extends State<rule11> {
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
                          "509. Word, gesture or act intended to insult the modesty of a woman\n"),
                      Text(
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.salsa(fontSize: 13),
                          "Whoever, intending to insult the modesty of any woman, utters any words, makes any sound or gesture, or exhibits any object, intending that such word or sound shall be heard, or that such gesture or object shall be seen, by such woman, or intrudes upon the privacy of such woman, 1 [shall be punished with simple imprisonment for a term which may extend to three years, and also with fine].\n\n"),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              flutterTts.speak("509. Word, gesture or act intended to insult the modesty of a woman\nWhoever, intending to insult the modesty of any woman, utters any words, makes any sound or gesture, or exhibits any object, intending that such word or sound shall be heard, or that such gesture or object shall be seen, by such woman, or intrudes upon the privacy of such woman, 1 [shall be punished with simple imprisonment for a term which may extend to three years, and also with fine].\n\n");
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
              )
          )
      ),
    );
  }
}