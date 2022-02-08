import 'package:my_notes_flutter/features/domain/repository/firebase_repository.dart';

class IsSignInUsecase {
  final FirebaseRepository repository;
  IsSignInUsecase({required this.repository});

  Future<bool> action() async {
    return repository.isSignIn();
  }
}
