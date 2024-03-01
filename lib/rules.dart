import 'package:flutter/material.dart';
import 'home.dart';
import 'rule1.dart';
import 'rule2.dart';
import 'rule3.dart';
import 'rule4.dart';
import 'rule5.dart';
import 'rule6.dart';
import 'rule7.dart';
import 'rule8.dart';
import 'rule9.dart';
import 'rule10.dart';
import 'rule11.dart';
import 'package:google_fonts/google_fonts.dart';

class rules extends StatefulWidget {
  const rules({super.key});

  @override
  State<rules> createState() => rulesState();
}

class rulesState extends State<rules> {

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
              title: Text('Women Safety Laws',
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
                          builder: (context) => home()));
                },
                icon:Icon(Icons.arrow_back_ios,color: Colors.white),

              ),
            ),

            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Image.asset('images/law.jpg',
                        width: 80,
                        height: 80,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.salsa(
                            fontSize: 15,fontWeight: FontWeight.bold
                        ),
                        "Bangladesh has a number of special laws, specifically prohibiting certain form of violence against women including the Penal Code, 1860, the Anti-Dowry Prohibition Act(1980),the Cruelty to Women Ordinance(1983),the Suppression of Immoral Traffic Act (1993), and the Prevention of Repression against Women and Children Act (2000)."),

                    SizedBox(
                      height: 10,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              child: Text(
                                //textAlign: TextAlign.justify,
                                  style: GoogleFonts.salsa(fontSize: 13,fontWeight: FontWeight.bold),
                                  '1.The Acid Attack & Punishments (Sections 326A and 326B)'),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => rule1()));
                              }
                          ),
                          TextButton(
                              child: Text(
                                //textAlign: TextAlign.justify,
                                  style: GoogleFonts.salsa(fontSize: 13,fontWeight: FontWeight.bold),
                                  '2.The Rape & Punishments (Sections 375, 376, 376A, 376B, 376C, 376D and 376E)'),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => rule2()));
                              }
                          ),
                          TextButton(
                              child: Text(
                                //textAlign: TextAlign.justify,
                                  style: GoogleFonts.salsa(fontSize: 13,fontWeight: FontWeight.bold),
                                  '3.The Kidnapping and abduction for different purposes & Punishments (Sections 363-373)'),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => rule3()));
                              }
                          ),
                          TextButton(
                              child: Text(
                                //textAlign: TextAlign.justify,
                                  style: GoogleFonts.salsa(fontSize: 13,fontWeight: FontWeight.bold),
                                  '4.Murder, Dowry death, Abetment of Suicide, etc. & Punishments (Sections 302, 304B and 306)'),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => rule4()));
                              }
                          ),
                          TextButton(
                              child: Text(
                                //textAlign: TextAlign.justify,
                                  style: GoogleFonts.salsa(fontSize: 13,fontWeight: FontWeight.bold),
                                  '5.Cruelty by husband or his relatives & Punishments (Section 498A)'),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => rule5()));
                              }
                          ),

                          TextButton(
                              child: Text(
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.salsa(fontSize: 13,fontWeight: FontWeight.bold),
                                  '6.Outraging the modesty of women & Punishments (Section 354)'),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => rule6()));
                              }
                          ),

                          TextButton(
                              child: Text(
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.salsa(fontSize: 13,fontWeight: FontWeight.bold),
                                  '7.The Sexual harassment & Punishments (Section 354A)'),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => rule7()));
                              }
                          ),

                          TextButton(
                              child: Text(
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.salsa(fontSize: 13,fontWeight: FontWeight.bold),
                                  '8.Assault on women with intent to disrobe a woman & Punishments (Section 354 and 354B)'),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => rule8()));
                              }
                          ),

                          TextButton(
                              child: Text(
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.salsa(fontSize: 13,fontWeight: FontWeight.bold),
                                  '9.Privacy & CCTV related voyeurism & Punishments (Section 354C. )'),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => rule9()));
                              }
                          ),

                          TextButton(
                              child: Text(
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.salsa(fontSize: 13,fontWeight: FontWeight.bold),
                                  '10.Stalking a Women in any place & Punishments (Section 354D.)'),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => rule10()));
                              }
                          ),

                          TextButton(
                              child: Text(
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.salsa(fontSize: 13,fontWeight: FontWeight.bold),
                                  '11.Word, gesture or act intended to insult the modesty of a woman & Punishments (Section 509)\n\n\n'),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => rule11()));
                              }
                          ),]),
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}