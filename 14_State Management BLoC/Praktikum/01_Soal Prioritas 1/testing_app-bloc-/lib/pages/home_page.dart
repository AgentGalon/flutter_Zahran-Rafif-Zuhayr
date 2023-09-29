import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_app/bloc/contact_bloc.dart';
import 'package:testing_app/class/contact.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
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
      body: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          if (state is ContactsLoaded) {
            return _buildContactList(state.contacts);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildContactList(List<Contact> contacts) {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 25,
            child: Text(
              contact.name[0],
              style: const TextStyle(fontSize: 24),
            ),
          ),
          title: Text(
            contact.name,
            style: const TextStyle(fontSize: 18),
          ),
          subtitle: Text(
            contact.contact,
            style: const TextStyle(fontSize: 16),
          ),
          onTap: () {},
        );
      },
      itemCount: contacts.length,
      separatorBuilder: (context, index) {
        return const Divider(
          thickness: 1,
          color: Colors.grey,
        );
      },
    );
  }
}
