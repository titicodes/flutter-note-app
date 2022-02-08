import 'package:my_notes_flutter/domain/entities/note_entity.dart';
import 'package:my_notes_flutter/domain/entities/user_entity.dart';
import 'package:my_notes_flutter/features/domain/repository/firebase_repository.dart';

class GetCreateCurrentUserUseCase {
  final FirebaseRepository repository;
  GetCreateCurrentUserUseCase({required this.repository});

  Future<void> action(UserEntity user) async {
    return repository.getCreateCurrentUser(user);
  }
}
