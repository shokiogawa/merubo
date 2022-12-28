import 'package:flutter/material.dart';

class ThumbnailCircle extends StatelessWidget {
  final String thumbnailPath;
  const ThumbnailCircle({Key? key, required this.thumbnailPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: CircleAvatar(
        backgroundImage: Image.network(thumbnailPath).image,
        radius: 12,
      ),
    );
  }
}
