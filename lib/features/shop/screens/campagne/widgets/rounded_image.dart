import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final String image;

  const RoundedImage({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
                image,
                width: 32,
                height: 32,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Image.asset('assets/images/dashboard/img1.png');
                },
              )
          ),
        ],
      ),
    );
  }
}

