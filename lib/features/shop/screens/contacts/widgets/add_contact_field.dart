import 'package:flutter/material.dart';

class AddContactField extends StatelessWidget {
  const AddContactField(
      {super.key, required this.fieldName, required this.icon});

  final String fieldName;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldName,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: const Color.fromARGB(255, 128, 131, 163),
            ),
          ),
          Container(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(100, 128, 131, 163),
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(100, 128, 131, 163),
                  ),
                ),
                suffixIcon: Icon(
                  icon,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}
