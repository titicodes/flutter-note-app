import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_flutter/domain/usecase/get_create_current_user_usecase.dart';
import 'package:my_notes_flutter/domain/usecase/get_current_uid_usecase.dart';
import 'package:my_notes_flutter/domain/usecase/is_sign_in_usecase.dart';
import 'package:my_notes_flutter/domain/usecase/sign_out_usecase.dart';
import 'package:my_notes_flutter/features/domain/repository/firebase_repository.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final GetCurrentUIdUseCase currentUIdUseCase;
  final IsSignInUsecase isSignInUsecase;
  final SignOutUseCase signOutUseCase;
  AuthCubit(
      {required this.currentUIdUseCase,
      required this.isSignInUsecase,
      required this.signOutUseCase})
      : super(AuthInitial());

  Future<void> appStarted() async {
    try {
      final isSignIn = await isSignInUsecase.action();

      if (isSignIn) {
        final uid = await currentUIdUseCase.action();
        emit(AuthenticationState(uid: uid));
      } else {
        emit(UnAuthenticationState());
      }
    } on SocketException catch (_) {
      emit(UnAuthenticationState());
    }
  }

  Future<void> loggedIn() async {
    try {
      final uid = await currentUIdUseCase.action();
      emit(AuthenticationState(uid: uid));
    } on SocketException catch (_) {
      emit(UnAuthenticationState());
    }
  }

  Future<void> loggedOut() async {
    try {
      final uid = await currentUIdUseCase.action();
      emit(UnAuthenticationState());
    } on SocketException catch (_) {
      emit(UnAuthenticationState());
    }
  }
}
