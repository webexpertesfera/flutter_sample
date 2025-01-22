import 'package:flutter_sample/constants/export.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? textController;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool? enableInteractiveSelection;
  final int? maxLength;
  final TextInputType? inputType;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatter;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final Widget? prefix;
  final String? prefixImagePath;
  final Color? fillColor;
  final Widget? suffix;
  final String? suffixImagePath;
  final TextCapitalization? textCapitalization;
  final bool? readOnly;
  final bool? isObscure;
  final int? minLines;
  final int? maxLines;
  final double? borderRadius;
  final Color? borderColor;


  CustomTextField(
      {super.key,
      this.textController,
      this.focusNode,
      this.textInputAction,
      this.borderRadius,
      this.maxLength,
      this.inputType,
      this.validator,
      this.inputFormatter,
      this.onTap,
      this.onFieldSubmitted,
      this.textCapitalization,
      this.enableInteractiveSelection,
      this.onChanged,
      this.prefix,
      this.hintText,
      this.prefixImagePath,
      this.suffix,
      this.suffixImagePath,
      this.readOnly,
      this.isObscure,
      this.fillColor,
      this.minLines,
      this.maxLines, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: enableInteractiveSelection ?? true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      readOnly: readOnly ?? false,
      controller: textController,
      focusNode: focusNode,textCapitalization:textCapitalization??TextCapitalization.none ,
      validator: validator ?? (value) {},
      onChanged: onChanged ?? (value) {},
      minLines: minLines,
      maxLines: maxLines ?? 1,
      onTap: onTap ?? () {},
      maxLength: maxLength,
      obscureText: isObscure ?? false,
      textInputAction: textInputAction ?? TextInputAction.next,
      keyboardType: inputType,
      inputFormatters: inputFormatter ?? [],
      style: TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: "Montserrat",
          fontSize: font_14,
          color: Colors.white),
      decoration: InputDecoration(


          fillColor: fillColor ??
              (AppColors.textFieldColor.withOpacity(0.38)),
          errorStyle: Theme.of(context)
              .inputDecorationTheme
              .errorStyle
              ?.copyWith(color: Colors.red),
          errorMaxLines: 4,
          hintText: hintText ?? "",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius??radius_50),
              borderSide: BorderSide(color: borderColor??Colors.transparent, width: width_0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius??radius_50),
              borderSide: BorderSide(color: borderColor??Colors.transparent, width: width_0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius??radius_50),
              borderSide: BorderSide(color: borderColor??Colors.transparent, width: width_0)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius??radius_50),
              borderSide: BorderSide(color: borderColor??Colors.transparent, width: width_0)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius??radius_50),
              borderSide: BorderSide(color: borderColor??Colors.transparent, width: width_0)),

          prefixIcon: prefix ??
              (prefixImagePath != null
                  ? AssetImageWidget(
                      imagePath: prefixImagePath,
                      height: height_20,
                      fit: BoxFit.contain,color: AppColors.lightGreyColor,
                      width: height_20,
                    ).marginOnly(left: margin_25,right: margin_15)
                  : const SizedBox(
                      height: 0,
                      width: 0,
                    )),
          suffixIcon: suffix ??
              (suffixImagePath != null
                  ? AssetImageWidget(
                      imagePath: suffixImagePath,
                      height: height_10,
                      fit: BoxFit.contain,
                      width: height_10,
                    ).directionalMarginSymmetric(horizontal: margin_15)
                  : const SizedBox(
                      height: 0,
                      width: 0,
                    )),
          prefixIconConstraints: BoxConstraints(minHeight: height_20, minWidth: height_20),
          suffixIconConstraints: BoxConstraints(minHeight: height_15, minWidth: height_15),
          counterText: ""),
    );
  }
}
