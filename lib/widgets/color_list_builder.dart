import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/widgets/color_item.dart';

class ColorListBuilder extends StatefulWidget {
  const ColorListBuilder({super.key});

  @override
  State<ColorListBuilder> createState() => _ColorListBuilderState();
}

class _ColorListBuilderState extends State<ColorListBuilder> {
  int currentindex = 0;
  List<Color> colors = const [
    Color(0xffDEA54B),
    Color(0xffD9DBF1),
    Color(0xffDBF4A7),
    Color(0xff5398BE),
    Color(0xffD741A7),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: GestureDetector(
                  onTap: () {
                    currentindex = index;
                    BlocProvider.of<AddNoteCubit>(context).color=colors[index];
                    setState(() {});
                  },
                  child: ColorItem(
                    isActive: currentindex == index,
                    color: colors[index],
                  )),
            );
          }),
    );
  }
}
