import 'package:flutter/material.dart';
import 'bottom.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';


class emergency extends StatefulWidget {
  const emergency({super.key});

  @override
  State<emergency> createState() => emergencyState();
}

class emergencyState extends State<emergency> {
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
                title: Text('HelpLines',
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
              ),

              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1.0),
                        child: Image.asset('images/call2.jpg',
                          width: 70,
                          height: 70,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          ElevatedButton.icon(
                            onPressed: () {
                              FlutterPhoneDirectCaller.callNumber('999');
                            },
                            icon: Icon( // <-- Icon
                                Icons.call,color: Colors.white,size: 15),
                            style: ElevatedButton.styleFrom(
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5))),
                              backgroundColor: Colors.pink,
                            ),
                            label: (
                                Text(
                                    "National Emergency Hotline-999",textAlign: TextAlign.center,
                                    style: GoogleFonts.salsa(
                                        fontSize: 15
                                        ,color: Colors.white))),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1.0),
                        child: Image.asset('images/women.png',
                          width: 70,
                          height: 70,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          ElevatedButton.icon(
                            onPressed: () {
                              FlutterPhoneDirectCaller.callNumber('10921');
                            },
                            icon: Icon( // <-- Icon
                                Icons.call,color: Colors.white,size: 15),
                            style: ElevatedButton.styleFrom(
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5))),
                              backgroundColor: Colors.pink,
                            ),
                            label: (
                                Text(
                                    "Women Helpline-10921",textAlign: TextAlign.center,
                                    style: GoogleFonts.salsa(
                                        fontSize: 15
                                        ,color: Colors.white))),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1.0),
                        child: Image.asset('images/call1.png',
                          width: 70,
                          height: 70,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          ElevatedButton.icon(
                            onPressed: () {
                              FlutterPhoneDirectCaller.callNumber('333');
                            },
                            icon: Icon( // <-- Icon
                                Icons.call,color: Colors.white,size: 15),
                            style: ElevatedButton.styleFrom(
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5))),
                              backgroundColor: Colors.pink,
                            ),
                            label: (
                                Text(
                                    "National Hotline Number-333",textAlign: TextAlign.center,
                                    style: GoogleFonts.salsa(
                                        fontSize: 15
                                        ,color: Colors.white))),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1.0),
                        child: Image.asset('images/phone.png',
                          width: 70,
                          height: 70,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          ElevatedButton.icon(
                            onPressed: () {
                              FlutterPhoneDirectCaller.callNumber('101');
                            },
                            icon: Icon( // <-- Icon
                                Icons.call,color: Colors.white,size: 15),
                            style: ElevatedButton.styleFrom(
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5))),
                              backgroundColor: Colors.pink,
                            ),
                            label: (
                                Text(
                                    "RAB Helpdesk-101",textAlign: TextAlign.center,
                                    style: GoogleFonts.salsa(
                                        fontSize: 15
                                        ,color: Colors.white))),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1.0),
                        child: Image.asset('images/fire.png',
                          width: 70,
                          height: 70,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          ElevatedButton.icon(
                            onPressed: () {
                              FlutterPhoneDirectCaller.callNumber('102');
                            },
                            icon: Icon( // <-- Icon
                                Icons.call,color: Colors.white,size: 15),
                            style: ElevatedButton.styleFrom(
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5))),
                              backgroundColor: Colors.pink,
                            ),
                            label: (
                                Text(
                                    "Fire Service Hotline-102",textAlign: TextAlign.center,
                                    style: GoogleFonts.salsa(
                                        fontSize: 15
                                        ,color: Colors.white))),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              )
          )
      ),
    );
  }
}
