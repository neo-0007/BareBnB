import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon({
    super.key,
    required this.size,
    required this.icon,
    required this.name,
    required this.color,
    required this.iconSize,
    required this.onTap,
  });

  final Size size;
  final IconData icon;
  final String name;
  final Color color;
  final double iconSize;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black26),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: color,
                size: iconSize,
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(right: iconSize), // Offset for icon width
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}