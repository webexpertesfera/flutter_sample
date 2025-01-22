import 'package:flutter_sample/constants/export.dart';

class GetInkwell extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  const GetInkwell({super.key, required this.child, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap??() {

    },
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
    child: child,);
  }
}
