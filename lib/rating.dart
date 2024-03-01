import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'bottom.dart';
import 'package:google_fonts/google_fonts.dart';

class rating extends StatefulWidget {
  const rating({Key? key}) : super(key: key);

  @override
  State<rating> createState() => ratingState();
}

class ratingState extends State<rating> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.pink,
            centerTitle: true,
            title: Text(
              'Rating Us!',
              style: GoogleFonts.salsa(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => bottom(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/image2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RatingBar.builder(
                    initialRating: rating, // Set the initial rating value
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 40.0,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.pink,
                    ),
                    onRatingUpdate: (double value) {
                      setState(() {
                        rating = value; // Update the rating value when the user interacts
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: Size(150, 50),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Thank You!',
                              style: GoogleFonts.salsa(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.pink),
                            ),
                            content: Text('You have rated us $rating stars.',
                              style: GoogleFonts.salsa(
                                  fontSize: 15,
                                  color: Colors.pink),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => bottom()));
                                },
                                child: Text(
                                  'OK',
                                  style: GoogleFonts.salsa(
                                      fontSize: 12,
                                      color: Colors.pink),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      'Submit Rating',
                      style: GoogleFonts.salsa(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.pink),
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
