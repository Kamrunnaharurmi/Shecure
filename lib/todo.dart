import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'des.dart';
import 'home.dart';
import 'task.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class todo extends StatefulWidget {
  const todo({super.key});
  @override
  State<todo> createState() => todoState();
}

class todoState extends State<todo> {
  String uid = '';
  @override
  void initState() {
    super.initState();
    getUid();
  }

  Future<void> getUid() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    if (user != null) {
      setState(() {
        uid = user.uid;
      });
    } else {
      print('Problem Occurs');
    }
  }

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
            backgroundColor: Colors.pink,
            centerTitle: true,
            title: Text('Todo List',
                style: GoogleFonts.salsa(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => home()));
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('tasks')
                  .doc(uid)
                  .collection('mytasks')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text('No tasks available',
                        style: GoogleFonts.salsa(
                            fontSize: 15, color: Colors.black)),
                  );
                } else {
                  final docs = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      var time =
                          (docs[index]['timestamp'] as Timestamp).toDate();

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => des(
                                title: docs[index]['title'],
                                description: docs[index]['description'],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: Text(
                                      docs[index]['title'],
                                      style: GoogleFonts.salsa(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: Text(
                                      DateFormat.yMd().add_jm().format(time),
                                      style: GoogleFonts.salsa(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                onPressed: () async {
                                  await FirebaseFirestore.instance
                                      .collection('tasks')
                                      .doc(uid)
                                      .collection('mytasks')
                                      .doc(docs[index].id)
                                      .delete();
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.border_color, color: Colors.white),
              backgroundColor: Colors.pink,
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => tasks()));
              }),
        ),
      ),
    );
  }
}
