import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incostore/ui/widgets/button_icon_custom.dart';
import 'package:incostore/ui/widgets/textfield_custom.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
        ),
        backgroundColor: const Color.fromARGB(255, 242, 221, 156),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInRight(
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      'Bienvenido a incostore,',
                      style: GoogleFonts.poppins(
                        fontSize: MediaQuery.of(context).size.width * 0.130,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  FadeInRight(
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      'regístrate para continuar.',
                      style: GoogleFonts.poppins(
                        color: Colors.black.withOpacity(0.7),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FadeInLeft(
              duration: const Duration(milliseconds: 500),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Container(
                        height: 1.7,
                        width: MediaQuery.of(context).size.width * 0.3,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Registrato de usuario",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Container(
                        height: 1.7,
                        width: 50,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.010),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FadeInLeft(
                delay: const Duration(milliseconds: 400),
                duration: const Duration(milliseconds: 500),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '¿Ya tienes una cuenta?',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Inicia sesión',
                            style: GoogleFonts.poppins(
                              color: Colors.indigo,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomTextField(
                      containerColor: const Color.fromARGB(255, 230, 238, 250),
                      controller: emailController,
                      hintText: 'Nombre',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      containerColor: const Color.fromARGB(255, 230, 238, 250),
                      controller: passwordController,
                      hintText: 'Apellido',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      containerColor: const Color.fromARGB(255, 230, 238, 250),
                      controller: emailController,
                      hintText: 'Correo electrónico',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      containerColor: const Color.fromARGB(255, 230, 238, 250),
                      controller: passwordController,
                      obscureText: true,
                      hintText: 'Contraseña',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 40),
                    CustomButtonIcon(
                      colorContainerIcon:
                          const Color.fromARGB(255, 251, 160, 81),
                      width: MediaQuery.of(context).size.width * 0.65,
                      text: "Registrarse",
                      icon: Icons.login,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
