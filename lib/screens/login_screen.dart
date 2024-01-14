import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incostore/controllers/login_controller.dart';
import 'package:incostore/ui/widgets/button_icon_custom.dart';
import 'package:incostore/ui/widgets/textfield_custom.dart';

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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
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
                    FadeInLeft(
                      duration: const Duration(milliseconds: 500),
                      child: Text(
                        'Bienvenido a incostore,',
                        style: GoogleFonts.poppins(
                          fontSize: MediaQuery.of(context).size.width * 0.130,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    FadeInLeft(
                      duration: const Duration(milliseconds: 500),
                      child: Text(
                        'inicia sesión para continuar.',
                        style: GoogleFonts.poppins(
                          color: Colors.black.withOpacity(0.6),
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
                        padding: const EdgeInsets.only(
                            left: 20, top: 30, bottom: 10),
                        child: Container(
                          height: 1.7,
                          width: MediaQuery.of(context).size.width * 0.3,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 30, bottom: 10),
                      child: Text(
                        "Inicio de sesión",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 20, top: 30, bottom: 10),
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.050),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FadeInLeft(
                  delay: const Duration(milliseconds: 400),
                  duration: const Duration(milliseconds: 500),
                  child: Column(
                    children: [
                      FadeInRight(
                        duration: const Duration(milliseconds: 600),
                        child: CustomTextField(
                          containerColor:
                              const Color.fromARGB(255, 230, 238, 250),
                          controller: emailController,
                          hintText: 'Correo electrónico',
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(height: 30),
                      FadeInRight(
                        duration: const Duration(milliseconds: 700),
                        child: CustomTextField(
                          containerColor:
                              const Color.fromARGB(255, 230, 238, 250),
                          controller: passwordController,
                          obscureText: true,
                          hintText: 'Contraseña',
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 20),
                      FadeInRight(
                        duration: const Duration(milliseconds: 800),
                        child: CustomButtonIcon(
                          width: MediaQuery.of(context).size.width * 0.65,
                          text: "Ingresar",
                          icon: Icons.login,
                          onPressed: () async {
                            LoginController loginController = LoginController(
                                email: emailController.text,
                                password: passwordController.text);
                            await loginController.login().then((value) => {
                                  if (value.success)
                                    {
                                      print(
                                          'Imprimiendo el valor: ${value.data}'),
                                      Navigator.pushNamed(context, '/home')
                                    }
                                  else
                                    {
                                      print(
                                          'Imprimiendo el valor else: ${value.data}'),
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          titleTextStyle: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.09,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          title: const Text('Error'),
                                          content: Text(
                                            value.data['message'],
                                            style: GoogleFonts.poppins(
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'Aceptar',
                                                style: GoogleFonts.poppins(
                                                  color: Colors.indigo,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    }
                                });
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      FadeInRight(
                        duration: const Duration(milliseconds: 900),
                        child: Row(
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
