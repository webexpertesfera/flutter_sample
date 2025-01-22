import 'package:flutter_sample/constants/export.dart';

class AssetImageWidget extends StatelessWidget {
  final double? radius;
  final double? height;
  final double? width;
  final String? imagePath;
  final BoxFit? fit;
  final Color? color;

  AssetImageWidget({this.radius,@required this.imagePath, this.fit, this.height, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0),
        child: Image.asset(
          imagePath ?? "",
          height: height,
          width: width,
          color: color,
          fit: fit ?? BoxFit.cover,
        ));
  }
}
