import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class escape extends StatefulWidget {
  const escape({super.key});

  @override
  State<escape> createState() => escapeState();
}

class escapeState extends State<escape> {
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
              title: Text(textAlign: TextAlign.left,
                  'Escape from Threat',
                  style: GoogleFonts.salsa(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              leading: IconButton(
                onPressed: (){},
                icon:Icon(Icons.arrow_back_ios,color: Colors.pink),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Image.asset('images/escape.jpg',
                        width: 60,
                        height: 60,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(
                            fontSize: 13,fontWeight: FontWeight.bold),
                        "1.What should a woman do if she finds herself alone in the company of a strange male as she prepares to enter a lift in a High Rise apartment late at night?"),
                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(fontSize: 13),
                        "Experts Say: Enter the lift.If you need to reach the 13th floor, press all the buttons up to your destination. No one will dare attack you in a lift that stops on every floor.\n"),

                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(
                            fontSize: 13,fontWeight: FontWeight.bold),
                        "2.What to do if a stranger tries to attack you when you are alone in your house, run into the kitchen?"),
                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(fontSize: 13),
                        "Experts Say: You alone know where the chilli powder and turmeric are kept. And where the knives and plates are. All these can be turned into deadly weapons. If nothing else, start throwing plates and utensils all over. Let them break. Scream. Remember that noise is the greatest enemy of a molester. He does not want to be caught.\n"),

                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(
                            fontSize: 13,fontWeight: FontWeight.bold),
                        "3.Isn't it risky to take an Auto or Taxi at Night?What should a women doo in this situation?"),
                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(fontSize: 13),
                        "Experts Say: Before getting into an auto at night, note down its registration number. Then use the mobile to call your family or friend and pass on the details to them in the language the driver understands. Even if no one answers your call, pretend you are in a conversation. The driver now knows someone has his details and he will be in serious trouble if anything goes wrong. He is now bound to take you home safe and sound. A potential attacker is now your de facto protector.\n"),

                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(
                            fontSize: 13,fontWeight: FontWeight.bold),
                        "4.What if the driver turns into a street he is not supposed too and you feel you are entering a danger zone?"),
                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(fontSize: 13),
                        "Experts Say : Use the handle of your purse or your stole (dupatta) to wrap around his neck and pull him back. Within seconds, he will feel choked and helpless. In case you don't have a purse or stole just pull him back by his collar. The top button of his shirt would then do the same trick.\n"),

                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(
                            fontSize: 13,fontWeight: FontWeight.bold),
                        "5.If you are stalked by anyone at night, what will you do then?"),
                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(fontSize: 13),
                        "Expert Say: Enter a shop or a house and explain your predicament. If it is night and shops are not open, go inside an ATM box. ATM centres always have close circuit television. Fearing identification, no one will dare attack you.\n"),

                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(
                            fontSize: 13,fontWeight: FontWeight.bold),
                        "After all, being mentally alert is the greatest weapon you can ever have.\n\n"),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            flutterTts.speak("Some Tips for safety\n 1.What should a woman do if she finds herself alone in the company of a strange male as she prepares to enter a lift in a High Rise apartment late at night?\nExperts Say: Enter the lift.If you need to reach the 13th floor, press all the buttons up to your destination. No one will dare attack you in a lift that stops on every floor.\n\n 2.What to do if a stranger tries to attack you when you are alone in your house, run into the kitchen?\n Experts Say: You alone know where the chilli powder and turmeric are kept. And where the knives and plates are. All these can be turned into deadly weapons. If nothing else, start throwing plates and utensils all over. Let them break. Scream. Remember that noise is the greatest enemy of a molester. He does not want to be caught.\n\n 3. Taking an Auto or Taxi at Night?\n Experts Say: Before getting into an auto at night, note down its registration number. Then use the mobile to call your family or friend and pass on the details to them in the language the driver understands. Even if no one answers your call, pretend you are in a conversation. The driver now knows someone has his details and he will be in serious trouble if anything goes wrong. He is now bound to take you home safe and sound. A potential attacker is now your de facto protector.\n\n 4. What if the driver turns into a street he is not supposed too and you feel you are entering a danger zone?\n Experts Say : Use the handle of your purse or your stole (dupatta) to wrap around his neck and pull him back. Within seconds, he will feel choked and helpless. In case you don't have a purse or stole just pull him back by his collar. The top button of his shirt would then do the same trick.\n\n 5. If you are stalked at night,what will you do?\n Expert Say: Enter a shop or a house and explain your predicament. If it is night and shops are not open, go inside an ATM box. ATM centres always have close circuit television. Fearing identification, no one will dare attack you.\n\n After all, being mentally alert is the greatest weapon you can ever have.");
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