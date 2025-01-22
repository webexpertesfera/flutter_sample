import 'package:flutter_sample/constants/export.dart';
import 'package:shimmer/shimmer.dart';

class NetworkImageWidget extends StatelessWidget {
  final double? radius;
  final double? height;
  final double? width;
  final String? imageUrl;
  final String? errorImagePath;
  final BoxFit? fit;
  final Color? color;
  final IconData? errorIcon;

  NetworkImageWidget(
      {this.radius,
      @required this.imageUrl,
      this.fit,
      this.height,
      this.width,
      this.color,
      this.errorIcon,
      this.errorImagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0),
        child: Image.network(
          imageUrl ?? "",
          height: height,
          width: width,
          color: color,
          fit: fit ?? BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {

            if(loadingProgress==null){
              return child;
            }
            return Shimmer.fromColors(
                baseColor: Colors.grey.shade400,
                highlightColor: Colors.grey.shade200,
                child: Container(
                width: width,
                height: height,
                color: Colors.white,
            ));
          },
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
        ));
  }
}
