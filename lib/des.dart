import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shecure/todo.dart';

class des extends StatelessWidget {
  final String title;
  final String description;

  des({Key? key, required this.title, required this.description}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/image2.jpg"), fit: BoxFit.cover),
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
            title: Text('Description',
                style: GoogleFonts.salsa(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => todo()),
                );
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.salsa(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    description,
                    style: GoogleFonts.salsa(
                        fontSize: 18,
                        color: Colors.pink),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
