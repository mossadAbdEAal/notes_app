import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_states.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/constaints.dart';

class AddNoteCubit extends Cubit<NoteState> {
  AddNoteCubit() : super(Initialstate());
  Color color= const Color(0xffDEA54B);
  addNote(NoteModel note) async {
    note.color=color.value;
    emit(Noteloadingstate());
    try {
      var noteBox = Hive.box<NoteModel>(knoteboxname);
      await noteBox.add(note);
      emit(Noteloadedstate());
    } catch (e) {
      emit(Notefaliurestate(e.toString()));
    }
  }
}
