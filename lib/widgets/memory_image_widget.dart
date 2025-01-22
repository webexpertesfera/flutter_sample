import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_sample/constants/export.dart';
import 'package:shimmer/shimmer.dart';

class MemoryImageWidget extends StatelessWidget {
  final double? radius;
  final double? height;
  final double? width;
  final dynamic imagePath;
  final BoxFit? fit;
  final Color? color;
  bool showPlayButton = true;
  final String? errorImagePath;
  final IconData? errorIcon;

  MemoryImageWidget(
      {this.radius,
      @required this.imagePath,
      this.fit,
      this.height,
      this.width,
      this.color,
      this.errorImagePath,
      this.errorIcon,
      this.showPlayButton = true});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0),
        child: imagePath == null || imagePath is String
            ? errorImagePath != null
                ? AssetImageWidget(
                    imagePath: errorImagePath,
                    height: height,
                    width: width,
                    fit: fit,
                    radius: radius,
                  )
                : Shimmer.fromColors(
                    baseColor: Colors.grey.shade400,
                    highlightColor: Colors.grey.shade200,
                    child: Container(
                      height: height,
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(radius ?? 0),
                      ),
                      child: Icon(
                        errorIcon ?? Icons.image,
                        color: Colors.grey,
                      ),
                    ),
                  )
            : Stack(
                alignment: Alignment.center,
                children: [
                  Image.memory(
                    imagePath,
                    height: height,
                    width: width,
                    color: color,
                    fit: fit ?? BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return errorImagePath != null
                          ? AssetImageWidget(
                              imagePath: errorImagePath,
                              height: height,
                              width: width,
                              fit: fit,
                              radius: radius,
                            )
                          : Container(
                              height: height,
                              width: width,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(radius ?? 0),
                              ),
                              child: Icon(
                                errorIcon ?? Icons.image,
                                color: Colors.grey,
                              ),
                            );
                    },
                  ),
                  showPlayButton == true
                      ? Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: height_40,
                          shadows: [BoxShadow(color: Colors.black, blurRadius: 100, spreadRadius: 5)],
                        )
                      : Container()
                ],
              ));
  }
}
