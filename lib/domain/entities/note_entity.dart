import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
class NoteEntity extends Equatable {
  final String? noteId;
  final String? note;
  final Timestamp? timestamp;
  final String? uid;

  NoteEntity({this.noteId, this.note, this.timestamp, this.uid});

  @override
  // TODO: implement props
  List<Object?> get props => [noteId, note, timestamp,uid];

  get time => null;
}
