import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
  final Size preferredSize; // Override the preferredSize
  final VoidCallback? onTap;
  final VoidCallback? drawer;

   CustomAppbar({Key? key,this.onTap,this.drawer})
      : preferredSize = const Size.fromHeight(60.0), // Specify AppBar height
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("News Stack",
        style: TextStyle(
            color: Colors.white
        ),),
      centerTitle: true,
      backgroundColor: Colors.black,
      iconTheme: const IconThemeData(
          color: Colors.white
      ),
      leading:IconButton(onPressed: drawer,
          icon: const Icon(Icons.menu)),
      actions: [
        IconButton(onPressed: onTap,
            icon: const Icon(Icons.search_outlined)),
      ],
    );
  }
}
