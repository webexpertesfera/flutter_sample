import 'dart:io';

import 'package:flutter_sample/constants/export.dart';

class FileImageWidget extends StatelessWidget {
  final double? radius;
  final double? height;
  final double? width;
  final File? file;
  final BoxFit? fit;
  final Color? color;

  FileImageWidget({this.radius,@required this.file, this.fit, this.height, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0),
        child: Image.file(
          file!,
          height: height,
          width: width,
          color: color,
          fit: fit ?? BoxFit.cover,
        ));
  }
}
