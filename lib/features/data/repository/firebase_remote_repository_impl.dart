import 'package:my_notes_flutter/domain/entities/user_entity.dart';
import 'package:my_notes_flutter/domain/entities/note_entity.dart';
import 'package:my_notes_flutter/features/data/remote/data_sources/firebase_remote_datasource.dart';
import 'package:my_notes_flutter/features/domain/repository/firebase_repository.dart';

class FirebaseRemoteRepositoryImpl extends FirebaseRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  FirebaseRemoteRepositoryImpl({required this.remoteDataSource});
  @override
  Future<void> SignIn(UserEntity user) async => remoteDataSource.SignIn(user);

  @override
  Future<void> SignOut() async => remoteDataSource.SignOut();

  @override
  Future<void> addNote(NoteEntity note) async => remoteDataSource.addNote(note);

  @override
  Future<void> deleteNote(NoteEntity note) {
    throw UnimplementedError();
  }

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async =>
      remoteDataSource.getCreateCurrentUser(user);
  @override
  Future<String> getCurrentUId() async => remoteDataSource.getCurrentUId();

  @override
  Stream<List<NoteEntity>> getNotes(String uid) =>
      remoteDataSource.getNotes(uid);

  @override
  Future<bool> isSignIn() async => remoteDataSource.isSignIn();

  @override
  Future<void> signUp(UserEntity user) async => remoteDataSource.signUp(user);

  @override
  Future<void> updateNote(NoteEntity note) async =>
      remoteDataSource.updateNote(note);
}
