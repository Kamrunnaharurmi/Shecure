import 'package:flutter/material.dart';
import 'rules.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class rule1 extends StatefulWidget {
  const rule1({super.key});
  @override
  State<rule1> createState() => rule1State();
}

class rule1State extends State<rule1> {
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
                      //controller: textEditingController,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(fontSize: 15, fontWeight: FontWeight.bold),
                        "326A and 326B.Acid Attack\n"),
                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(
                          fontSize: 13,
                        ),
                        "Acid attacks are another prevalent form of violence that may well be a phenomenon unique to Bangladesh (there are anecdotal reports of a few cases of such assaults from other parts of the world). The first documented case of acid attack usually occur when men want to take revenge for the refusal of proposals for unwanted things or marriage, or when demands for dowry are not met or when there is a political clash. Usually acid is thrown on the face of a girl or women with the aim of damaging her appearance in order to destroy her marriage prospects or on sexual organs (as observed among acid burn cases dealt with by Naripokkho)[1].\nAll crimes under this act will be cognizable, non-compoundable and non-bail able.A tribunal has to complete the whole trial within ninety days of receiving the first written instruction.If someone assists/helps to commit the crime of acid throwing, he/she will receive the same punishment/ penalty as the perpetrators.[6]\n\n"),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            flutterTts.speak("326A and 326B.Acid Attack\nAcid attacks are another prevalent form of violence that may well be a phenomenon unique to Bangladesh (there are anecdotal reports of a few cases of such assaults from other parts of the world). The first documented case of acid attack usually occur when men want to take revenge for the refusal of proposals for unwanted things or marriage, or when demands for dowry are not met or when there is a political clash. Usually acid is thrown on the face of a girl or women with the aim of damaging her appearance in order to destroy her marriage prospects or on sexual organs (as observed among acid burn cases dealt with by Naripokkho)[1].\nAll crimes under this act will be cognizable, non-compoundable and non-bail able.A tribunal has to complete the whole trial within ninety days of receiving the first written instruction.If someone assists/helps to commit the crime of acid throwing, he/she will receive the same punishment/ penalty as the perpetrators.[6]\n\n");
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