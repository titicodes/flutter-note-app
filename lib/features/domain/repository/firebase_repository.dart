import 'package:my_notes_flutter/domain/entities/note_entity.dart';
import 'package:my_notes_flutter/domain/entities/user_entity.dart';

abstract class FirebaseRepository {
  Future<bool> isSignIn();
  Future<void> SignIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<void> SignOut();
  Future<String> getCurrentUId();
  Future<void> getCreateCurrentUser(UserEntity user);
  Future<void> addNote(NoteEntity note);
  Future<void> updateNote(NoteEntity note);
  Future<void> deleteNote(NoteEntity note);
  Stream<List<NoteEntity>> getNotes(String uid);
}
