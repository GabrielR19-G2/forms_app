import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordError { empty, lenght }

// Extend FormzInput and provide the input type and error type.
class Password extends FormzInput<String, PasswordError> {
  // Call super.pure to represent an unmodified form input. Valor inicial
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input. Forma en como quiero que cambie el valor. Cuando el campo sea alterado por el usuario
  const Password.dirty(super.value) : super.dirty();
  // const Username.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == PasswordError.empty) return 'El campo es requerido';
    if (displayError == PasswordError.lenght) return 'Mínimo 6 caracteres';

    return null;
  }

  // Override validator to handle validating a given input value. Si es nulo, pasa todas las validaciones
  @override
  PasswordError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordError.empty;
    if (value.length < 6) return PasswordError.lenght;
    return null;
  }
}
