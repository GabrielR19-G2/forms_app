part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final Username username;
  final Email email;
  final Password password;

  const RegisterFormState({
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
    this.username = const Username.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
  });

  RegisterFormState copyWith({
    FormStatus? formStatus,
    Username? username,
    Email? email,
    Password? password,
    bool? isValid,
  }) => RegisterFormState(
    formStatus: formStatus ?? this.formStatus,
    username: username ?? this.username,
    email: email ?? this.email,
    password: password ?? this.password,
    isValid: isValid ?? this.isValid,
  );

  // Para saber si es el mismo estado, si es el mismo no hace nada
  @override
  List<Object> get props => [formStatus, isValid, username, email, password];
}
