import 'package:flutter/material.dart';
import 'rules.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class rule3 extends StatefulWidget {
  const rule3({super.key});

  @override
  State<rule3> createState() => rule3State();
}

class rule3State extends State<rule3> {
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
                        "363 to 373. Kidnapping and Abduction\n"),
                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(fontSize: 13),
                        "Whoever kidnaps or abducts any person in order that such women may be murdered or may be so disposed of as to be put in danger of being murdered, shall be punished with 3 [imprisonment for life] or rigorous imprisonment for a term which may extend to ten years, and shall also be liable to fine.\nWhoever kidnaps or abducts any women or keeps a her in detention after such kidnapping or abduction, and threatens to cause death or hurt to such person, or by his conduct gives rise to a reasonable apprehension that such person may be put to death or hurt, or causes hurt or death to such person in order to compel the Government or 5 [any foreign State or international inter-governmental organization or any other person] to do or abstain from doing any act or to pay a ransom, shall be punishable with death, or imprisonment for life, and shall also be liable to fine.]\nWhoever kidnaps or abducts any person with intent to cause that person to be secretly and wrongfully confined, shall be punished with imprisonment of either description for a term which may extend to seven years, and shall also be liable to fine.\nWhoever kidnaps or abducts any woman with intent that she may be compelled, or knowing it to be likely that she will be compelled, to marry any person against her will, or in order that she may be forced or seduced to illicit intercourse, or knowing it to be likely that she will be forced or seduced to illicit intercourse, shall be punished with imprisonment of either description for a term which may extend to ten years, and shall also be liable to fine; 1 [and whoever, by means of criminal intimidation as defined in this Code or of abuse of authority or any other method of compulsion, induces any woman to go from any place with intent that she may be, or knowing that it is likely that she will be, forced or seduced to illicit intercourse with another person shall also be punishable as aforesaid].\n\n"),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            flutterTts.speak("363 to 373. Kidnapping and Abduction\nWhoever kidnaps or abducts any person in order that such women may be murdered or may be so disposed of as to be put in danger of being murdered, shall be punished with 3 [imprisonment for life] or rigorous imprisonment for a term which may extend to ten years, and shall also be liable to fine.\nWhoever kidnaps or abducts any women or keeps a her in detention after such kidnapping or abduction, and threatens to cause death or hurt to such person, or by his conduct gives rise to a reasonable apprehension that such person may be put to death or hurt, or causes hurt or death to such person in order to compel the Government or 5 [any foreign State or international inter-governmental organization or any other person] to do or abstain from doing any act or to pay a ransom, shall be punishable with death, or imprisonment for life, and shall also be liable to fine.]\nWhoever kidnaps or abducts any person with intent to cause that person to be secretly and wrongfully confined, shall be punished with imprisonment of either description for a term which may extend to seven years, and shall also be liable to fine.\nWhoever kidnaps or abducts any woman with intent that she may be compelled, or knowing it to be likely that she will be compelled, to marry any person against her will, or in order that she may be forced or seduced to illicit intercourse, or knowing it to be likely that she will be forced or seduced to illicit intercourse, shall be punished with imprisonment of either description for a term which may extend to ten years, and shall also be liable to fine; 1 [and whoever, by means of criminal intimidation as defined in this Code or of abuse of authority or any other method of compulsion, induces any woman to go from any place with intent that she may be, or knowing that it is likely that she will be, forced or seduced to illicit intercourse with another person shall also be punishable as aforesaid].\n\n");
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
      ),
    );
  }
}