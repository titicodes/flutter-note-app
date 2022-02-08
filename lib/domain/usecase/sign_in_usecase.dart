import 'package:my_notes_flutter/domain/entities/user_entity.dart';
import 'package:my_notes_flutter/features/domain/repository/firebase_repository.dart';

class SignInUseCase {
  final FirebaseRepository repository;
  SignInUseCase({required this.repository});

  Future<void> action(UserEntity user) async {
    return repository.SignIn(user);
  }
}
