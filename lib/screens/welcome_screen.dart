import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incostore/ui/widgets/button_custom.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.indigo[50],
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.start, // Cambiado de "center" a "start"
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 77, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Productos nuevos',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                      ),
                      // Quitar altura o espacio en cada salto de linea
                      softWrap: false,
                      // Quitar el desbordamiento de texto
                      overflow: TextOverflow.fade,
                    ),
                    Text(
                      'TODOS LOS DIAS.',
                      style: GoogleFonts.montserrat(
                        letterSpacing: -3,
                        color: const Color.fromARGB(255, 0, 67, 224),
                        height: 1.0,
                        wordSpacing: -6,
                        fontWeight: FontWeight.w900,
                        fontSize: MediaQuery.of(context).size.width * 0.17,
                      ),
                    ),
                  ],
                ),
              ),
              Lottie.asset('assets/carrito.json',
                  height: MediaQuery.of(context).size.height * 0.450,
                  width: double.infinity),
              Row(
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
                      "Registrate o inicia sesion",
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
              Center(
                child: CustomButton(
                  text: 'Iniciar sesion',
                  backgroundColor: Colors.blue[300]!,
                  borderColor: Colors.black,
                  shadowColor: Colors.black,
                  splashColor: const Color.fromARGB(255, 161, 112, 241),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: CustomButton(
                  text: 'Registrarse',
                  backgroundColor: Colors.yellow[400]!,
                  borderColor: Colors.black,
                  shadowColor: Colors.black,
                  splashColor: const Color.fromARGB(255, 255, 157, 72),
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
