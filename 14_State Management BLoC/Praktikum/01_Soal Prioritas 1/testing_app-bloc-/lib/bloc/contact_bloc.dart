import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:testing_app/class/contact.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial());

  final List<Contact> _contacts = [];

  Stream<ContactState> mapEventToState(ContactEvent event) async* {
    if (event is LoadContactsEvent) {
      yield ContactsLoaded(_contacts);
    } else if (event is AddContactEvent) {
      _contacts.add(
        Contact(
          name: event.name,
          contact: event.contact,
          date: event.date,
          color: event.color,
          filePath: event.filePath,
        ),
      );
      yield ContactsLoaded(_contacts);
    } else if (event is EditContactEvent) {
      if (event.index >= 0 && event.index < _contacts.length) {
        _contacts[event.index] = Contact(
          name: event.name,
          contact: event.contact,
          date: event.date,
          color: event.color,
          filePath: event.filePath,
        );
      }
      yield ContactsLoaded(_contacts);
    } else if (event is DeleteContactEvent) {
      if (event.index >= 0 && event.index < _contacts.length) {
        _contacts.removeAt(event.index);
      }
      yield ContactsLoaded(_contacts);
    } else if (event is SetDateEvent) {
      // Logika untuk mengatur tanggal
      yield ContactsLoaded(_contacts);
    } else if (event is SetColorEvent) {
      // Logika untuk mengatur warna
      yield ContactsLoaded(_contacts);
    } else if (event is SetFilePathEvent) {
      // Logika untuk mengatur path file
      yield ContactsLoaded(_contacts);
    } else if (event is SetNameValidEvent) {
      // Logika untuk mengatur validitas nama
      yield ContactsLoaded(_contacts);
    } else if (event is SetContactValidEvent) {
      // Logika untuk mengatur validitas kontak
      yield ContactsLoaded(_contacts);
    }
  }
}
