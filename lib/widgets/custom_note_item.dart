import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class CustomNoteItem extends StatelessWidget {
   const CustomNoteItem({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)
          {
            return   EditNoteView(noteModel: note,);
          }));
        },
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration:  BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Color(note.color)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title:  Text(
                    note.title,
                    style: const TextStyle(color: Colors.black,fontSize: 30),
                  ),
                  subtitle:  Padding(
                    padding: const EdgeInsets.only(top: 15.0,right: 15,bottom: 15),
                    child: Text(
                    note.subtitle,
                      style: TextStyle(color: Colors.black.withOpacity(.4),fontSize: 18),
                    ),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        note.delete();
                        BlocProvider.of<NotesCubit>(context).fetchallnotes();
                      },
                      icon: const Icon(Icons.delete, color: Colors.black,size: 40,)),
                ),
                 Padding(
                   padding: const EdgeInsets.only(right: 30.0),
                   child: Text(
                   note.date,
                    style: TextStyle(color: Colors.black.withOpacity(.4),fontSize: 15),
                                 ),
                 )
              ],
            )),
      ),
    );
  }
}
