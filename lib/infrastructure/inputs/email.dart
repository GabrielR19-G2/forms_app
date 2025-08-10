import 'package:formz/formz.dart';

// Define input validation errors
enum EmailError { empty, format }

// Extend FormzInput and provide the input type and error type.
class Email extends FormzInput<String, EmailError> {
  /// Expresion regular con la que se va a evaluar el correo
  static final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  // Call super.pure to represent an unmodified form input. Valor inicial
  const Email.pure() : super.pure('');

  // Call super.dirty to represent a modified form input. Forma en como quiero que cambie el valor. Cuando el campo sea alterado por el usuario
  const Email.dirty(super.value) : super.dirty();
  // const Username.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == EmailError.empty) return 'El campo es requerido';
    if (displayError == EmailError.format)
      return 'No tiene formato de correo electrónico';

    return null;
  }

  // Override validator to handle validating a given input value. Si es nulo, pasa todas las validaciones
  @override
  EmailError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return EmailError.empty;

    if (!emailRegExp.hasMatch(value)) return EmailError.format;

    return null;
  }
}
