part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object?> get props => [];
}

class LoadContactsEvent extends ContactEvent {}

class AddContactEvent extends ContactEvent {
  final String name;
  final String contact;
  final DateTime? date;
  final Color color;
  final String? filePath;

  const AddContactEvent({
    required this.name,
    required this.contact,
    this.date,
    required this.color,
    this.filePath,
  });

  @override
  List<Object?> get props => [name, contact, date, color, filePath];
}

class EditContactEvent extends ContactEvent {
  final int index;
  final String name;
  final String contact;
  final DateTime? date;
  final Color color;
  final String? filePath;

  const EditContactEvent({
    required this.index,
    required this.name,
    required this.contact,
    this.date,
    required this.color,
    this.filePath,
  });

  @override
  List<Object?> get props => [index, name, contact, date, color, filePath];
}

class DeleteContactEvent extends ContactEvent {
  final int index;

  const DeleteContactEvent({required this.index});

  @override
  List<Object?> get props => [index];
}

class SetDateEvent extends ContactEvent {
  final DateTime? date;

  const SetDateEvent(this.date);

  @override
  List<Object?> get props => [date];
}

class SetColorEvent extends ContactEvent {
  final Color color;

  const SetColorEvent(this.color);

  @override
  List<Object?> get props => [color];
}

class SetFilePathEvent extends ContactEvent {
  final String? filePath;

  const SetFilePathEvent(this.filePath);

  @override
  List<Object?> get props => [filePath];
}

class SetNameValidEvent extends ContactEvent {
  final bool isValid;

  const SetNameValidEvent(this.isValid);

  @override
  List<Object?> get props => [isValid];
}

class SetContactValidEvent extends ContactEvent {
  final bool isValid;

  const SetContactValidEvent(this.isValid);

  @override
  List<Object?> get props => [isValid];
}
