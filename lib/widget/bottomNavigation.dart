import 'package:flutter/material.dart';

class BottomNavi extends StatelessWidget {
  const BottomNavi({Key? key,required this.onTap,}) : super(key: key);

  final void Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'settings',
        ),
      ],
    );
  }
}