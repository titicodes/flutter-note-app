import 'package:my_notes_flutter/domain/entities/user_entity.dart';
import 'package:my_notes_flutter/features/domain/repository/firebase_repository.dart';

class SignOutUseCase {
  final FirebaseRepository repository;
  SignOutUseCase({required this.repository});

  Future<void> action() async {
    return repository.SignOut();
  }
}
