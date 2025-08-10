import 'package:formz/formz.dart';

// Define input validation errors
enum UsernameError { empty, lenght }

// Extend FormzInput and provide the input type and error type.
class Username extends FormzInput<String, UsernameError> {
  // Call super.pure to represent an unmodified form input. Valor inicial
  const Username.pure() : super.pure('');

  // Call super.dirty to represent a modified form input. Forma en como quiero que cambie el valor. Cuando el campo sea alterado por el usuario
  const Username.dirty(super.value) : super.dirty();
  // const Username.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == UsernameError.empty) return 'El campo es requerido';
    if (displayError == UsernameError.lenght) return 'Mínimo 6 caracteres';

    return null;
  }

  // Override validator to handle validating a given input value. Si es nulo, pasa todas las validaciones
  @override
  UsernameError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return UsernameError.empty;
    if (value.length < 6) return UsernameError.lenght;
    return null;
  }
}
