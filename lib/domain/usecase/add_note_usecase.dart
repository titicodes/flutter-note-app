import 'package:my_notes_flutter/domain/entities/note_entity.dart';
import 'package:my_notes_flutter/features/domain/repository/firebase_repository.dart';

class AddNoteUseCase {
  final FirebaseRepository repository;
  AddNoteUseCase(this.repository);

  Future<void> action(NoteEntity addnote) async {
    return repository.addNote(addnote);
  }
}
