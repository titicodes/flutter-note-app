import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_flutter/domain/entities/user_entity.dart';
import 'package:my_notes_flutter/domain/usecase/get_create_current_user_usecase.dart';
import 'package:my_notes_flutter/domain/usecase/sign_in_usecase.dart';
import 'package:my_notes_flutter/domain/usecase/sign_up_usecase.dart';
import 'package:my_notes_flutter/features/presentation/bloc/user/user_state.dart';

class UserCubit extends Cubit<UserState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUPUseCase;
  final GetCreateCurrentUserUseCase getCreateCurrentUserUseCase;
  UserCubit({required this.signUPUseCase,required this.signInUseCase,required this.getCreateCurrentUserUseCase, Object? signUpUseCase}) : super(UserInitial());

  Future<void> submitSignIn({required UserEntity user})async{
    emit(UserLoading());
    try {
      await signInUseCase.action(user);
      emit(UserSuccess());
    }on SocketException catch(_){
      emit(UserFailure());
    } catch(_){
      emit(UserFailure());
    }
  }
  Future<void> submitSignUp({required UserEntity user})async{
    emit(UserLoading());
    try {
      await signUPUseCase.action(user);
      await getCreateCurrentUserUseCase.action(user);
      emit(UserSuccess());
    }on SocketException catch(_){
      emit(UserFailure());
    } catch(_){
      emit(UserFailure());
    }

  }
}
