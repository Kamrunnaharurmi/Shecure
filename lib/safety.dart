import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class safety extends StatefulWidget {
  const safety({super.key});

  @override
  State<safety> createState() => safetyState();
}

class safetyState extends State<safety> {
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
                  'Women Safety Tips',
                  style: GoogleFonts.salsa(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )
              ),
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
                      child: Image.asset('images/tips.png',
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
                            fontSize: 15,fontWeight: FontWeight.bold),
                        "20 Important Tips Regarding Women Safety :\n"),
                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(fontSize: 13),
                        "1. Woman must have all the emergency numbers with them and WhatsApp also if possible so that they can immediately tell to their family members and police."),

                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(
                            fontSize: 13),
                        "2. Hold your bag as tightly as you can when you are taking public transport. You can use it to hit your predator."),
                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(fontSize: 13),
                        "3. When you are walking on a road, keep your mobile phone handy but avoid using it. Being on the phone makes you less alert."),

                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(
                            fontSize: 13),
                        "4. When you are travelling in an auto alone, make sure you share the auto number with someone in your family even if it's during the day."),
                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(fontSize: 13),
                        "5. Similarly, if you have booked a cab, always share your coordinates with someone."),

                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(
                            fontSize: 13),
                        "6. When in office, avoid going to isolated areas with no CCTV cameras."),
                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(fontSize: 13),
                        "7. If you have parked your car, always look underneath, especially at night or at a less-crowded area.\n"),

                    Text(
                        textAlign: TextAlign.left,
                        style: GoogleFonts.salsa(
                            fontSize: 15,fontWeight: FontWeight.bold),
                        "**Very Important**"),
                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(fontSize: 13),
                        "8. Whenever you are posting anything on social media, make sure you don't do it in real-time. Because if you do, you're telling people on your social media about your whereabouts. Delay those posts by say, 20-30 minutes."),

                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(
                            fontSize: 13),
                        "9. Always ensure you aren't posting anything on your social media with your address or phone number on it."),
                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(fontSize: 13),
                        "10. Whenever you are giving out order for delivery at a grocery store, make sure you whisper your address or write it down somewhere and give it to the shopkeeper. Never announce it."),

                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(
                            fontSize: 13),
                        "11. Whenever you are getting your phone recharged, if it's at a store, don't loudly speak up your phone number."),
                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(fontSize: 13),
                        "12. Always pour your own drinks at parties and don't ever take drinks from complete strangers or even friends. If you've left your drink unattended for even a few minutes, leave it and get a fresh drink. It may have been spiked when you weren't looking."),

                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(
                            fontSize: 13),
                        "13. If you feel someone is stalking you, try to find a crowded place and call someone for help."),
                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(fontSize: 13),
                        "14. Self defence techniques are the first and foremost thing to which each and every woman must be aware of and get proper self-defence training for their safety. They must be aware of some effective defence techniques such as kicks to groin, blocking punches, etc."),

                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(
                            fontSize: 13),
                        "15. Generally most of the women are gifted with sixth sense which they must use whenever they become in some problem. They should at once avoid any situation which they feel bad for them."),
                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(fontSize: 13),
                        "16. Escape and run is also a good way to reduce some risks of women whenever they become in problem. They should never go with any unknown person alone at some unknown places."),

                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(
                            fontSize: 13),
                        "17. Women must understand and feel their physical power and use accordingly. They never feel themselves weak than men and take some self defence training."),
                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(fontSize: 13),
                        "18. They should be careful while communicating with someone on internet in the cyberspace."),

                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(
                            fontSize: 13),
                        "19. Pepper spray can also be proved as a useful self-defence tool however it has a drawback that some people cannot be harmed through it even after full-face spray. It may not stop the attacker so women should not depend on it completely and use other techniques also."),

                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(fontSize: 13),
                        "20. Women should be very conscious while driving the car and going to any trip. They must lock all the doors of car while travelling with own or private car.\n"),
                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(
                            fontSize: 15,fontWeight: FontWeight.bold),
                        "Conclusion:"),
                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(
                            fontSize: 13),
                        "Women safety is a big social issue which needs to be solved urgently by the effort of all. It is inhibiting the growth and development of the country and most importantly hurting the half population of the country in all aspects (physically, mentally, and socially).\n\n"),


                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            flutterTts.speak("20 important Tips Regarding Women Safety\n1. Woman must have all the emergency numbers with them and WhatsApp also if possible so that they can immediately tell to their family members and police.\n 2. Hold your bag as tightly as you can when you are taking public transport. You can use it to hit your predator.\n 3. When you are walking on a road, keep your mobile phone handy but avoid using it. Being on the phone makes you less alert.\n 4. When you are travelling in an auto alone, make sure you share the auto number with someone in your family even if it's during the day.\n 5. Similarly, if you have booked a cab, always share your coordinates with someone.\n 6. When in office, avoid going to isolated areas with no CCTV cameras.\n 7. If you have parked your car, always look underneath, especially at night or at a less-crowded area.\n\n Very Important\n 8. Whenever you are posting anything on social media, make sure you don't do it in real-time. Because if you do, you're telling people on your social media about your whereabouts. Delay those posts by say, 20-30 minutes.\n 9. Always ensure you aren't posting anything on your social media with your address or phone number on it.\n 10. Whenever you are giving out order for delivery at a grocery store, make sure you whisper your address or write it down somewhere and give it to the shopkeeper. Never announce it.\n 11. Whenever you are getting your phone recharged, if it's at a store, don't loudly speak up your phone number.12. Always pour your own drinks at parties and don't ever take drinks from complete strangers or even friends. If you've left your drink unattended for even a few minutes, leave it and get a fresh drink. It may have been spiked when you weren't looking.\n 13. If you feel someone is stalking you, try to find a crowded place and call someone for help.\n 14. Self defence techniques are the first and foremost thing to which each and every woman must be aware of and get proper self-defence training for their safety. They must be aware of some effective defence techniques such as kicks to groin, blocking punches, etc.\n 15. Generally most of the women are gifted with sixth sense which they must use whenever they become in some problem. They should at once avoid any situation which they feel bad for them.\n 16. Escape and run is also a good way to reduce some risks of women whenever they become in problem. They should never go with any unknown person alone at some unknown places.\n 17. Women must understand and feel their physical power and use accordingly. They never feel themselves weak than men and take some self defence training.\n 18. They should be careful while communicating with someone on internet in the cyberspace.\n 19. Pepper spray can also be proved as a useful self-defence tool however it has a drawback that some people cannot be harmed through it even after full-face spray. It may not stop the attacker so women should not depend on it completely and use other techniques also.\n 20. Women should be very conscious while driving the car and going to any trip. They must lock all the doors of car while travelling with own or private car.\n\nConclusion:\n Women safety is a big social issue which needs to be solved urgently by the effort of all. It is inhibiting the growth and development of the country and most importantly hurting the half population of the country in all aspects (physically, mentally, and socially).");
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