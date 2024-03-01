import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shecure/bottom.dart';
import 'child_log.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => ProfileState();
}

class ProfileState extends State<profile> {
  late String username = '';
  late String email = '';
  late String contact = '';
  String? imageUrl; // Make imageUrl nullable

  @override
  void initState() {
    super.initState();
    _fetchUserInfo();
  }

  // Function to fetch user information from Firestore
  Future<void> _fetchUserInfo() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userInfo = await FirebaseFirestore.instance
          .collection('profile')
          .doc(user.uid)
          .get();
      setState(() {
        imageUrl = userInfo['profileImage'];
        username = userInfo['username'];
        email = userInfo['email'];
        contact = userInfo['contact'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/image2.jpg"),
            fit: BoxFit.cover,
          ),
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
            title: Text(
              'Profile',
              style: GoogleFonts.salsa(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
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
              padding: EdgeInsets.only(left: 25, right: 25, top: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: imageUrl != null && imageUrl!.isNotEmpty
                        ? NetworkImage(imageUrl!)
                        : AssetImage('images/avater.png') as ImageProvider,
                  ),

                  Divider(
                    thickness: 2,
                    color: Colors.pink,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Username: $username',
                    style: GoogleFonts.salsa(fontSize: 15, color: Colors.pink),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Email: $email',
                    style: GoogleFonts.salsa(fontSize: 15, color: Colors.pink),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Contact: $contact',
                    style: GoogleFonts.salsa(fontSize: 15, color: Colors.pink),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          FirebaseAuth.instance.signOut().then((value) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => child_log(),
                              ),
                            );
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.pink),
                          foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        icon: Icon(
                          Icons.logout,
                          color: Colors.white,
                          size: 20,
                        ),
                        label: Text(
                          'LogOut',
                          style: GoogleFonts.salsa(fontSize: 13),
                        ),
                      ),
                    ],
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
