/*import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'child_log.dart';


class reset extends StatefulWidget {
  const reset({super.key});
  @override
  State<reset> createState() => resetState();
}

class resetState extends State<reset> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
            elevation: 0.0,
            backgroundColor: Colors.pink,
            centerTitle: true,
            title: Text(
              'Reset Password',
              textAlign: TextAlign.left,
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
                        builder: (context) => child_log()));
              },
              icon:Icon(Icons.arrow_back_ios,color: Colors.white),
            ),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(left: 60, right: 60, top: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              child: Image.asset(
                                'images/image4.png',
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          cursorColor: Colors.pink,
                          style: GoogleFonts.salsa(
                              color: Colors.pink),
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.pink, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.pink, width: 2.0),
                            ),
                            labelStyle: GoogleFonts.salsa(
                                fontSize: 15,
                                color: Colors.pink,
                                backgroundColor: Colors.white),
                            labelText: "Email",
                            hintStyle: GoogleFonts.salsa(
                              fontSize: 15,
                              color: Colors.pink,
                            ),
                            hintText: "Enter Your Email",
                            prefixIcon: Icon(Icons.email,color: Colors.pink,size:20,),
                            // ... Your InputDecoration properties ...
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Email";
                            }
                            bool emailValid = RegExp(
                                r'(?=.*[a-z])[0-9._%+-]+@(gmail|outlook|yahoo)\.com$')
                                .hasMatch(value);

                            if (!emailValid) {
                              return "Enter Valid Email";
                            } else {
                              return null; // Return null on success
                            }
                          },
                        ),

                        SizedBox(
                          height:15,
                        ),

                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  FirebaseAuth.instance.sendPasswordResetEmail(
                                    email: emailController.text,
                                  ).then((value) {
                                    print("User signed in successfully");
                                    emailController.clear();
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                            'Done',
                                            style: GoogleFonts.salsa(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.pink,
                                            ),
                                          ),
                                          content: Text(
                                            'Mail sent to your account',
                                            style: GoogleFonts.salsa(
                                              fontSize: 15,
                                              color: Colors.pink,
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => child_log()),
                                                );
                                              },
                                              child: Text(
                                                'Ok',
                                                style: GoogleFonts.salsa(
                                                  fontSize: 12,
                                                  color: Colors.pink,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => child_log(),
                                      ),
                                    );
                                  }).catchError((error) {
                                    print("Error in reset password: $error");
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                            'Sorry!',
                                            style: GoogleFonts.salsa(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.pink,
                                            ),
                                          ),
                                          content: Text(
                                            'Error Occurs',
                                            style: GoogleFonts.salsa(
                                              fontSize: 15,
                                              color: Colors.pink,
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => child_log()),
                                                );
                                              },
                                              child: Text(
                                                'Ok',
                                                style: GoogleFonts.salsa(
                                                  fontSize: 12,
                                                  color: Colors.pink,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );

                                    // Handle error here, such as displaying a snackbar with the error message
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pink,
                              ),
                              child: Text(
                                'Send Email',
                                style: GoogleFonts.salsa(
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'child_log.dart';

class reset extends StatefulWidget {
  const reset({Key? key}) : super(key: key);

  @override
  resetState createState() => resetState();
}

class resetState extends State<reset> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
            elevation: 0.0,
            backgroundColor: Colors.pink,
            centerTitle: true,
            title: Text(
              'Reset Password',
              textAlign: TextAlign.left,
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
                  MaterialPageRoute(builder: (context) => child_log()),
                );
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(left: 60, right: 60, top: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              child: Image.asset(
                                'images/image4.png',
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          cursorColor: Colors.pink,
                          style: GoogleFonts.salsa(color: Colors.pink),
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.pink, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.pink, width: 2.0),
                            ),
                            labelStyle: GoogleFonts.salsa(
                              fontSize: 15,
                              color: Colors.pink,
                              backgroundColor: Colors.white,
                            ),
                            labelText: "Email",
                            hintStyle: GoogleFonts.salsa(
                              fontSize: 15,
                              color: Colors.pink,
                            ),
                            hintText: "Enter Your Email",
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.pink,
                              size: 20,
                            ),
                            // ... Your InputDecoration properties ...
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Email";
                            }
                            bool emailValid = RegExp(
                                r'(?=.*[a-z])[0-9._%+-]+@(gmail|outlook|yahoo)\.com$')
                                .hasMatch(value);

                            if (!emailValid) {
                              return "Enter Valid Email";
                            } else {
                              return null; // Return null on success
                            }
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              String email = emailController.text;
                              bool isEmailExists =
                              await _checkEmailExistsInFirestore(email);

                              if (isEmailExists) {
                                try {
                                  await _auth.sendPasswordResetEmail(
                                    email: email,
                                  );
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          'Done',
                                          style: GoogleFonts.salsa(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.pink,
                                          ),
                                        ),
                                        content: Text(
                                          'Mail sent to your account',
                                          style: GoogleFonts.salsa(
                                            fontSize: 15,
                                            color: Colors.pink,
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        child_log()),
                                              );
                                            },
                                            child: Text(
                                              'Ok',
                                              style: GoogleFonts.salsa(
                                                fontSize: 12,
                                                color: Colors.pink,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } catch (error) {
                                  print("Error in reset password: $error");
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          'Sorry!',
                                          style: GoogleFonts.salsa(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.pink,
                                          ),
                                        ),
                                        content: Text(
                                          'Error Occurs',
                                          style: GoogleFonts.salsa(
                                            fontSize: 15,
                                            color: Colors.pink,
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        child_log()),
                                              );
                                            },
                                            child: Text(
                                              'Ok',
                                              style: GoogleFonts.salsa(
                                                fontSize: 12,
                                                color: Colors.pink,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Error',
                                        style: GoogleFonts.salsa(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.pink,
                                        ),
                                      ),
                                      content: Text(
                                        'Email address is not registered.Please try with the registered one.',
                                        style: GoogleFonts.salsa(
                                          fontSize: 15,
                                          color: Colors.pink,
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      reset()),
                                            );
                                          },
                                          child: Text(
                                            'Ok',
                                            style: GoogleFonts.salsa(
                                              fontSize: 12,
                                              color: Colors.pink,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                          ),
                          child: Text(
                            'Send Email',
                            style: GoogleFonts.salsa(
                                fontSize: 15, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _checkEmailExistsInFirestore(String email) async {
    try {
      var snapshot = await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();
      return snapshot.docs.isNotEmpty;
    } catch (e) {
      print("Error checking email existence in Firestore: $e");
      return false;
    }
  }
}
