import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_flutter/domain/entities/note_entity.dart';
import 'package:my_notes_flutter/domain/usecase/add_note_usecase.dart';
import 'package:my_notes_flutter/domain/usecase/delete_note_usecase.dart';
import 'package:my_notes_flutter/domain/usecase/get_notes_usecase.dart';
import 'package:my_notes_flutter/domain/usecase/update_note_usecase.dart';

import 'note_state.dart';

 class NoteCubit extends Cubit<NoteState> {
  final AddNoteUseCase addNoteUseCase;
  final UpdateNoteUseCase updateNoteUseCase;
  final DeleteNoteUseCase deleteNoteUseCase;
  final GettNotesUseCase gettNotesUseCase;
  NoteCubit(
      {required this.addNoteUseCase,
      required this.updateNoteUseCase,
      required this.deleteNoteUseCase,
      required this.gettNotesUseCase})
      : super(NoteInitial());

  Future<void> addNote({required NoteEntity note}) async {
    try {
      await addNoteUseCase.action(note);
    } on SocketException catch (_) {
      emit(NoteFailure());
    } catch (_) {
      emit(NoteFailure());
    }
  }

  Future<void> updateNote({required NoteEntity note}) async {
    try {
      await updateNoteUseCase.action(note);
    } on SocketException catch (_) {
       emit(NoteFailure());
    } catch (_) {
       emit(NoteFailure());
    }
  }

  Future<void> deleteNote({required NoteEntity note}) async {
    try {
      await deleteNoteUseCase.action(note);
    } on SocketException catch (_) {
       emit(NoteFailure());
    } catch (_) {
       emit(NoteFailure());
    }
  }

  Future<void> getNote({required String uid}) async {
    emit(NoteLoading());
    try {
      gettNotesUseCase.action(uid).listen((notes) {
        emit(NoteLoaded(notes: notes));
      });
    } on SocketException catch (_) {
      emit(NoteFailure());
    } catch (_) {
      emit(NoteFailure());
    }
  }
}
