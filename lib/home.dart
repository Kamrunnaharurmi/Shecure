import 'package:flutter/material.dart';
import 'package:shecure/bottom.dart';
import 'package:shecure/profile.dart';
import 'package:shecure/send.dart';
import 'about.dart';
import 'rules.dart';
import 'credit.dart';
import 'emergency.dart';
import 'rating.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'todo.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => homeState();
}

class homeState extends State<home> {
  List imagelist = [
    {"id": 1, "image_path": 'images/image11.jpg'},
    {"id": 2, "image_path": 'images/image12.jpg'},
    {"id": 3, "image_path": 'images/image13.jpg'},
    {"id": 4, "image_path": 'images/image14.jpg'},
    {"id": 5, "image_path": 'images/image15.jpg'},
    {"id": 6, "image_path": 'images/image16.jpg'},
    {"id": 7, "image_path": 'images/image17.jpg'},
    {"id": 8, "image_path": 'images/image18.jpg'},
    {"id": 9, "image_path": 'images/image19.jpg'},
    {"id": 10, "image_path": 'images/image20.jpg'},
    {"id": 11, "image_path": 'images/image21.jpg'},
    {"id": 12, "image_path": 'images/image22.jpg'}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0; //for dot below the pictures
  launchUrl(String url) async {
    try {
      await launch(url);
    } catch (e) {
      throw "Error launching URL: $e";
    }
  }

  late Position _currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentPosition = position;
      });
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  Future<void> _launchMaps(double latitude, double longitude) async {
    final url = 'https://www.google.com/maps?q=$latitude,$longitude';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/image2.jpg"),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
            drawer: Drawer(
              backgroundColor: Colors.pinkAccent,
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Image.asset(
                          'images/image.png',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ListTile(
                    leading: Icon(Icons.home, color: Colors.white, size: 20),
                    title: Text(
                      "Home",
                      style:
                          GoogleFonts.salsa(fontSize: 15, color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => bottom()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.info, color: Colors.white, size: 20),
                    title: Text(
                      "About App",
                      style:
                          GoogleFonts.salsa(fontSize: 15, color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => about(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.people_alt_outlined,
                        color: Colors.white, size: 20),
                    title: Text(
                      "Credits",
                      style:
                          GoogleFonts.salsa(fontSize: 15, color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => credit(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.location_on, color: Colors.white, size: 20),
                    title: Text(
                      "My Location",
                      style:
                          GoogleFonts.salsa(fontSize: 15, color: Colors.white),
                    ),
                    onTap: () async {
                      if (_currentPosition != null) {
                        await _launchMaps(
                            _currentPosition.latitude, _currentPosition.longitude);
                      } else {
                        print('Location not available');
                      }
                    },
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 27, // Changing Drawer Icon Size
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              ),

              backgroundColor: Colors.pink,
              centerTitle: true,
              title: Text('~~ Shecure ~~',
                  style: GoogleFonts.salsa(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      )),
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Image.asset(
                    'images/image4.png',
                    width: 35,
                    height: 35,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert, color: Colors.white),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 0, right: 0),
                          child: Align(
                            alignment: Alignment.center,
                            child: AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    onTap: () {
                                      //Navigator.pop(context);
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => profile(),
                                        ),
                                      );
                                    },
                                    leading:
                                        Icon(Icons.person, color: Colors.pink),
                                    title: Text('Profile',
                                        style: GoogleFonts.salsa(
                                            color: Colors.pink)),
                                  ),
                                  ListTile(
                                    onTap: () {
                                     // Navigator.pop(context);
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => rating(),
                                        ),
                                      );
                                    },
                                    leading: const Icon(Icons.star,
                                        color: Colors.pink),
                                    title: Text('Rate',
                                        style: GoogleFonts.salsa(
                                            color: Colors.pink)),
                                  ),
                                  ListTile(
                                    onTap: () {
                                      // Share the app link or message
                                      Share.share(
                                          'Check out this Women Safety app: https://example.women_safetyapp.com');
                                    },
                                    leading: Icon(Icons.share,
                                        color: Colors.pink),
                                    title: Text('Share',
                                        style: GoogleFonts.salsa(
                                            color: Colors.pink)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              if (currentIndex == 0) {
                                launchUrl(
                                    "https://moderndiplomacy.eu/2023/09/11/women-in-power-norm-not-the-exception/");
                              } else if (currentIndex == 1) {
                                launchUrl(
                                    "https://medium.com/@thejanemorales/self-love-self-respect-self-worth-it-starts-with-you-5338fc2cb267");
                              } else if (currentIndex == 2) {
                                launchUrl(
                                    "https://www.inclusivesecurity.org/publication/why-women-inclusive-security-and-peaceful-societies/");
                              } else if (currentIndex == 3) {
                                launchUrl(
                                    "https://medium.com/change-becomes-you/how-to-stay-positive-in-a-negative-world-3a7b38526a1b");
                              } else if (currentIndex == 4) {
                                launchUrl(
                                    "https://www.fairplanet.org/editors-pick/how-civilized-a-culture-is-depends-on-how-it-treats-women/");
                              } else if (currentIndex == 5) {
                                launchUrl(
                                    "https://positlive.com/at-any-given-moment-you-have-the-power-to-say-this-is-not-how-the-story-is-going-to-end/");
                              } else if (currentIndex == 6) {
                                launchUrl(
                                    "https://www.theschooloflife.com/article/know-yourself/");
                              } else if (currentIndex == 7) {
                                launchUrl(
                                    "https://brightside.me/articles/being-a-loud-woman-may-be-good-for-your-health-according-to-a-study-794499/");
                              } else if (currentIndex == 8) {
                                launchUrl(
                                    "https://www.adaisychasingthesun.com/single-post/2017/05/18/she-wore-her-scars-as-her-best-attire-a-stunning-dress-made-of-hellfire");
                              } else if (currentIndex == 9) {
                                launchUrl(
                                    "https://bigthink.com/words-of-wisdom/indira-gandhi-on-womens-liberation/");
                              } else if (currentIndex == 10) {
                                launchUrl(
                                    "https://starmeadowcounseling.com/blog/why-setting-a-strong-female-role-model-is-important-for-your-daughter/");
                              } else if (currentIndex == 11) {
                                launchUrl(
                                    "https://dvcc.delaware.gov/background-purpose/dynamics-domestic-abuse/");
                              }
                            },
                            child: CarouselSlider(
                              items: imagelist
                                  .map(
                                    (item) => Image.asset(
                                      item['image_path'],
                                      fit: BoxFit.contain,
                                      width: double.infinity,
                                    ),
                                  )
                                  .toList(),
                              carouselController: carouselController,
                              options: CarouselOptions(
                                  scrollPhysics: const BouncingScrollPhysics(),
                                  autoPlay: true,
                                  aspectRatio: 1.8,
                                  viewportFraction: 2,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      currentIndex = index;
                                    });
                                  }),
                            ),
                          ),
                          Positioned(
                              bottom: 4,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:
                                    imagelist.asMap().entries.map((entry) {
                                  print(entry);
                                  print(entry.key);
                                  return GestureDetector(
                                    onTap: () => carouselController
                                        .animateToPage(entry.key),
                                    child: Container(
                                      width: currentIndex == entry.key ? 10 : 5,
                                      height: 5.0,
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 3.0,
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: currentIndex == entry.key
                                              ? Colors.white
                                              : Colors.white),
                                    ),
                                  );
                                }).toList(),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              FlutterPhoneDirectCaller.callNumber('100');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              fixedSize: const Size(110, 110),
                              shape: const CircleBorder(),
                            ),
                            icon: Icon(
                                // <-- Icon
                                Icons.local_police,
                                color: Colors.white,
                                size: 22),
                            label: Text(
                              textAlign: TextAlign.center,
                              'Call\nPolice',
                              style: GoogleFonts.salsa(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on,
                              color: Colors.black, size: 17),
                          Text("Access Locations",
                              style: GoogleFonts.salsa(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () => launchUrl(
                                    "https://www.google.com/maps/search/police+station+nearby+me/@24.9094099,91.874398,14z/data=!3m1!4b1?entry=ttu"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: CircleBorder(),
                                ),
                                child: Image.asset(
                                  'images/policestations.png',
                                  width: 35,
                                  height: 35,
                                ),
                              ),
                              Text("Police Stations",
                                  style: GoogleFonts.salsa(
                                      fontSize: 10,
                                      color: Colors.pink,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () => launchUrl(
                                    "https://www.google.com/maps/search/pharmacy+near+me/@24.9060272,91.874398,14z/data=!3m1!4b1?entry=ttu"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: const CircleBorder(),
                                ),
                                child: Image.asset(
                                  'images/pharmacies.png',
                                  width: 35,
                                  height: 35,
                                ),
                              ),
                              Text("Pharmacies",
                                  style: GoogleFonts.salsa(
                                      fontSize: 10,
                                      color: Colors.pink,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () => launchUrl(
                                    "https://www.google.com/maps/search/hospitals+near+me/@24.9060272,91.874398,14z/data=!3m1!4b1?entry=ttu"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: const CircleBorder(),
                                ),
                                child: Image.asset(
                                  'images/hospitals.png',
                                  width: 35,
                                  height: 35,
                                ),
                              ),
                              Text("Hospitals",
                                  style: GoogleFonts.salsa(
                                      fontSize: 10,
                                      color: Colors.pink,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () => launchUrl(
                                    "https://www.google.com/maps/search/fire+station+nearby+me/@24.9060229,91.8537979,13z/data=!3m1!4b1?entry=ttu"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: const CircleBorder(),
                                ),
                                child: Image.asset(
                                  'images/firestations.png',
                                  width: 35,
                                  height: 35,
                                ),
                              ),
                              Text("Fire Stations",
                                  style: GoogleFonts.salsa(
                                      fontSize: 10,
                                      color: Colors.pink,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(
                            width: 2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => emergency()));
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.pink),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                            icon: Icon(
                                // <-- Icon
                                Icons.add_ic_call_rounded,
                                color: Colors.pink,
                                size: 20),
                            label: Text(
                              textAlign: TextAlign.center,
                              '\nHelpline  \nNumbers  \n',
                              style: GoogleFonts.salsa(fontSize: 13),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => rules()));
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.pink),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                            icon: Icon(
                                // <-- Icon
                                Icons.rule_folder,
                                color: Colors.pink,
                                size: 20),
                            label: Text(
                              textAlign: TextAlign.center,
                              '\nLaws\nFor Women\n',
                              style: GoogleFonts.salsa(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => todo()));
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.pink),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                            icon: Icon(
                                // <-- Icon
                                Icons.view_list_sharp,
                                color: Colors.pink,
                                size: 20),
                            label: Text(
                              textAlign: TextAlign.center,
                              '\nTodo       \nList           \n',
                              style: GoogleFonts.salsa(fontSize: 13),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) => Send()));
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.pink),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                            icon: Icon(
                                // <-- Icon
                                Icons.contact_page,
                                color: Colors.pink,
                                size: 20),
                            label: Text(
                              textAlign: TextAlign.center,
                              '\nEmergency \nContacts \n',
                              style: GoogleFonts.salsa(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  )),
              // )
            )),
      ),
    );
  }
}
