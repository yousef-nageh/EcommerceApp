import 'package:flutter/material.dart';

class MyTextForm extends StatelessWidget {
  const MyTextForm(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.prefixIcon,
      this.suffixIcon,
       this.hidePassword=false,
      this.onChanged,
      this.validator,
      this.controller, required this.keyboardType, this.suffixIconOnPressed,this.enabled,this.readOnly=false});

  final String hintText;
  final String labelText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool hidePassword;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final VoidCallback ? suffixIconOnPressed;
  final bool? enabled;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      enabled: enabled,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      keyboardType:keyboardType ,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      obscureText: hidePassword,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: IconButton(onPressed: suffixIconOnPressed, icon:  Icon(suffixIcon))
      ),
    );
  }
}
