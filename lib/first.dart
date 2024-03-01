import 'package:flutter/material.dart';
import 'child_log.dart';
import 'package:google_fonts/google_fonts.dart';
import 'child_register.dart';

class first extends StatelessWidget {
  const first({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              body: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 150,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0),
                                child: Image.asset('images/image4.png',
                                  width: 200,
                                  height: 200,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => child_register()));},
                                style: ElevatedButton.styleFrom(
                                  shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15))),
                                  backgroundColor: Colors.pink,
                                ),
                                icon: Icon( // <-- Icon
                                    Icons.verified_user,color: Colors.white,size: 20),
                                label: (
                                    Text(
                                        "\nPlease Create An Account\n",textAlign: TextAlign.center,
                                        style: GoogleFonts.salsa(
                                            fontSize: 15
                                            ,color: Colors.white))),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              ElevatedButton.icon(

                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => child_log()));
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15))),
                                  backgroundColor: Colors.pink,
                                ),
                                icon: Icon( // <-- Icon
                                    Icons.supervised_user_circle,color: Colors.white,size: 20),
                                label: (
                                    Text(
                                        "\nAlready Have An Account!\n",textAlign: TextAlign.center,
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
                      )
                  )
              )
          )
      ),
    );
  }
}