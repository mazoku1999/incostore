import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incostore/ui/widgets/button_icon_custom.dart';
import 'package:incostore/ui/widgets/textfield_custom.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
        ),
        backgroundColor: const Color.fromARGB(255, 156, 226, 242),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bienvenido a incostore,',
                    style: GoogleFonts.poppins(
                      fontSize: MediaQuery.of(context).size.width * 0.130,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'inicia sesión para continuar.',
                    style: GoogleFonts.poppins(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Correo electrónico',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    controller: passwordController,
                    obscureText: true,
                    hintText: 'Contraseña',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  CustomButtonIcon(
                    width: MediaQuery.of(context).size.width * 0.65,
                    text: "Ingresar",
                    icon: Icons.login,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '¿No tienes una cuenta?',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Regístrate',
                          style: GoogleFonts.poppins(
                            color: Colors.indigo,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
