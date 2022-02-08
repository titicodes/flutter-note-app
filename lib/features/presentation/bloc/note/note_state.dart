import 'package:equatable/equatable.dart';
import 'package:my_notes_flutter/domain/entities/note_entity.dart';

class NoteState extends Equatable {
  const NoteState();
  @override

  // TODO: implement props
  List<Object?> get props => [];
}

class NoteInitial extends NoteState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NoteLoading extends NoteState {
  @override
 
  List<Object?> get props => [];
}

class NoteFailure extends NoteState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NoteLoaded extends NoteState {
  final List<NoteEntity> notes;
  NoteLoaded({required this.notes});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
