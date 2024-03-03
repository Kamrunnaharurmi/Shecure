import 'package:flutter/material.dart';
import 'package:shecure/bottom.dart';
import 'child_register.dart';
import 'first.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reset.dart';
import 'package:firebase_auth/firebase_auth.dart';

class child_log extends StatefulWidget {
  const child_log({super.key});
  @override
  State<child_log> createState() => child_logState();
}

class child_logState extends State<child_log> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isHidden = true;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

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
            backgroundColor: Colors.pink,
            centerTitle: true,
            title: Text(
              'Login First',
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
                  MaterialPageRoute(builder: (context) => first()),
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
                          height: 30,
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
                        //Email
                        TextFormField(
                          cursorColor: Colors.pink,
                          style: GoogleFonts.salsa(
                          color: Colors.pink,
                        ),
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
                            if (value == null || value.isEmpty) {
                              return "Enter Email";
                            }
                            bool emailValid = RegExp(
                                r'(?=.*[a-z])[0-9._%+-]+@(gmail|outlook|yahoo)\.com$'
                            ).hasMatch(value);
                            if (!emailValid) {
                              return "Enter Valid Email";
                            } else {
                              return null; // Return null on success
                            }
                          },
                        ),
                        SizedBox(
                          height:5,
                        ),

                        TextFormField(
                          cursorColor: Colors.pink,
                          style: GoogleFonts.salsa(
                          color: Colors.pink,
                        ),
                          obscureText: _isHidden,
                          controller: passwordController, // Add this line
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.pink, width: 2.0),
                            ),
                            enabledBorder:  OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.pink, width: 2.0),
                            ),
                            labelStyle: GoogleFonts.salsa(
                                fontSize: 15,
                                color: Colors.pink,
                                backgroundColor: Colors.white),
                            labelText: 'Password',
                            hintStyle: GoogleFonts.salsa(
                              fontSize: 15,
                              color: Colors.pink,
                            ),
                            hintText: 'Enter Password',
                            prefixIcon: Icon(Icons.lock,color: Colors.pink,size:20,),
                            suffix: InkWell(
                              onTap: _togglePasswordView,
                              child: Icon(
                                !_isHidden
                                    ? Icons.visibility
                                    : Icons.visibility_off,color: Colors.pink,size:20,
                              ),
                            ),
                            // ... Your InputDecoration properties ...
                          ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Password";
                              }
                              bool passwordValid = RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'
                              ).hasMatch(value);
                              if (!passwordValid) {
                                return "Password should contain 1 upper case, 1 lower case, 1 digit, 1 special character, minimum 8 length!";
                              } else {
                                return null; // Return null on success

                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => reset(),
                                  ),
                                );
                              },
                              child: Text(
                                'Forgot Pasword?',
                                style: GoogleFonts.salsa(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't Have any account?",
                                style: GoogleFonts.salsa(fontSize: 13)),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => child_register(),
                                  ),
                                );
                              },
                              child: Text(
                                'Register',
                                style: GoogleFonts.salsa(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.pink),
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              ).then((value) {
                                print("User signed in successfully");
                                emailController.clear();
                                passwordController.clear();
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Great',
                                        style: GoogleFonts.salsa(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.pink,
                                        ),
                                      ),
                                      content: Text(
                                        'Successfully Logged In',
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
                                              MaterialPageRoute(builder: (context) => bottom()),
                                            );
                                          },
                                          child: Text(
                                            'Go',
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
                              }).catchError((error) {
                                print("Error signing in: $error");
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
                            'Sign In',
                            style: GoogleFonts.salsa(
                              fontSize: 15,
                              color: Colors.white,
                            ),
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
}
