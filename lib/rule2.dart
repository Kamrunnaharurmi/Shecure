import 'package:flutter/material.dart';
import 'rules.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class rule2 extends StatefulWidget {
  const rule2({super.key});

  @override
  State<rule2> createState() => rule2State();
}

class rule2State extends State<rule2> {
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
                  style:GoogleFonts.salsa(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(fontSize: 15, fontWeight: FontWeight.bold),
                        "375 and 376. Rape\n"),

                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(
                          fontSize: 13,
                        ),
                        "A man is said to commit rape who except in the case hereinafter excepted, has sexual intercourse with a woman against her will,Without her consent,With her consent, when her consent has been obtained by putting her in fear of death, or of hurt.With her consent, when the man knows that he is not her husband, and that her consent is given because she believes that he is another man to whom she is or believes herself to be lawfully married,With or without her consent, when she is under fourteen years of age.\nWhoever commits rape shall be punished with 2[imprisonment] for life or with imprisonment of either description for a term which may extend to ten years, and shall also be liable to fine, unless the woman raped is his own wife and is not under twelve years of age, in which case he shall be punished with imprisonment of either description for a term which may extend to two years, or with fine, or with both.\n\n"),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            flutterTts.speak("375 and 376. Rape\nA man is said to commit rape who except in the case hereinafter excepted, has sexual intercourse with a woman against her will,Without her consent,With her consent, when her consent has been obtained by putting her in fear of death, or of hurt.With her consent, when the man knows that he is not her husband, and that her consent is given because she believes that he is another man to whom she is or believes herself to be lawfully married,With or without her consent, when she is under fourteen years of age.\nWhoever commits rape shall be punished with 2[imprisonment] for life or with imprisonment of either description for a term which may extend to ten years, and shall also be liable to fine, unless the woman raped is his own wife and is not under twelve years of age, in which case he shall be punished with imprisonment of either description for a term which may extend to two years, or with fine, or with both.");
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
        ),
      ),
    );
  }
}