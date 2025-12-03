import 'package:flutter/material.dart';

class MealMetaDtaItem extends StatelessWidget {
  const MealMetaDtaItem({super.key, required this.text, required this.icon});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: Colors.white,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
