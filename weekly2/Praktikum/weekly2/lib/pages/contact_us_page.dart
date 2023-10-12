import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Contact us',
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            style: GoogleFonts.poppins(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color(0xFFEEEEEE),
                  ),
                  textCapitalization: TextCapitalization.words,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    if (!isCapitalized(value)) {
                      return 'This field is invalid';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color(0xFFEEEEEE),
                  ),
                  textCapitalization: TextCapitalization.words,
                  validator: (value) {
                    if (_lastNameController.text.isNotEmpty &&
                        !isCapitalized(value!)) {
                      return 'This field is invalid';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Color(0xFFEEEEEE),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              if (!isValidEmail(value)) {
                return 'This email is invalid';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _messageController,
            decoration: const InputDecoration(
              labelText: 'Message',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Color(0xFFEEEEEE),
            ),
            maxLines: 5,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
          ),
          const SizedBox(height: 30),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Form Data'),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Name: ${_firstNameController.text} ${_lastNameController.text}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Email: ${_emailController.text}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Message: ${_messageController.text}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text(
                              'OK',
                              style: TextStyle(fontSize: 16),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  ).then((_) {
                    _firstNameController.clear();
                    _lastNameController.clear();
                    _emailController.clear();
                    _messageController.clear();
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 6,
                backgroundColor: const Color(0xFF47657B),
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 18.0,
                ),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          )
        ],
      ),
    );
  }

  bool isCapitalized(String value) {
    if (value.isEmpty) return false;
    final firstLetter = value[0];
    return firstLetter == firstLetter.toUpperCase();
  }

  bool isValidEmail(String value) {
    final emailRegExp = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
        caseSensitive: false);
    return emailRegExp.hasMatch(value);
  }
}
