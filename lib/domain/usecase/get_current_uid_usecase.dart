import 'package:my_notes_flutter/domain/entities/user_entity.dart';
import 'package:my_notes_flutter/features/domain/repository/firebase_repository.dart';

class GetCurrentUIdUseCase {
  final FirebaseRepository repository;
  GetCurrentUIdUseCase({required this.repository});

  Future<String> action() async{
    return repository.getCurrentUId();
  }
}
