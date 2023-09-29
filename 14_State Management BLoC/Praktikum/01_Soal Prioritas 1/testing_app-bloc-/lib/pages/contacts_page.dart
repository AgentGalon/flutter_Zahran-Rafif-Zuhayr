import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:testing_app/bloc/contact_bloc.dart';
import 'package:testing_app/class/contact.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  DateTime? selectedDate;
  Color pickerColor = Colors.black;
  String? selectedFilePath;

  int selectedIndex = -1;
  bool isNameValid = true;
  bool isContactValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Contacts'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                if (ModalRoute.of(context)?.settings.name != '/') {
                  Navigator.pushNamed(context, '/');
                }
              },
              child: const ListTile(
                title: Text("Home"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                if (ModalRoute.of(context)?.settings.name != '/contacts') {
                  Navigator.pushNamed(context, '/contacts');
                }
              },
              child: const ListTile(
                title: Text("Contacts"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                if (ModalRoute.of(context)?.settings.name != '/gallery') {
                  Navigator.pushNamed(context, '/gallery');
                }
              },
              child: const ListTile(
                title: Text("Gallery"),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Center(
                child: Icon(Icons.contacts),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    'Create New Contacts',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Lorem ipsum dolor sit amet, sed do magna aliqua. Ut enim ad minim veniam, quis nostrud ex ea commodo consequat. Duis aute in repreh null pariatur.',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            _buildNameTextField(),
            const SizedBox(height: 10),
            _buildContactTextField(),
            const SizedBox(height: 10),
            _buildButtonsRow(),
            const SizedBox(height: 10),
            const Text(
              'List Contacts',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: BlocBuilder<ContactBloc, ContactState>(
                builder: (context, state) {
                  if (state is ContactsLoaded) {
                    return _buildContactList(state.contacts);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNameTextField() {
    return TextField(
      controller: nameController,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        hintText: 'Contact Name',
        labelText: 'Contact Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: isNameValid ? Colors.grey : Colors.red,
          ),
        ),
        errorText: isNameValid ? null : 'Name invalid',
        prefixIcon: const Icon(Icons.person),
      ),
    );
  }

  Widget _buildContactTextField() {
    return TextField(
      controller: contactController,
      keyboardType: TextInputType.number,
      maxLength: 15,
      decoration: InputDecoration(
        hintText: 'Contact Number',
        labelText: 'Contact Number',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        errorText: isContactValid ? null : 'Number invalid',
        prefixIcon: const Icon(Icons.phone),
      ),
    );
  }

  Widget _buildButtonsRow() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: _pickDate,
              child: Text(
                selectedDate == null
                    ? 'Pick date'
                    : DateFormat('dd MMM yyyy').format(selectedDate!),
              ),
            ),
            ElevatedButton(
              onPressed: _pickColor,
              style: ElevatedButton.styleFrom(
                backgroundColor: pickerColor,
              ),
              child: const Text('Pick color'),
            ),
            ElevatedButton(
              onPressed: _pickFile,
              child: const Text('Pick file'),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                validateInput();
                if (isNameValid && isContactValid) {
                  setState(() {
                    selectedDate = null;
                    pickerColor = Colors.black;
                  });
                  final contactBloc = BlocProvider.of<ContactBloc>(context);
                  if (selectedIndex == -1) {
                    contactBloc.add(AddContactEvent(
                      name: nameController.text,
                      contact: contactController.text,
                      date: selectedDate,
                      color: pickerColor,
                      filePath: selectedFilePath,
                    ));
                  } else {
                    contactBloc.add(EditContactEvent(
                      index: selectedIndex,
                      name: nameController.text,
                      contact: contactController.text,
                      date: selectedDate,
                      color: pickerColor,
                      filePath: selectedFilePath,
                    ));
                    selectedIndex = -1;
                  }

                  // Tambahkan kode untuk kembali ke halaman utama
                  Navigator.pop(context, 'Data added');

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Add to list contact'),
                    ),
                  );
                }
              },
              child: Text(selectedIndex == -1 ? 'Submit' : 'Update'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContactList(List<Contact> contacts) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return _buildContactCard(context, index, contacts[index]);
      },
    );
  }

  Widget _buildContactCard(BuildContext context, int index, Contact contact) {
    Color contactColor = contact.color;

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: contactColor,
          foregroundColor: Colors.white,
          child: Text(
            contact.name[0],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contact.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(contact.contact),
            Text(contact.date != null
                ? DateFormat.yMMMd().format(contact.date!)
                : 'No date selected'),
            Row(
              children: [
                const Text('Color: '),
                Container(
                  color: contactColor,
                  height: 15,
                  width: 15,
                ),
              ],
            ),
            Text('File: ${contact.filePath ?? 'Not selected'}'),
          ],
        ),
        trailing: SizedBox(
          width: 50,
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  nameController.text = contact.name;
                  contactController.text = contact.contact;
                  setState(() {
                    selectedIndex = index;
                    selectedDate = contact.date;
                    pickerColor = contact.color;
                    selectedFilePath = contact.filePath;
                  });
                },
                child: const Icon(Icons.edit),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    final contactBloc = BlocProvider.of<ContactBloc>(context);
                    contactBloc.add(DeleteContactEvent(index: index));
                  });
                },
                child: const Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickDate() {
    showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2101),
    ).then(
      (date) {
        if (date != null) {
          setState(() {
            selectedDate = date;
          });
        }
      },
    );
  }

  void _pickColor() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: pickerColor,
              onColorChanged: (Color color) {
                setState(() {
                  pickerColor = color;
                });
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      String? path = result.files.single.path;
      if (path != null) {
        String fileName = path.split('/').last;

        setState(() {
          selectedFilePath = fileName;
        });
      }
    }
  }

  void validateInput() {
    final String name = nameController.text.trim();
    final String contact = contactController.text.trim();

    setState(() {
      isNameValid = validateName(name);
      isContactValid = validatePhoneNumber(contact);
    });
  }

  bool validateName(String name) {
    if (name.isEmpty) return false;
    const namePattern = r"^[A-Z][a-zA-Z]+(?: [A-Z][a-zA-Z]+)*$";
    final regExp = RegExp(namePattern);
    return regExp.hasMatch(name);
  }

  bool validatePhoneNumber(String phone) {
    if (phone.isEmpty) return false;
    const phonePattern = r"^(0[0-9]{7,14})$";
    final regExp = RegExp(phonePattern);
    return regExp.hasMatch(phone);
  }
}
