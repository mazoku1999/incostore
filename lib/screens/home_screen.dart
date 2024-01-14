import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incostore/ui/carusel_productos.dart';

import '../../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  static const _padding = 24.0;
  static const _spacing = 24.0;

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget appBar() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: HomeScreen._padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            FontAwesomeIcons.barsStaggered,
            color: kSecondaryColor,
            size: 24,
          ),
          Icon(
            FontAwesomeIcons.bell,
            color: kSecondaryColor,
            size: 24,
          ),
        ],
      ),
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: HomeScreen._padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'INCOSTORE',
            style: TextStyle(
              color: kSecondaryColor,
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Productos nuevos cada dia!',
            style: TextStyle(
              color: kSecondaryColor.withOpacity(0.6),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: HomeScreen._padding),
      child: Container(
        height: 46,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: kSecondaryColor.withOpacity(0.2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Busca un producto',
              style: TextStyle(
                color: kSecondaryColor.withOpacity(0.6),
              ),
            ),
            Icon(
              FontAwesomeIcons.magnifyingGlass,
              color: kSecondaryColor.withOpacity(0.6),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget categories() {
    final categoryList = ['Celular', 'Camisa', 'Pantalon', 'Chompas'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: HomeScreen._padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const Text(
                'Todo',
                style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 2),
              Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kSecondaryColor,
                ),
              ),
            ],
          ),
          for (final category in categoryList)
            Text(
              category,
              style: TextStyle(
                color: kSecondaryColor.withOpacity(0.6),
                fontSize: 16,
              ),
            ),
        ],
      ),
    );
  }

  int contador = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Mostrar un mensaje de snack bar para indicar al usuario que presione nuevamente para salir
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:
              Text('Presiona atrás nuevamente para salir de la aplicación'),
        ));
        contador++;
        if (contador == 2) {
          Navigator.pop(context);
        }
        return false; // No salgas de la aplicación todavía
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            // controller: _scrollController,
            child: Column(
              children: [
                appBar(),
                const SizedBox(height: 24),
                header(),
                const SizedBox(height: 24),
                searchBar(),
                const SizedBox(height: 36),
                categories(),
                const SizedBox(height: 16),
                const CaruselProductos(
                  padding: HomeScreen._padding,
                  spacing: HomeScreen._spacing,
                ),
                const SizedBox(height: 36),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: HomeScreen._padding),
                  child: Text(
                    "Todos los productos:",
                    style: GoogleFonts.poppins(
                      color: Colors.black.withOpacity(0.9),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const GridB(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GridB extends StatefulWidget {
  const GridB({Key? key}) : super(key: key);

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  final dio = Dio();
  List data = []; // Almacena los datos obtenidos

  @override
  void initState() {
    super.initState();
    getHttp(); // Llama a getHttp al inicializar el estado
  }

  Future<void> getHttp() async {
    final response =
        await dio.get('http://192.168.100.10:3000/productos?apiKey=clave1');
    setState(() {
      data = response.data;
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 37,
      crossAxisSpacing: 17,
      padding: const EdgeInsets.all(10),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return InkWell(
          // color al hover
          onTap: () {
            Navigator.pushNamed(
              context,
              '/details',
              arguments: data[index],
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 1.2),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(66, 121, 115, 115),
                  blurRadius: 18,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                //imagenes con hero animations
                Hero(
                  tag: data[index]['id'],
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: CachedNetworkImage(
                      imageUrl: data[index]['imagen'],
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(), // Widget de carga mientras se descarga la imagen
                      errorWidget: (context, url, error) => const Icon(
                          Icons.error), // Widget para mostrar en caso de error
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data[index]['titulo'],
                    style: GoogleFonts.poppins(
                      color: Colors.black.withOpacity(0.9),
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data[index]['descripcion'],
                    style: GoogleFonts.poppins(
                      color: Colors.black.withOpacity(0.9),
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Bs. ${data[index]['precio']}',
                    style: GoogleFonts.poppins(
                      color: Colors.black.withOpacity(0.9),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
