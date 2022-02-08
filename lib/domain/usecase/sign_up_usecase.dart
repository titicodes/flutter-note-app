import 'package:my_notes_flutter/domain/entities/user_entity.dart';
import 'package:my_notes_flutter/features/domain/repository/firebase_repository.dart';

class SignUpUseCase {
  final FirebaseRepository repository;

  SignUpUseCase({required this.repository});

  Future<void> action(UserEntity user) async {
    return repository.signUp(user);
  }
}
