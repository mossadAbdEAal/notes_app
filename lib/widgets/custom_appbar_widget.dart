import 'package:flutter/material.dart';


class CustomAppbarWidget extends StatelessWidget {
  const   CustomAppbarWidget({super.key,required this.title,required this.icon,this.onpressed});
  final String title;
  final IconData icon;
  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35,right: 15,left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 30),
          ),
          IconButton(
              onPressed: onpressed,
              icon: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.white.withOpacity(.1)),
                  child:  Icon(
                    icon,
                    color: Colors.white,
                    size: 30,
                  ))),
        ],
      ),
    );
  }
}
