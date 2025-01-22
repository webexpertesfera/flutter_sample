import 'package:flutter_sample/constants/export.dart';
import 'package:lottie/lottie.dart';

class CustomLoader {
  static CustomLoader? _loader;

  CustomLoader._createObject();

  factory CustomLoader() {
    if (_loader != null) {
      return _loader!;
    } else {
      _loader = CustomLoader._createObject();
      return _loader!;
    }
  }

  OverlayState? _overlayState;
  OverlayEntry? _overlayEntry;

  _buildLoader() {
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              child: buildLoader(),
              color: Colors.black.withOpacity(.3),
            )
          ],
        );
      },
    );
  }

  show(context) {
    _overlayState = Overlay.of(context);
    _buildLoader();
    _overlayState!.insert(_overlayEntry!);
  }

  hide() {
    try {
      if (_overlayEntry != null) {
        _overlayEntry!.remove();
        _overlayEntry = null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  buildLoader({isTransparent = false}) {
    return WillPopScope(
      onWillPop: () {
        customLoader.hide();
        return Future.value(true);
      },
      child: Center(
        child: Container(
          color: isTransparent ? Colors.transparent : Colors.transparent,
          child: Center(
              child: Lottie.asset(AppAssets.imagesIcLoadingJson,height: height_150,width: height_150))
        ),
      ),
    );
  }
}
