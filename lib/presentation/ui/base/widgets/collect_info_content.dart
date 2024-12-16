import 'package:flutter/material.dart';

class CollectInfoContent extends StatelessWidget {
  final String title;
  final String content;

  const CollectInfoContent(
      {super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Column(
        children: [
          Text(content,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16)),
          Text(
            title,
            style: const TextStyle(
                color: Color(0xFF4C4B4B),
                fontWeight: FontWeight.w700,
                fontSize: 14),
          )
        ],
      ),
    );
  }
}
