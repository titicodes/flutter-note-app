import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? email;
  final String? name;
  final String? password;
  final String? uid;
  final String? status;

  UserEntity(Map<String?, String?> map, {this.email,
   this.name, 
   this.password, 
   this.uid, 
   this.status = 'Hello i am using this app' ,}
   );

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        password,
        email,
        uid,
        status,
      ];
}
