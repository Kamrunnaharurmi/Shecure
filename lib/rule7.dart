import 'package:flutter/material.dart';
import 'rules.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class rule7 extends StatefulWidget {
  const rule7({super.key});

  @override
  State<rule7> createState() => rule7State();
}

class rule7State extends State<rule7> {
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
                              fontSize: 15, fontWeight: FontWeight.bold
                          ),
                          "354A. Sexual harassment and punishment for sexual harassment\n"),
                      Text(
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.salsa(fontSize: 13),
                          "1) A man committing any of the following acts— (i) physical contact and advances involving unwelcome and explicit sexual overtures; or (ii) a demand or request for sexual favors; or (iii) showing pornography against the will of a woman; or (iv) making sexually colored remarks, shall be guilty of the offence of sexual harassment.\n(2) Any man who commits the offence specified in clause (i) or clause (ii) or clause (iii) of sub-section (1) shall be punished with rigorous imprisonment for a term which may extend to three years, or with fine, or with both.\n(3) Any man who commits the offence specified in clause (iv) of sub-section (1) shall be punished with imprisonment of either description for a term which may extend to one year, or with fine, or with both.\n,\n"),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              flutterTts.speak("354A. Sexual harassment and punishment for sexual harassment\n1) A man committing any of the following acts— (i) physical contact and advances involving unwelcome and explicit sexual overtures; or (ii) a demand or request for sexual favors; or (iii) showing pornography against the will of a woman; or (iv) making sexually colored remarks, shall be guilty of the offence of sexual harassment.\n(2) Any man who commits the offence specified in clause (i) or clause (ii) or clause (iii) of sub-section (1) shall be punished with rigorous imprisonment for a term which may extend to three years, or with fine, or with both.\n(3) Any man who commits the offence specified in clause (iv) of sub-section (1) shall be punished with imprisonment of either description for a term which may extend to one year, or with fine, or with both.");
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