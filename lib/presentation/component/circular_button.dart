import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  IconData icon;
  VoidCallback onTap;
  Button({Key? key, required this.icon, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: 70,
          height: 70,
          decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          child: Icon(icon)),
    );
  }
}
