import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_states.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/custom_form_field.dart';

class AddModalBottomSheet extends StatelessWidget {
  const AddModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocConsumer<AddNoteCubit, NoteState>(
          listener: (context, state) {
            if (state is Notefaliurestate) {
              // ignore: avoid_print
              print('error ,try again ${state.errmessage}');
            }
            if (state is Noteloadedstate) {
              BlocProvider.of<NotesCubit>(context).fetchallnotes();

              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
            
                  content:  Text('The task was added success'),
                ),
              );
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is Noteloadingstate ? true : false,
              child: Padding(
                padding: EdgeInsets.only(
                    right: 16.0,
                    left: 16,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const SingleChildScrollView(
                  child: Customformfield(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
