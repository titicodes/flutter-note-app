import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_notes_flutter/domain/entities/user_entity.dart';
import 'package:my_notes_flutter/domain/entities/note_entity.dart';
import 'package:my_notes_flutter/features/data/remote/data_sources/firebase_remote_datasource.dart';
import 'package:my_notes_flutter/features/data/remote/model/note_model.dart';
import 'package:my_notes_flutter/features/data/remote/model/user_model.dart';
import 'package:my_notes_flutter/features/domain/repository/firebase_repository.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  FirebaseRemoteDataSourceImpl({required this.auth, required this.firestore});
  @override
  Future<void> SignIn(UserEntity user) async => auth.signInWithEmailAndPassword(
      email: user.email!, password: user.password!);

  @override
  Future<void> SignOut() async => auth.signOut();

  @override
  Future<void> addNote(NoteEntity noteEntity) async {
    final noteCollectionRef =
        firestore.collection('user').doc(noteEntity.uid).collection('notes');

    final noteId = noteCollectionRef.doc().id;
    noteCollectionRef.doc(noteId).get().then((note) {
      final newNote = NoteModel(
              uid: noteEntity.uid,
              note: noteEntity.note,
              noteId: noteId,
              timestamp: noteEntity.timestamp)
          .toDocument();
      if (!note.exists) {
        noteCollectionRef.doc(noteId).set(newNote);
      }

      return;
    });
  }

  @override
  Future<void> deleteNote(NoteEntity noteEntity) async {
    final noteCollectionRef =
        firestore.collection('user').doc(noteEntity.uid).collection('notes');

    noteCollectionRef.doc(noteEntity.noteId).get().then((note) {
      if (note.exists) {
        noteCollectionRef.doc(noteEntity.noteId).delete();
      }
      return;
    });
  }

  @override
  Future<void> getCreateCurrentUser(UserEntity userEntity) async {
    final usercollectionRef = firestore.collection('user');
    final uid = await getCurrentUId();
    usercollectionRef.doc(userEntity.uid).get().then((user) async {
      final newUser = UserModel(
        uid: uid,
        email: userEntity.email,
        name: userEntity.name,
        status: userEntity.status,
      ).toDocument();

      if (user.exists) {
        usercollectionRef.doc(uid).set(newUser);
      }
    });

    return;
  }

  @override
  Future<String> getCurrentUId() async => auth.currentUser!.uid;

  @override
  Stream<List<NoteEntity>> getNotes(String uid) {
    final noteCollectionRef =
        firestore.collection('user').doc(uid).collection('notes');

    return noteCollectionRef.snapshots().map((querySnapshot) {
      return querySnapshot.docs
          .map((docSnap) => NoteModel.fromSnapshot(docSnap))
          .toList();
    });
  }

  @override
  Future<bool> isSignIn() async => auth.currentUser?.uid != null;

  @override
  Future<void> signUp(UserEntity user) async =>
      auth.createUserWithEmailAndPassword(
          email: user.email!, password: user.password!);

  @override
  Future<void> updateNote(NoteEntity noteEntity) async {
    Map<String, dynamic> noteMap = Map();
    final noteCollectionRef =
        firestore.collection('user').doc(noteEntity.uid).collection('notes');

    if (noteEntity.note! == null) noteMap['notes'] = noteEntity.note;
    if (noteEntity.timestamp! == null) noteMap['time'] = noteEntity.timestamp;

    noteCollectionRef.doc(noteEntity.noteId).update(noteMap);
  }
}
