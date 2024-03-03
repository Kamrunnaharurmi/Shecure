import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shecure/bottom.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shake/shake.dart';
import 'home.dart';

class Send extends StatefulWidget {
  @override
  _SendState createState() => _SendState();
}

class _SendState extends State<Send> {
  List<Contact> _selectedContacts = [];
  String uid = '';

  @override
  void initState() {
    super.initState();
    getUid();

    // Initialize ShakeDetector for handling emergency shake
    ShakeDetector.autoStart(
      onPhoneShake: () {
        _handleEmergency();
      },
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );
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
              'Emergency Contacts',
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
                  MaterialPageRoute(builder: (context) => bottom()),
                );
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _navigateToContactPage,
                child: Text(
                  'Add Contacts',
                  style: GoogleFonts.salsa(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.pink),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Selected Contacts:',
                style: GoogleFonts.salsa(
                  color: Colors.pink,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: FutureBuilder<List<Contact>>(
                  future: _getContactsFromFirebase(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      List<Contact>? contacts = snapshot.data;
                      return ListView.builder(
                        itemCount: contacts?.length ?? 0,
                        itemBuilder: (context, index) {
                          Contact contact = contacts![index];
                          return ListTile(
                            title: Text(
                              contact.displayName ?? '',
                              style: GoogleFonts.salsa(
                                color: Colors.pink,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.delete, color: Colors.pink),
                              onPressed: () async {
                                await _deleteContact(contact);
                                setState(() {
                                  contacts.removeAt(index);
                                });
                              },
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<Contact>> _getContactsFromFirebase() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('selected_contacts')
          .doc(uid)
          .collection('contacts')
          .get();
      List<Contact> contacts = [];
      querySnapshot.docs.forEach((doc) {
        contacts.add(Contact(
          displayName: doc['name'],
          phones: [Item(label: 'mobile', value: doc['phoneNumber'])],
        ));
      });
      return contacts;
    } catch (e) {
      print('Error fetching contacts: $e');
      throw Exception('Failed to fetch contacts');
    }
  }

  void _navigateToContactPage() async {
    var selectedContacts = await Navigator.push<List<Contact>>(
      context,
      MaterialPageRoute(
        builder: (context) => ContactPage(),
      ),
    );

    if (selectedContacts != null) {
      await _saveContactsToFirebase(selectedContacts);
      setState(() {
        _selectedContacts = selectedContacts;
      });
    }
  }

  Future<void> _saveContactsToFirebase(List<Contact> contacts) async {
    try {
      var batch = FirebaseFirestore.instance.batch();
      contacts.forEach((contact) {
        var docRef = FirebaseFirestore.instance
            .collection('selected_contacts')
            .doc(uid)
            .collection('contacts')
            .doc(); // You may want to use a unique ID for each contact
        batch.set(docRef, {
          'name': contact.displayName,
          'phoneNumber': contact.phones?.first.value,
        });
      });
      await batch.commit();
    } catch (e) {
      print('Error saving contacts to Firebase: $e');
    }
  }

  Future<void> _deleteContact(Contact contact) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('selected_contacts')
          .doc(uid)
          .collection('contacts')
          .where('phoneNumber', isEqualTo: contact.phones?.first.value)
          .get();
      querySnapshot.docs.forEach((doc) {
        doc.reference.delete();
      });
    } catch (e) {
      print('Error deleting contact: $e');
    }
  }

  void _handleEmergency() async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Sending emergency messages...',
          style: GoogleFonts.salsa(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.pink,
      ),
    );

    try {
      // Retrieve current location
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Fetch contacts from Firebase
      List<Contact> contacts = await _getContactsFromFirebase();

      // Construct message with current location details
      String message =
          "I am in danger. Here is my location: Latitude: ${position.latitude}, Longitude: ${position.longitude}";

      // Check if contacts are available
      if (contacts.isNotEmpty) {
        // Iterate through selected contacts and send messages
        for (Contact contact in contacts) {
          // Send emergency message
          _sendEmergencyMessage(contact.phones?.first.value, message);
        }
      } else {
        print('No contacts selected for emergency message.');
      }
    } catch (e) {
      print('Error handling emergency: $e');
      // Handle error gracefully
    }
  }

  void _sendEmergencyMessage(String? phoneNumber, String message) async {
    if (phoneNumber != null && phoneNumber.isNotEmpty) {
      try {
        // Construct the SMS URL with the message and current location
        String url = 'sms:$phoneNumber?body=$message';
        // Check if the device can launch the SMS URL
        if (await canLaunch(url)) {
          // Launch the SMS URL
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      } catch (e) {
        print('Error sending emergency message: $e');
        // Handle error gracefully
      }
    }
  }
}

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<Contact> _contacts = [];
  List<Contact> _selectedContacts = [];

  @override
  void initState() {
    super.initState();
    _getContacts();
  }

  Future<void> _getContacts() async {
    Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts.toList();
    });
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
            centerTitle: true,
            title: Text(
              'Select Contacts',
              style: GoogleFonts.salsa(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
            backgroundColor: Colors.pink,
            foregroundColor: Colors.white,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _contacts.length,
                  itemBuilder: (context, index) {
                    Contact contact = _contacts[index];
                    return ListTile(
                      title: Text(
                        contact.displayName ?? '',
                        style: GoogleFonts.salsa(
                          color: Colors.pink,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          if (_selectedContacts.contains(contact)) {
                            _selectedContacts.remove(contact);
                          } else {
                            _selectedContacts.add(contact);
                          }
                        });
                      },
                      trailing: _selectedContacts.contains(contact)
                          ? Icon(Icons.check_circle, color: Colors.pink)
                          : Icon(Icons.circle_outlined, color: Colors.pink),
                    );
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context, _selectedContacts);
            },
            backgroundColor: Colors.pink,
            foregroundColor: Colors.white,
            child: Icon(Icons.done),
          ),
        ),
      ),
    );
  }
}
