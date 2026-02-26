import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vehicle_repair_service/Widget/TranslateText.dart';

class CustomInputText extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final double? padding;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? radius;
  final List<TextInputFormatter> inputFormatter;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final int? maxLines;
  final bool? obscureText;
  final Function(String)? onChanged;
  final bool? readOnly;
  final Color? primaryColor;
  const CustomInputText({super.key,this.controller,  this.maxLength, required this.inputFormatter, this.focusNode, this.textInputType, this.validator, this.maxLines, this.obscureText=false, this.onChanged, this.readOnly=false, this.padding, this.hintText, this.prefixIcon, this.suffixIcon, this.radius, this.primaryColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.black),
      decoration:InputDecoration(


        border: OutlineInputBorder(
          borderRadius: .circular(10),
          borderSide: BorderSide.none
        ),
        contentPadding: .all(padding??12.0),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hint: TranslateText('$hintText',style:TextStyle(color: Colors.black)),

        fillColor: primaryColor??Colors.grey.shade300,
        filled: true,
        counterText: '',
        disabledBorder: OutlineInputBorder(
            borderRadius: .circular(10),
            borderSide: BorderSide.none
        ),
        enabledBorder:OutlineInputBorder(
            borderRadius: .circular(10),
            borderSide: BorderSide.none
        ),
        floatingLabelAlignment: .center,
        floatingLabelBehavior: .auto
      ),
      maxLength: maxLength,
      keyboardType: textInputType,
      validator: validator,

      obscureText: obscureText??false,
      focusNode: focusNode,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.disabled,
      inputFormatters: inputFormatter,
      readOnly: readOnly??false,
    );
  }
}
