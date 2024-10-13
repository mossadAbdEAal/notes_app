import 'package:flutter/material.dart';
import 'package:notes_app/widgets/constaints.dart';

// ignore: must_be_immutable
class CustomTextFeild extends StatelessWidget {
  CustomTextFeild({super.key, this.maxlines = 1, required this.hintText,this.onsaved,this.onChanged});
  int maxlines;
  String hintText;
  void Function(String?)? onsaved;
  void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onsaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'This field is required';
        } else {
          return null;
        }
      },
      maxLines: maxlines,
      cursorColor: kprimarycolor,
      decoration: InputDecoration(
        hintText: hintText,
        border: buildborder(kprimarycolor),
        enabledBorder: buildborder(kprimarycolor),
        disabledBorder: buildborder(kprimarycolor),
      ),
    );
  }

  OutlineInputBorder buildborder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: color));
  }
}
