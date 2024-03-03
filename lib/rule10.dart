import 'package:flutter/material.dart';
import 'rules.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class rule10 extends StatefulWidget {
  const rule10({super.key});

  @override
  State<rule10> createState() => rule10State();
}

class rule10State extends State<rule10> {
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
                          "354D. Stalking\n"),
                      Text(
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.salsa(fontSize: 13),
                          "(1) Any man who— (i) follows a woman and contacts, or attempts to contact such woman to foster personal interaction repeatedly despite a clear indication of disinterest by such woman; or (ii) monitors the use by a woman of the internet, email or any other form of electronic communication, commits the offence of stalking Provided that such conduct shall not amount to stalking if the man who pursued it proves that— (i) it was pursued for the purpose of preventing or detecting crime and the man accused of stalking had been entrusted with the responsibility of prevention and detection of crime by the State; or (ii) it was pursued under any law or to comply with any condition or requirement imposed by any person under any law; or (iii) in the particular circumstances such conduct was reasonable and justified.\n(2) Whoever commits the offence of stalking shall be punished on first conviction with imprisonment of either description for a term which may extend to three years, and shall also be liable to fine; and be punished on a second or subsequent conviction, with imprisonment of either description for a term which may extend to five years, and shall also be liable to fine.]\n\n"),
                      SizedBox(
                        height: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              flutterTts.speak("354D. Stalking\n(1) Any man who— (i) follows a woman and contacts, or attempts to contact such woman to foster personal interaction repeatedly despite a clear indication of disinterest by such woman; or (ii) monitors the use by a woman of the internet, email or any other form of electronic communication, commits the offence of stalking Provided that such conduct shall not amount to stalking if the man who pursued it proves that— (i) it was pursued for the purpose of preventing or detecting crime and the man accused of stalking had been entrusted with the responsibility of prevention and detection of crime by the State; or (ii) it was pursued under any law or to comply with any condition or requirement imposed by any person under any law; or (iii) in the particular circumstances such conduct was reasonable and justified.\n(2) Whoever commits the offence of stalking shall be punished on first conviction with imprisonment of either description for a term which may extend to three years, and shall also be liable to fine; and be punished on a second or subsequent conviction, with imprisonment of either description for a term which may extend to five years, and shall also be liable to fine.]\n\n");
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
