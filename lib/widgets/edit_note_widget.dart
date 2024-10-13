import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_appbar_widget.dart';
import 'package:notes_app/widgets/custom_edit_list_builder.dart';
import 'package:notes_app/widgets/custom_text_feild.dart';

class EditNoteWidget extends StatefulWidget {
  const EditNoteWidget({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditNoteWidget> createState() => _EditNoteWidgetState();
}

class _EditNoteWidgetState extends State<EditNoteWidget> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomAppbarWidget(
            onpressed: () {
              widget.noteModel.title = title ?? widget.noteModel.title;
              widget.noteModel.subtitle = content ?? widget.noteModel.subtitle;
              widget.noteModel.save();
              BlocProvider.of<NotesCubit>(context).fetchallnotes();
             ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('The task was edited success'),
                ),
              ); 
              Navigator.pop(context);
              
            },
            title: 'Edit Note',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFeild(
              onChanged: (value) {
                title = value;
              },
              hintText: widget.noteModel.title),
          const SizedBox(
            height: 15,
          ),
          CustomTextFeild(
            onChanged: (value) {
              content = value;
            },
            hintText: widget.noteModel.subtitle,
            maxlines: 5,
          ),
          CustomEditListBuilder(
            noteModel: widget.noteModel,
          ),
        ],
      ),
    );
  }
}
