import 'package:flutter/material.dart';

class IconRoundedButton extends StatelessWidget {
  const IconRoundedButton({
    super.key,
    this.backgroundColor = Colors.white,
    required this.icon,
    this.iconColor = Colors.black,
    required this.onPressed,
    this.padding = const EdgeInsets.all(7),
  });

  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding: padding,
          child: Icon(
            icon,
            color: iconColor, // Icon color
          ),
        ),
      ),
    );
  }
}
