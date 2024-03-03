import 'package:flutter/material.dart';
import 'bottom.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => aboutState();
}

class aboutState extends State<about> {
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
              backgroundColor: Colors.pink,
              centerTitle: true,
              title: Text('About App',
                  style: GoogleFonts.salsa(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )
              ),
              leading: IconButton(
                onPressed: (){
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => bottom()));
                },
                icon:Icon(Icons.arrow_back_ios,color: Colors.white),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 25, right: 25, top: 25),
                child: Column(
                  children: [
                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(
                          fontSize: 13,
                        ),
                        "This WOMEN SAFETY App is an android based app.Women are working at different diverse groups for a common cause. We are all know about importance of safety of women but we must realize that they should be properly protected. In an emergency situation a helping hand would be a relief for them.\nThis safety app is designed to enhance the safety for women at any time ans anywhere.Our intention is to provide with the fastest and simple way to contact  your nearest and dearest and emergency center and your gurdians. When there is an  emergency, it will be difficult to get ideas and we will be in fear, however it is important that our parents and friends ae to be notified that we are in danger, so that we can find the exact location come and help them.  \n"),
                    Text(
                        textAlign: TextAlign.center,
                        style: GoogleFonts.salsa(
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        "Version 1.0.0\n\n"),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            flutterTts.speak("This WOMEN SAFETY App is an android based app. Women are working at different diverse groups for a common cause. We are all know about importance of safety of women but we must realize that they should be properly protected. In an emergency situation a helping hand would be a relief for them.\nThis safety app is designed to enhance the safety for women at any time at anywhere.Our intention is to provide with the fastest and simple way to contact  your nearest and dearest and emergency center and your gurdians. When there is an  emergency, it will be difficult to get ideas and we will be in fear, however it is important that our parents and friends ae to be notified that we are in danger, so that we can find the exact location come and help them.\n");
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
                            shape:  CircleBorder(),
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
