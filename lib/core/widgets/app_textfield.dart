import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:subscribtion_reminder/core/theme/app_colors.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;

  final String? outerTitle;
  final String? initialTitle;
  final String? hintText;
  final Color? hintColor;
  final double? hintFontSize;
  final Function(String value)? onChanged;
  final void Function(String value)? onFieldSubmitted;
  final void Function(String? value)? onSaved;
  final void Function()? onEditingComplete;
  final String? Function(String? value)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final EdgeInsetsGeometry? padding;
  final bool? isEnabled;
  final bool? readOnly;
  final bool? required;
  final int? maxLines;
  final int? maxLength;
  final Color? bgColor;
  final BorderRadius? borderRadius;
  final TextStyle? textStyle;
  final bool? centeredText;
  final bool? showBorder;
  final AutovalidateMode? autovalidateMode;
  final String? errorText;
  const AppTextField({
    super.key,
    required this.controller,
    this.outerTitle,
    this.initialTitle,
    this.hintText,
    this.hintColor,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
    this.onEditingComplete,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
    this.onTap,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText,
    this.padding,
    this.hintFontSize,
    this.isEnabled,
    this.readOnly,
    this.required,
    this.maxLines,
    this.maxLength,
    this.bgColor,
    this.borderRadius,
    this.textStyle,
    this.centeredText,
    this.showBorder,
    this.autovalidateMode,
    this.errorText,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.outerTitle != null
            ? RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.outerTitle ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    if (widget.required == true)
                      TextSpan(
                        text: ' * ',
                        style: TextStyle(color: Colors.redAccent),
                      ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
        widget.outerTitle != null
            ? const SizedBox(height: 5)
            : const SizedBox.shrink(),
        TextFormField(
          autovalidateMode:
              widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
          initialValue: widget.initialTitle,
          maxLines: widget.maxLines ?? 1,
          maxLength: widget.maxLength,
          controller: widget.controller,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
          onSaved: widget.onSaved,
          onEditingComplete: widget.onEditingComplete,
          enabled: widget.isEnabled ?? true,
          enableInteractiveSelection: true,
          cursorColor: AppColors.primary,
          validator: widget.validator,
          onTap: widget.onTap,
          readOnly: widget.readOnly ?? false,
          obscureText: widget.obscureText ?? false,
          obscuringCharacter: "*",
          keyboardType: widget.keyboardType,
          textAlign: widget.centeredText == true
              ? TextAlign.center
              : TextAlign.start,
          style: widget.textStyle,
          inputFormatters: widget.inputFormatters,
          decoration: InputDecoration(
            errorText: widget.errorText,
            errorMaxLines: 2,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            suffixIconColor: Colors.black,
            prefixIconColor: Colors.black,
            contentPadding: widget.padding ?? const EdgeInsets.all(15),
            isDense: true,
            filled: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: widget.hintFontSize ?? 15,
              color: widget.hintColor ?? Colors.grey,
            ),
            fillColor: widget.bgColor ?? Colors.white,
            disabledBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: Color.fromRGBO(217, 217, 217, 1).withValues(alpha: 0.3),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: widget.showBorder == false
                    ? Colors.transparent
                    : Color.fromRGBO(217, 217, 217, 1),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
              borderSide: const BorderSide(
                style: BorderStyle.solid,
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: AppColors.primary,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: Color.fromRGBO(217, 217, 217, 1),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: widget.readOnly == true
                    ? Color.fromRGBO(217, 217, 217, 1)
                    : AppColors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
