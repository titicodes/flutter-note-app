import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [ ];
}

class AuthenticationState extends AuthState {
  final String uid;

  AuthenticationState({required this.uid});
  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => [];
}

class UnAuthenticationState extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
