import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'models/contact.dart';

class NewContactForm extends StatefulWidget {
  @override
  _NewContactFormState createState() => _NewContactFormState();
}

class _NewContactFormState extends State<NewContactForm> {
  final _formKey = GlobalKey<FormState>();

  String _name;
  String _age;

  void addContact(Contact contact) {
    //add data to our database, .add no need key, because it's autogenerate +1
    final contactsBox = Hive.box<dynamic>('contacts');
  contactsBox.add(contact);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  onSaved: (value) => _name = value,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _age = value,
                ),
              ),
            ],
          ),
          RaisedButton(
            child: Text('Add New Contact'),
            onPressed: () {
              _formKey.currentState.save();
              final Contact newContact = Contact(_name, int.parse(_age));
              addContact(newContact);
            },
          ),
        ],
      ),
    );
  }
}
