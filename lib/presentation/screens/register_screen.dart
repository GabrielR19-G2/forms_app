import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nuevo usuario")),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    // Se asegura de mostrar el widget considerando el notch y botones inferiores
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              FlutterLogo(size: 100),
              _RegisterForm(),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  // Permite enlazar el key con el form
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final email = registerCubit.state.email;
    final password = registerCubit.state.password;
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de usuario',
            onChanged: registerCubit.usernameChanged,
            errorMessage: username.errorMessage,
            // (value) {
            //   registerCubit.usernameChanged(value);
            // },
            // validator: (value) {
            //   if (value == null || value.isEmpty) return 'Campo requerido';
            //   if (value.trim().isEmpty) return 'Campo requerido';
            //   if (value.length < 6) return 'Más de 6 letras';
            //   return null;
            // },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Correo electrónico',
            onChanged: registerCubit.emailChanged,
            errorMessage: email.errorMessage,
            // onChanged: (value) {
            //   registerCubit.emailChanged(value);
            // },
            // validator: (value) {
            //   if (value == null || value.isEmpty) return 'Campo requerido';
            //   if (value.trim().isEmpty) return 'Campo requerido';

            //   final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
            //   //Si no es correo electronico
            //   if (!emailRegExp.hasMatch(value)) {
            //     return 'No tiene formato de correo';
            //   }
            //   return null;
            // },
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            label: 'Contraseña',
            errorMessage: password.errorMessage,
            obscureText: true,
            prefixIcon: Icons.password_outlined,
          ),
          const SizedBox(height: 20),

          FilledButton.tonalIcon(
            onPressed: () {
              // final isValid = _formKey.currentState!.validate();
              // if (!isValid) return;
              // debugPrint('Username: $st, email: $email, pass: $password');
              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save),
            label: Text('Crear usuario'),
          ),
        ],
      ),
    );
  }
}

// widget Scroll ejemplo:
// listview, sliver, customChildScrollView
