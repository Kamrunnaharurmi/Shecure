import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class msgfamily extends StatefulWidget {
  @override
  _msgfamilyState createState() => _msgfamilyState();
}

class _msgfamilyState extends State<msgfamily> {
  List<Contact> _contacts = [];
  List<Contact> _filteredContacts = [];

  @override
  void initState() {
    super.initState();
    fetchContacts();
  }

  Future<void> fetchContacts() async {
    Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts.toList();
      _filteredContacts =
          _contacts; // Initialize the filtered list with all contacts.
    });
  }

  Future<void> _makePhoneCall(String? phoneNumber) async {
    if (phoneNumber != null && await canLaunch('tel:$phoneNumber')) {
      await launch('tel:$phoneNumber');
    } else {
      // Handle error
      print('Could not launch phone call to $phoneNumber');
    }
  }

  void _filterContacts(String query) {
    setState(() {
      _filteredContacts = _contacts.where((contact) {
        return contact.displayName
            ?.toLowerCase()
            .contains(query.toLowerCase()) ??
            false;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          centerTitle: true,
          title: Text(
            'Contact List',
            style: GoogleFonts.salsa(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios,color: Colors.pink),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search,color: Colors.white),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: ContactSearch(_contacts, _filterContacts),
                );
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: _filteredContacts.length,
          itemBuilder: (context, index) {
            Contact contact = _filteredContacts[index];
            String displayName = contact.displayName ?? '';
            String firstLetter = displayName.isNotEmpty ? displayName[0] : '';

            return ListTile(
              leading: CircleAvatar(
                child: Text(
                  firstLetter,
                  style: GoogleFonts.salsa(
                    color: Colors.pink,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                displayName,
                style: GoogleFonts.salsa(
                  color: Colors.pink,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                contact.phones!.isNotEmpty
                    ? contact.phones?.first.value ?? ''
                    : '',
                style: GoogleFonts.salsa(
                  color: Colors.pink,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.call,
                  color: Colors.pink, // Pink color for the call icon
                ),
                onPressed: () {
                  if (contact.phones!.isNotEmpty) {
                    _makePhoneCall(contact.phones?.first.value);
                  }
                },
              ),
              onTap: () {
                if (contact.phones!.isNotEmpty) {
                  _makePhoneCall(contact.phones?.first.value);
                }
              },
            );
          },
        ),
      ),
    );
  }
}

class ContactSearch extends SearchDelegate<String> {
  final List<Contact> contacts;
  final Function(String) filterCallback;

  ContactSearch(this.contacts, this.filterCallback);

  List<Contact> _filteredContacts = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear,color: Colors.pink, ),
        onPressed: () {
          query = '';
          filterCallback(query);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back,color: Colors.pink, ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Use _filteredContacts to display search results.
    return ListView.builder(
      itemCount: _filteredContacts.length,
      itemBuilder: (context, index) {
        Contact contact = _filteredContacts[index];
        String displayName = contact.displayName ?? '';
        String firstLetter = displayName.isNotEmpty ? displayName[0] : '';

        return ListTile(
          leading: CircleAvatar(
            child: Text(firstLetter,
              style: GoogleFonts.salsa(
                color: Colors.pink,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),),
          ),
          title: Text(displayName,
            style: GoogleFonts.salsa(
              color: Colors.pink,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),),
          subtitle: Text(
            contact.phones!.isNotEmpty ? contact.phones?.first.value ?? '' : '',
            style: GoogleFonts.salsa(
            color: Colors.pink,
          fontSize: 13,
          fontWeight: FontWeight.bold,
          ),
          ),
          onTap: () {
            filterCallback(displayName);
            close(context, displayName);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _filteredContacts = query.isEmpty
        ? contacts
        : contacts.where((contact) {
      return contact.displayName!
          .toLowerCase()
          .startsWith(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: _filteredContacts.length,
      itemBuilder: (context, index) {
        Contact contact = _filteredContacts[index];
        String displayName = contact.displayName ?? '';
        String firstLetter = displayName.isNotEmpty ? displayName[0] : '';

        return ListTile(
          leading: CircleAvatar(
            child: Text(firstLetter,
              style: GoogleFonts.salsa(
                color: Colors.pink,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),),
          ),
          title: Text(displayName,
            style: GoogleFonts.salsa(
              color: Colors.pink,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),),
          subtitle: Text(
            contact.phones!.isNotEmpty ? contact.phones?.first.value ?? '' : '',
            style: GoogleFonts.salsa(
            color: Colors.pink,
          fontSize: 13,
          fontWeight: FontWeight.bold,
          ),
          ),
          onTap: () {
            filterCallback(displayName);
            close(context, displayName);
          },
        );
      },
    );
  }
}