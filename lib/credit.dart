import 'package:flutter/material.dart';
import 'bottom.dart';
import 'package:google_fonts/google_fonts.dart';

class credit extends StatefulWidget {
  const credit({super.key});

  @override
  State<credit> createState() => creditState();
}

class creditState extends State<credit> {
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
              title: Text('Credits',
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
                          builder: (context) => bottom()));
                },
                icon:Icon(Icons.arrow_back_ios,color: Colors.white),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Image.asset(
                        'images/image5.jpg',
                        width: 100,
                        height: 100,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        textAlign: TextAlign.center,
                        style: GoogleFonts.salsa(color: Colors.pink,fontSize: 15,fontWeight: FontWeight.bold
                        ),
                        "LEADING UNIVERSITY , SYLHET"),
                    Text(
                        textAlign: TextAlign.center,
                        style: GoogleFonts.salsa(fontSize: 15,fontWeight: FontWeight.bold
                        ),
                        "Department of Computer Science & Engineering\n"),

                    Text(
                        textAlign: TextAlign.center,
                        style: GoogleFonts.salsa(color: Colors.pink,fontSize: 15,fontWeight: FontWeight.bold
                        ),
                        "\nApp Developers"),

                    Text(
                        textAlign: TextAlign.center,
                        style: GoogleFonts.salsa(fontSize: 13,fontWeight: FontWeight.bold
                        ),
                        "Kamrun Nahar\nID:2012020309\nSection:53(G)"),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        textAlign: TextAlign.center,
                        style: GoogleFonts.salsa(fontSize: 13,fontWeight: FontWeight.bold
                        ),
                        "Zeenat Sultana Nishat\nID:2012020313\nSection:53(G)\n"),

                    Text(
                        textAlign: TextAlign.center,
                        style: GoogleFonts.salsa(color: Colors.pink,fontSize: 15, fontWeight: FontWeight.bold),
                        "\nMentor"),
                    Text(
                        textAlign: TextAlign.center,
                        style: GoogleFonts.salsa(fontSize: 13,fontWeight: FontWeight.bold
                        ),
                        "Mohammad Shoaib Rahman\nLecturer\nDepartment of Computer Science & Engineering"),

                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}
