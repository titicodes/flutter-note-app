import 'dart:html';

import 'package:my_notes_flutter/domain/entities/note_entity.dart';
import 'package:my_notes_flutter/features/domain/repository/firebase_repository.dart';

class UpdateNoteUseCase {
  final FirebaseRepository repository;
  UpdateNoteUseCase({required this.repository});

  Future<void> action(NoteEntity updateNote) async {
    return repository.updateNote(updateNote);
  }
}
