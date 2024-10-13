import 'package:flutter/material.dart';
import 'package:notes_app/widgets/constaints.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key, this.ontap, this.isloading = false});
  final void Function()? ontap;
  final bool isloading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: kprimarycolor),
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Center(
              child: isloading
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ))
                  : const Text(
                      'Add',
                      style: TextStyle(color: Colors.black),
                    ))),
    );
  }
}
