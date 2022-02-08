import 'package:my_notes_flutter/domain/entities/note_entity.dart';
import 'package:my_notes_flutter/features/domain/repository/firebase_repository.dart';

class DeleteNoteUseCase {
  final FirebaseRepository repository;

  DeleteNoteUseCase({required this.repository});

  Future<void> action(NoteEntity deleteNote) async {
    return repository.deleteNote(deleteNote);
  }
}
