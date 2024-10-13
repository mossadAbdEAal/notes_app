import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/constaints.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
   List<NoteModel>? notes;
  fetchallnotes(){
       var noteBox = Hive.box<NoteModel>(knoteboxname);
       notes= noteBox.values.toList();
       emit(Notesloaded());
  }
}
