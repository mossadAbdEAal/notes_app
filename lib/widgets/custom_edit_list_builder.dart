import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/color_item.dart';
import 'package:notes_app/widgets/constaints.dart';

class CustomEditListBuilder extends StatefulWidget {
  const CustomEditListBuilder({super.key,required this.noteModel});
  final NoteModel noteModel;

  @override
  State<CustomEditListBuilder> createState() => _ColorListBuilderState();
}

class _ColorListBuilderState extends State<CustomEditListBuilder> {
  late int currentindex;
  @override
  void initState() {
     currentindex= kcolors.indexOf(Color(widget.noteModel.color));
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kcolors.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: GestureDetector(
                  onTap: () {
                    currentindex = index;
                    widget.noteModel.color=kcolors[index].value;
                    setState(() {});
                  },
                  child: ColorItem(
                    isActive: currentindex == index,
                    color: kcolors[index],
                  )),
            );
          }),
    );
  }
}
