import 'package:flutter/material.dart';

class DetailContainer extends StatelessWidget {
  const DetailContainer({
    super.key,
    required this.title,
    required this.details,
  });

  final String title;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24), // White background color
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.3), // Light green shadow color
            spreadRadius: 5, // Controls the spread of the shadow
            blurRadius: 10, // Controls the blur effect of the shadow
            offset: Offset(0, 3), // Controls the position of the shadow
          ),
        ],
      ),
      child: Column(children: [
        const SizedBox(
          height: 10,
        ),
      
        Text(
         title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
             decoration: TextDecoration.underline, // Add underline
              decorationColor: Colors.black26, // Color of the underline
              decorationThickness: 2,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          details,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
          ),
        ),
      ]),
    );
  }
}