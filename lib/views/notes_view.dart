import 'package:flutter/material.dart';
import 'package:notes_app/widgets/add_modal_bottom_sheet.dart';
import 'package:notes_app/widgets/custom_notes_view_widget.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return const AddModalBottomSheet();
              });
        },
        child: const Icon(Icons.add),
      ),
      body: const CustomNotesViewWidget(),
    );
  }
}
