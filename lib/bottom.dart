import 'package:flutter/material.dart';
import 'package:shecure/msgfamily.dart';
import 'home.dart';
import 'escape.dart';
import 'defence.dart';
import 'safety.dart';

class bottom extends StatefulWidget {
  const bottom({super.key});

  @override
  State<bottom> createState() => bottomState();
}

class bottomState extends State<bottom> {
  int myIndex = 0;
  final pages = [home(), safety(), escape(), defence(), msgfamily()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/image2.jpg"),
                fit: BoxFit.cover),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child:BottomNavigationBar(
              fixedColor: Colors.pink,
              iconSize: 25,
              type:  BottomNavigationBarType.shifting,
              backgroundColor: Colors.white,
              showUnselectedLabels: false,
              onTap: (index) {
                setState(() {
                  myIndex = index;
                });
              },
              currentIndex: myIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home,color: Colors.pink),
                  label:'Home',
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.tips_and_updates,color: Colors.pink),
                  label:'Tips',
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.run_circle,color: Colors.pink),
                  label: 'Escape',
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.movie,color: Colors.pink),
                  label: 'Defence',
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.call,color: Colors.pink),
                  label: 'Contacts',
                ),
              ],
            ),
          ),
        ),
        body: pages[myIndex],
      ),
    );
  }
}
