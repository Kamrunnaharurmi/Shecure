import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'child_log.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'first.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class child_register extends StatefulWidget {
  const child_register({Key? key}) : super(key: key);
  @override
  State<child_register> createState() => child_registerState();
}

class child_registerState extends State<child_register> {
  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;
  bool _isHidden2 = true;
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Uint8List? _img;
  Future<void> pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? file = await _imagePicker.pickImage(source: source);
    if (file != null) {
      setState(() {
        _img = File(file.path).readAsBytesSync();
      });
    }
  }

  Future<void> _showImageSourceDialog() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Select Image Source ",
            style: GoogleFonts.salsa(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.pink,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library,color: Colors.pink,size:20),
                title: Text(
                  "Gallery",
                  style: GoogleFonts.salsa(
                    fontSize: 15,
                    color: Colors.pink,
                  ),
                ),
                onTap: () {
                  pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.camera,color: Colors.pink,size:20),
                title: Text(
                  "Camera",
                  style: GoogleFonts.salsa(
                    fontSize: 15,
                    color: Colors.pink,
                  ),
                ),
                onTap: () {
                  pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
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
            elevation: 0.0,
            backgroundColor: Colors.pink,
            centerTitle: true,
            title: Text(
              'Register as User!',
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
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                _img != null
                                    ? CircleAvatar(
                                        radius: 50,
                                        backgroundImage: MemoryImage(_img!),
                                      )
                                    : CircleAvatar(
                                        radius: 50,
                                        backgroundImage:
                                            AssetImage('images/avater.png'),
                                      ),
                                Positioned(
                                  child: IconButton(
                                    onPressed: _showImageSourceDialog,
                                    icon: Icon(Icons.add_a_photo,
                                        color: Colors.black, size: 25),
                                  ),
                                  bottom: -10,
                                  left: 55,
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: nameController,
                          validator: (value) {
                            RegExp regex = RegExp(
                                r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
                            if (value == null || value.isEmpty) {
                              return 'Enter Your Name';
                            }
                            if (!regex.hasMatch(value)) {
                              return 'Enter a valid UserName';
                            }
                            return null;
                          },
                          cursorColor: Colors.pink,
                          style: GoogleFonts.salsa(
                            color: Colors.pink,
                          ),
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
                            labelText: 'Name',
                            hintStyle: GoogleFonts.salsa(
                              fontSize: 15,
                              color: Colors.pink,
                            ),
                            hintText: 'Enter Your Name',
                            prefixIcon: Icon(Icons.person,
                                color: Colors.pink, size: 20),
                          ),
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          controller: emailController,
                          validator: (value) {
                            RegExp regex = RegExp(
                                r'(?=.*[a-z])[0-9._%+-]+@(gmail|outlook|yahoo)\.com$');
                            if (value == null || value.isEmpty) {
                              return 'Please Enter an email address';
                            }
                            if (!regex.hasMatch(value)) {
                              return 'Please enter a valid Email';
                            }
                            return null;
                          },
                          cursorColor: Colors.pink,
                          style: GoogleFonts.salsa(
                            color: Colors.pink,
                          ),
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
                            labelText: 'Email',
                            hintStyle: GoogleFonts.salsa(
                              fontSize: 15,
                              color: Colors.pink,
                            ),
                            hintText: 'Enter Your Email',
                            prefixIcon:
                                Icon(Icons.email, color: Colors.pink, size: 20),
                          ),
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            RegExp regex = RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                            if (value == null || value.isEmpty) {
                              return 'Please Enter The Password';
                            }
                            if (!regex.hasMatch(value)) {
                              return 'Password should contain 1 upper case, 1 lower case, 1 digit, 1 special character, and have a length of at least 8';
                            }
                            return null;
                          },
                          cursorColor: Colors.pink,
                          style: GoogleFonts.salsa(
                            color: Colors.pink,
                          ),
                          obscureText: _isHidden,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.pink, width: 2.0),
                            ),
                            enabledBorder: const OutlineInputBorder(
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
                            prefixIcon:
                                Icon(Icons.lock, color: Colors.pink, size: 20),
                            suffix: InkWell(
                              onTap: () {
                                setState(() {
                                  _isHidden = !_isHidden;
                                });
                              },
                              child: Icon(
                                _isHidden
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.pink,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          controller: confirmPasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the password';
                            }
                            if (value != passwordController.text) {
                              return 'Confirmation password does not match the entered password';
                            }
                            return null;
                          },
                          obscureText: _isHidden2,
                          cursorColor: Colors.pink,
                          style: GoogleFonts.salsa(
                            color: Colors.pink,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.pink, width: 2.0),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.pink, width: 2.0),
                            ),
                            labelStyle: GoogleFonts.salsa(
                                fontSize: 15,
                                color: Colors.pink,
                                backgroundColor: Colors.white),
                            labelText: 'Confirm Password',
                            hintStyle: GoogleFonts.salsa(
                              fontSize: 15,
                              color: Colors.pink,
                            ),
                            hintText: 'Enter Confirm Password',
                            prefixIcon: const Icon(Icons.lock,
                                color: Colors.pink, size: 20),
                            suffix: InkWell(
                              onTap: () {
                                setState(() {
                                  _isHidden2 = !_isHidden2;
                                });
                              },
                              child: Icon(
                                _isHidden2
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.pink,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          controller: numberController,
                          validator: (value) {
                            RegExp regex =
                                RegExp(r'^\+?(88)?0?1[3456789][0-9]{8}\b');
                            if (value == null || value.isEmpty) {
                              return 'Please enter the phone number';
                            } else if (value.length != 11) {
                              return 'Mobile Number must be of 11 digits';
                            } else if (!regex.hasMatch(value)) {
                              return 'Please enter a valid mobile number';
                            }
                            return null;
                          },
                          cursorColor: Colors.pink,
                          style: GoogleFonts.salsa(
                            color: Colors.pink,
                          ),
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
                            labelText: 'Contact',
                            hintStyle: GoogleFonts.salsa(
                              fontSize: 15,
                              color: Colors.pink,
                            ),
                            hintText: 'Enter Your Mobile Number',
                            prefixIcon:
                                Icon(Icons.phone, color: Colors.pink, size: 20),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already Have An Account?",
                                style: GoogleFonts.salsa(fontSize: 13)),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => child_log(),
                                  ),
                                );
                              },
                              child: Text(
                                'Login',
                                style: GoogleFonts.salsa(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.pink),
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );

                                String uid = userCredential.user!.uid;
                                print("User signed up successfully with UID: $uid");

                                String? imageUrl; // Initialize imageUrl variable

                                // Check if _img is not null and upload image to Firebase Storage
                                if (_img != null) {
                                  String imagePath = 'profile_images/$uid.jpg';
                                  UploadTask uploadTask = FirebaseStorage.instance.ref().child(imagePath).putData(_img!);
                                  TaskSnapshot taskSnapshot = await uploadTask;
                                  imageUrl = await taskSnapshot.ref.getDownloadURL();
                                }
                                // Save user data to Firestore
                                await FirebaseFirestore.instance.collection("profile").doc(uid).set({
                                  'username': nameController.text,
                                  'email': emailController.text,
                                  'pass': passwordController.text,
                                  'contact': numberController.text,
                                  'profileImage': imageUrl, // Set profile image URL here
                                });
                                // Show success dialog
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Welcome ${nameController.text}',
                                        style: GoogleFonts.salsa(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.pink,
                                        ),
                                      ),
                                      content: Text(
                                        'You are registered now',
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
                                                builder: (context) => child_log(),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'OK',
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
                                // Show error dialog
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Oops!',
                                        style: GoogleFonts.salsa(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.pink,
                                        ),
                                      ),
                                      content: Text(
                                        'Error Found: $error',
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
                                                builder: (context) => child_register(),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Try again',
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
                            'Sign Up',
                            style: GoogleFonts.salsa(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
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
