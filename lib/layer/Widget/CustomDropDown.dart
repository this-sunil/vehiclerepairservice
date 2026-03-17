import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final Widget? labelText;
  final List<DropdownMenuItem<String>>? items;
  final Function(String?)? onChanged;
  final FormFieldValidator? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final double? radius;
  const CustomDropDown({super.key, this.items, this.onChanged,  this.validator, this.prefixIcon, this.suffixIcon, this.hintText, this.labelText, this.radius});


  @override
  Widget build(BuildContext context) {
    if(items==null){
      return SizedBox();
    }
    return DropdownButtonFormField(
        validator: validator,
        autovalidateMode: AutovalidateMode.disabled,
        borderRadius: .circular(10),
        decoration: InputDecoration(
          hintText: '$hintText',
          label: labelText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: .circular(radius??10)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: .circular(radius??10)
          ),
        ),
        items: items, onChanged: onChanged);
  }
}
