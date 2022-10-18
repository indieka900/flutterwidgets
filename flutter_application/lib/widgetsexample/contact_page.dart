// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class Contact {
  final String name;
  final String id;
  String phone;
  Contact({
    required this.name,
    required this.phone,
  }) : id = const Uuid().v4();
}

class ContactBook extends ValueNotifier<List<Contact>> {
  ContactBook._sharedInstance() : super([]);
  static final ContactBook _shared = ContactBook._sharedInstance();
  factory ContactBook() => _shared;

  int get length => value.length;

  void add({required Contact contact}) {
    final contacts = value;
    contacts.add(contact);
    notifyListeners();
  }

  void remove({required Contact contact}) {
    final contacts = value;
    if (contacts.contains(contact)) {
      contacts.remove(contact);
      notifyListeners();
    }
  }

  Contact? contact({required int atIndex}) =>
      value.length > atIndex ? value[atIndex] : null;
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 231, 177, 213),
      body: ValueListenableBuilder(
        valueListenable: ContactBook(),
        builder: (context, value, child) {
          final contacts = value;
          return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final contact = contacts[index];
              return Card(
                child: Dismissible(
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) =>
                      ContactBook().remove(contact: contact),
                  key: ValueKey(contact.id),
                  background: Container(
                    color: Colors.redAccent,
                    padding: const EdgeInsets.only(left: 20),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.delete),
                    ),
                  ),
                  child: Material(
                    color: const Color.fromARGB(255, 250, 244, 244),
                    elevation: 8.0,
                    child: ListTile(
                      title: Text((contact.name).toUpperCase(),
                          style: GoogleFonts.heebo()),
                      subtitle: Text(
                        contact.phone,
                        style: GoogleFonts.mukta(),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.red,
                        backgroundImage: index % 2 == 0
                            ? const AssetImage('images/profile.jpg')
                            : const AssetImage('images/bazu.jpg'),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return const Addcontact();
            }),
          );
        },
        child: const Icon(Icons.person_add),
      ),
    );
  }
}

class Addcontact extends StatefulWidget {
  const Addcontact({super.key});

  @override
  State<Addcontact> createState() => _AddcontactState();
}

class _AddcontactState extends State<Addcontact> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 189, 245, 99),
      appBar: AppBar(
        title: const Text(
          'Add a new contact',
          style: TextStyle(
              color: Color.fromARGB(255, 97, 32, 27),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 3, 250, 11),
      ),
      body: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              hintText: 'Enter the name...',
              icon: Icon(Icons.person),
            ),
          ),
          TextField(
            controller: _phoneController,
            decoration: const InputDecoration(
              hintText: 'Enter the phone number',
              icon: Icon(Icons.phone),
            ),
          ),
          TextButton(
            onPressed: () {
              final contact = Contact(
                  name: _nameController.text, phone: _phoneController.text);
              ContactBook().add(contact: contact);
              setState(() {
                Navigator.of(context).pop();
              });
            },
            child: const Text('Save Contact'),
          )
        ],
      ),
    );
  }
}
