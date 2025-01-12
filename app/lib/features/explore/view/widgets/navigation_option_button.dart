import 'package:flutter/material.dart';

class NavigationOptionButton extends StatelessWidget {
  const NavigationOptionButton({super.key, required this.onTap, required this.text});

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF252525),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onTap,
        child: Text(text,style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),),
      ),
    );
  }
}
