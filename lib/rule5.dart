import 'package:flutter/material.dart';
import 'rules.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class rule5 extends StatefulWidget {
  const rule5({super.key});

  @override
  State<rule5> createState() => rule5State();
}

class rule5State extends State<rule5> {
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
                  children: [
                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(
                            fontSize: 15, fontWeight: FontWeight.bold
                        ),
                        "498A. Husband or relative of husband of a woman subjecting her to cruelty\n"),
                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(fontSize: 13),
                        "Whoever, being the husband or the relative of the husband of a woman, subjects such woman to cruelty shall be punished with imprisonment for a term which may extend to three years and shall also be liable to fine. Explanation.—For the purposes of this section, “cruelty” means— (a) anywilful conduct which is of such a nature as is likely to drive the woman to commit suicide or to cause grave injury or danger to life, limb or health (whether mental or physical) of the woman; or (b) harassment of the woman where such harassment is with a view to coercing her or any person related to her to meet any unlawful demand for any property or valuable security or is on account of failure by her or any person related to her to meet such demand.]\n\n"),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            flutterTts.speak("498A. Husband or relative of husband of a woman subjecting her to cruelty\nWhoever, being the husband or the relative of the husband of a woman, subjects such woman to cruelty shall be punished with imprisonment for a term which may extend to three years and shall also be liable to fine. Explanation.—For the purposes of this section, “cruelty” means— (a) anywilful conduct which is of such a nature as is likely to drive the woman to commit suicide or to cause grave injury or danger to life, limb or health (whether mental or physical) of the woman; or (b) harassment of the woman where such harassment is with a view to coercing her or any person related to her to meet any unlawful demand for any property or valuable security or is on account of failure by her or any person related to her to meet such demand.]\n\n");
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