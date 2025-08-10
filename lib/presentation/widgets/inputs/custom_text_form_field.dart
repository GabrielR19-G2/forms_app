import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final IconData? prefixIcon;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.validator,
    this.obscureText,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      // borderSide: BorderSide(color: colors.primary),
    );
    return TextFormField(
      obscureText: obscureText ?? false, // En caso de ser contraseña
      onChanged: onChanged,
      validator: validator,

      // obscuringCharacter: ,
      // (value) {
      //   if (value == null) return 'Campo es requerido';
      //   if (value.isEmpty || false) return 'Campo es requerido';
      //   if (value.trim().isEmpty || false) return 'Campo es requerido';
      //   return null;
      // },
      decoration: InputDecoration(
        enabled: true,
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: colors.primary),
        ),
        isDense: true,

        label: label != null ? Text(label!) : null,
        hintText: hint,
        focusColor: colors.primary,
        prefixIcon: prefixIcon != null
            // ? Icon(Icons.supervised_user_circle_outlined, color: colors.primary)
            ? Icon(prefixIcon, color: colors.primary)
            : null,
        // suffixIcon: Icon(Icons.supervised_user_circle),
        errorText: errorMessage,
        errorBorder: border.copyWith(
          borderSide: BorderSide(color: Colors.red.shade800),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: Colors.red.shade800),
        ),
      ),
    );
  }
}
