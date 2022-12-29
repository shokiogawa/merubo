import 'package:flutter/material.dart';

class ThumbnailCircle extends StatelessWidget {
  final String? thumbnailPath;
  const ThumbnailCircle({Key? key, this.thumbnailPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: CircleAvatar(
        backgroundImage: thumbnailPath != null ? Image.network(thumbnailPath!).image : null,
        radius: 12,
        child: thumbnailPath != null ? null : const Icon(Icons.person, color: Colors.grey,),
      ),
    );
  }
}
