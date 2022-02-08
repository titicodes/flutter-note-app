import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_notes_flutter/domain/entities/note_entity.dart';

class NoteModel extends NoteEntity {
  NoteModel({
    final String? noteId,
    final String? note,
    final Timestamp? timestamp,
    final String? uid,
  }) : super(note: note, noteId: noteId, timestamp: timestamp, uid: uid);

  factory NoteModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return NoteModel(
        note: documentSnapshot.get('note'),
        noteId: documentSnapshot.get('noteId'),
        uid: documentSnapshot.get('uid'),
        timestamp: documentSnapshot.get('timestamp'));
  }

  Map<String, dynamic> toDocument() {
    return {'note': note, 'noteId': noteId, 'uid': uid, 'timpStamp': timestamp};
  }

  
}
