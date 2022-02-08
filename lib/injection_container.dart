import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:my_notes_flutter/domain/usecase/delete_note_usecase.dart';
import 'package:my_notes_flutter/domain/usecase/get_create_current_user_usecase.dart';
import 'package:my_notes_flutter/domain/usecase/get_current_uid_usecase.dart';
import 'package:my_notes_flutter/domain/usecase/get_notes_usecase.dart';
import 'package:my_notes_flutter/domain/usecase/is_sign_in_usecase.dart';
import 'package:my_notes_flutter/domain/usecase/sign_in_usecase.dart';
import 'package:my_notes_flutter/domain/usecase/sign_out_usecase.dart';
import 'package:my_notes_flutter/domain/usecase/sign_up_usecase.dart';
import 'package:my_notes_flutter/domain/usecase/update_note_usecase.dart';
import 'package:my_notes_flutter/features/data/remote/data_sources/firebase_remote_datasource.dart';
import 'package:my_notes_flutter/features/data/remote/data_sources/firebase_remote_datasource_impl.dart';
import 'package:my_notes_flutter/features/data/repository/firebase_remote_repository_impl.dart';
import 'package:my_notes_flutter/features/presentation/bloc/auth/auth_cubit.dart';
import 'package:my_notes_flutter/features/presentation/bloc/note/note_cubit.dart';
import 'package:my_notes_flutter/features/presentation/bloc/user/user_cubit.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
// cubit/Bloc

  getIt.registerFactory<AuthCubit>(() => AuthCubit(
      currentUIdUseCase: getIt.call(),
      isSignInUsecase: getIt.call(),
      signOutUseCase: getIt.call()));

  getIt.registerFactory(() => UserCubit(
      signInUseCase: getIt.call(),
      signUpUseCase: getIt.call(),
      getCreateCurrentUserUseCase: getIt.call()));
  getIt.registerFactory(() => NoteCubit(
      addNoteUseCase: getIt.call(),
      updateNoteUseCase: getIt.call(),
      deleteNoteUseCase: getIt.call(),
      gettNotesUseCase: getIt.call()));
// UseCases

  getIt.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(repository: getIt.call()));
  getIt.registerLazySingleton<IsSignInUsecase>(
      () => IsSignInUsecase(repository: getIt.call()));
  getIt.registerLazySingleton<GetCreateCurrentUserUseCase>(
      () => GetCreateCurrentUserUseCase(repository: getIt.call()));
  getIt.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(repository: getIt.call()));
  getIt.registerLazySingleton<DeleteNoteUseCase>(
      () => DeleteNoteUseCase(repository: getIt.call()));
  getIt.registerLazySingleton<UpdateNoteUseCase>(
      () => UpdateNoteUseCase(repository: getIt.call()));
  getIt.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(repository: getIt.call()));
  getIt.registerLazySingleton<GetCurrentUIdUseCase>(
      () => GetCurrentUIdUseCase(repository: getIt.call()));
  getIt.registerLazySingleton<GettNotesUseCase>(
      () => GettNotesUseCase(repository: getIt.call()));
  getIt.registerLazySingleton<GetCreateCurrentUserUseCase>(
      () => GetCreateCurrentUserUseCase(repository: getIt.call()));

// Repositories
  getIt.registerLazySingleton(
      () => FirebaseRemoteRepositoryImpl(remoteDataSource: getIt.call()));

// datasourse
  getIt.registerLazySingleton<FirebaseRemoteDataSource>(() =>
      FirebaseRemoteDataSourceImpl(
          auth: getIt.call(), firestore: getIt.call()));

  // External
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  getIt.registerLazySingleton(() => auth);
  getIt.registerLazySingleton(() => firestore);
}

