import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incostore/ui/widgets/textfield_custom.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //beige agregar este color beige
      backgroundColor: Color.fromARGB(255, 156, 226, 242),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bienvenido,',
                    style: GoogleFonts.poppins(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'inicia sesión para continuar.',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CustomTextField(
                    hintText: 'Correo electrónico',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    hintText: 'Contraseña',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Iniciar sesión'),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('¿No tienes una cuenta?'),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Regístrate'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
