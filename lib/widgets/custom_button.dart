import 'package:flutter_sample/constants/export.dart';
import 'package:flutter_sample/theme/text_styles.dart';


class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? title;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final double? width;
  final double? fontSize;
  final double? horizontalPadding;
  final double? verticalPadding;

  const CustomButton({super.key, required this.onTap, this.title, this.color, this.textColor, this.width, this.horizontalPadding, this.borderColor, this.fontSize, this.verticalPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: MaterialButton(onPressed:onTap?? () {
      },color: color??Colors.white,padding: EdgeInsets.symmetric(vertical:verticalPadding?? margin_10,horizontal: horizontalPadding??margin_40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius_50),side: BorderSide(color: borderColor??Colors.transparent,width: width_2)),
        elevation: 0,

        child: Text(title??"",textAlign:TextAlign.center,style: TextStyles.poppins20w600()?.copyWith(color: textColor??AppColors.primaryColor,fontSize: fontSize),),),
    );
  }
}
