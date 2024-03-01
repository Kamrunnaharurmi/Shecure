import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class defence extends StatefulWidget {
  const defence({Key? key}) : super(key: key);

  @override
  State<defence> createState() => defenceState();
}

class defenceState extends State<defence> {
  launchUrl(String url) async {
    try {
      await launch(url);
    } catch (e) {
      throw "Error launching URL: $e";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/image2.jpg"),
              fit: BoxFit.cover,
            ),
          ),

          child:Scaffold(
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
              title: Text(
                'How to Defend',
                style: GoogleFonts.salsa(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: IconButton(
                onPressed: (){},
                icon:Icon(Icons.arrow_back_ios,color: Colors.pink),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 0, right: 0, top: 0),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset('images/acid.jpeg',
                                    width: 300,
                                  ),
                                  ElevatedButton(
                                    onPressed: () =>
                                        launchUrl("https://www.youtube.com/watch?v=PyeM4dQGgG4"),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      shape: const CircleBorder(),
                                    ),
                                    child: Image.asset('images/play.png',
                                      width: 35,
                                      height: 35,
                                    ),
                                  ),
                                ],
                              ),

                              Text("1. How to escape from the acid attack problem",
                                  style: GoogleFonts.salsa(
                                      fontSize: 14
                                      ,color: Colors.black,fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset('images/rape.jpeg',
                                    width: 300,
                                  ),
                                  ElevatedButton(
                                    onPressed: () =>
                                        launchUrl("https://www.youtube.com/watch?v=aQ6p49KQT4A"),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      shape: CircleBorder(),
                                    ),
                                    child: Image.asset('images/play.png',
                                      width: 35,
                                      height: 35,
                                    ),
                                  ),
                                ],
                              ),

                              Text("2. How to escape from the rape attack problem",
                                  style: GoogleFonts.salsa(
                                      fontSize: 14
                                      ,color: Colors.black,fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(height: 10),
                      Divider(
                        thickness: 2,
                        color: Colors.black,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset('images/follow.jpeg',
                                width: 300,
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    launchUrl("https://www.youtube.com/watch?v=E7sVgKgNyWA"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  shape: const CircleBorder(),
                                ),
                                child: Image.asset('images/play.png',
                                  width: 35,
                                  height: 35,
                                ),
                              ),
                            ],
                          ),

                          Text("3. What should we do if someone is following us",
                              style: GoogleFonts.salsa(
                                  fontSize: 14
                                  ,color: Colors.black,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(
                        thickness: 2,
                        color: Colors.black,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset('images/kidnap.jpeg',
                                width: 300,
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    launchUrl("https://www.youtube.com/watch?v=17NzL6kkHUY"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  shape: CircleBorder(),
                                ),
                                child: Image.asset('images/play.png',
                                  width: 35,
                                  height: 35,
                                ),
                              ),
                            ],
                          ),

                          Text("4. What to do if someone wants to kidnap us",
                              style: GoogleFonts.salsa(
                                  fontSize: 14
                                  ,color: Colors.black,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(
                        thickness: 2,
                        color: Colors.black,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset('images/grab.jpg',
                                width: 300,
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    launchUrl("https://www.youtube.com/watch?v=QuXcZbjWD-w"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  shape: CircleBorder(),
                                ),
                                child: Image.asset('images/play.png',
                                  width: 35,
                                  height: 35,
                                ),
                              ),
                            ],
                          ),

                          Text("5. What to do if someone grab us suddenly",
                              style: GoogleFonts.salsa(
                                  fontSize: 14
                                  ,color: Colors.black,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(
                        thickness: 2,
                        color: Colors.black,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset('images/defence.jpg',
                                width: 300,
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    launchUrl("https://www.youtube.com/watch?v=-V4vEyhWDZ0&t=56s"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  shape: const CircleBorder(),
                                ),
                                child: Image.asset('images/play.png',
                                  width: 35,
                                  height: 35,
                                ),
                              ),
                            ],
                          ),

                          Text("6. Some basic self defence techniques ",
                              style: GoogleFonts.salsa(
                                  fontSize: 14
                                  ,color: Colors.black,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}


