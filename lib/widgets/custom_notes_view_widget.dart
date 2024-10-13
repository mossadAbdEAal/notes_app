import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/custom_appbar_widget.dart';
import 'package:notes_app/widgets/custom_notes_list_view.dart';

class CustomNotesViewWidget extends StatefulWidget {
  const CustomNotesViewWidget({super.key});

  @override
  State<CustomNotesViewWidget> createState() => _CustomNotesViewWidgetState();
}

class _CustomNotesViewWidgetState extends State<CustomNotesViewWidget> {
  
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchallnotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: [
            CustomAppbarWidget(
              title: 'Notes',
              icon: Icons.search,
            ),
            Expanded(child: CustomNotesListView())
          ],
        ));
  }
}
