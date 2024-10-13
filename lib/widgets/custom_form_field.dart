import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_states.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/color_list_builder.dart';
import 'package:notes_app/widgets/custom_bottom.dart';
import 'package:notes_app/widgets/custom_text_feild.dart';

class Customformfield extends StatefulWidget {
  const Customformfield({super.key});

  @override
  State<Customformfield> createState() => _CustomformfieldState();
}

class _CustomformfieldState extends State<Customformfield> {
  String? title, subtitle;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          CustomTextFeild(
              onsaved: (value) {
                title = value;
              },
              hintText: 'Title'),
          const SizedBox(
            height: 15,
          ),
          CustomTextFeild(
            onsaved: (value) {
              subtitle = value;
            },
            hintText: 'Content',
            maxlines: 5,
          ),
          const SizedBox(
            height: 35,
          ),
          const ColorListBuilder(),
          const SizedBox(
            height: 35,
          ),
          BlocBuilder<AddNoteCubit,NoteState>(
            builder: (context, state) {
              return CustomBottom(
                isloading: state is Noteloadingstate ? true : false,
                ontap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    var currentdate=DateTime.now();
                    var formatteddate=DateFormat().add_yMd().format(currentdate);
                    NoteModel note = NoteModel(
                        title: title!,
                        subtitle: subtitle!,
                        date:formatteddate,
                        color: Colors.blue.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(note);
                  } else {
                    
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              );
            },
          ),
          const SizedBox(
          
            height: 15,
          ),
        ],
      ),
    );
  }
}
