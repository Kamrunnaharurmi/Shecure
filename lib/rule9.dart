import 'package:flutter/material.dart';
import 'rules.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class rule9 extends StatefulWidget {
  const rule9({super.key});

  @override
  State<rule9> createState() => rule9State();
}

class rule9State extends State<rule9> {
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
                          " 354C. Voyeurism\n"),
                      Text(
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.salsa(fontSize: 13),
                          "Any man who watches, or captures the image of a woman engaging in a private act in circumstances where she would usually have the expectation of not being observed either by the perpetrator or by any other person at the behest of the perpetrator or disseminates such image shall be punished on first conviction with imprisonment of either description for a term which shall not be less than one year, but which may extend to three years, and shall also be liable to fine, and be punished on a second or subsequent conviction, with imprisonment of either description for a term which shall not be less than three years, but which may extend to seven years, and shall also be liable to fine. Explanation 1. —For the purpose of this section, “private act” includes an act of watching carried out in a place which, in the circumstances, would reasonably be expected to provide privacy and where the victim's genitals, posterior or breasts are exposed or covered only in underwear; or the victim is using a lavatory; or the victim is doing a sexual act that is not of a kind ordinarily done in public.\nExplanation 2.  —Where the victim consents to the capture of the images or any act, but not to their dissemination to third persons and where such image or act is disseminated, such dissemination shall be considered an offence under this section.\n\n"),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              flutterTts.speak("354C. Voyeurism\nA man is said to commit rape who except in the case hereinafter excepted, has sexual intercourse with a woman against her will,Without her consent,With her consent, when her consent has been obtained by putting her in fear of death, or of hurt.With her consent, when the man knows that he is not her husband, and that her consent is given because she believes that he is another man to whom she is or believes herself to be lawfully married,With or without her consent, when she is under fourteen years of age.\nAny man who watches, or captures the image of a woman engaging in a private act in circumstances where she would usually have the expectation of not being observed either by the perpetrator or by any other person at the behest of the perpetrator or disseminates such image shall be punished on first conviction with imprisonment of either description for a term which shall not be less than one year, but which may extend to three years, and shall also be liable to fine, and be punished on a second or subsequent conviction, with imprisonment of either description for a term which shall not be less than three years, but which may extend to seven years, and shall also be liable to fine. Explanation 1. —For the purpose of this section, “private act” includes an act of watching carried out in a place which, in the circumstances, would reasonably be expected to provide privacy and where the victim's genitals, posterior or breasts are exposed or covered only in underwear; or the victim is using a lavatory; or the victim is doing a sexual act that is not of a kind ordinarily done in public.\nExplanation 2.  —Where the victim consents to the capture of the images or any act, but not to their dissemination to third persons and where such image or act is disseminated, such dissemination shall be considered an offence under this section.\n\n");
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