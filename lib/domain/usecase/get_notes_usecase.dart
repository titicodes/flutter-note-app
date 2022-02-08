import 'package:my_notes_flutter/domain/entities/note_entity.dart';
import 'package:my_notes_flutter/features/domain/repository/firebase_repository.dart';

class GettNotesUseCase {
  final FirebaseRepository repository;

  GettNotesUseCase({required this.repository});

  Stream<List<NoteEntity>> action(String uid) {
    return repository.getNotes(uid);
  }
}
