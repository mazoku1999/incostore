import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:incostore/ui/carusel_productos.dart';

import '../../utils/constants.dart';

class Ga extends StatelessWidget {
  static const _padding = 24.0;
  static const _spacing = 24.0;

  Ga({Key? key}) : super(key: key);

  Widget appBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _padding, vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
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
      padding: const EdgeInsets.symmetric(horizontal: _padding),
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
            'El futuro es hoy viejo!',
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
      padding: const EdgeInsets.symmetric(horizontal: _padding),
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
      padding: const EdgeInsets.symmetric(horizontal: _padding),
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

  List<Map<String, dynamic>> jsonData = [
    {'id': 1, 'nombre': 'Elemento 1'},
    {'id': 2, 'nombre': 'Elemento 2'},
    {'id': 3, 'nombre': 'Elemento 3'},
    {'id': 4, 'nombre': 'Elemento 4'},
    {'id': 5, 'nombre': 'Elemento 5'},
    {'id': 6, 'nombre': 'Elemento 6'},
    {'id': 1, 'nombre': 'Elemento 1'},
    {'id': 2, 'nombre': 'Elemento 2'},
    {'id': 3, 'nombre': 'Elemento 3'},
    {'id': 4, 'nombre': 'Elemento 4'},
    {'id': 5, 'nombre': 'Elemento 5'},
    {'id': 6, 'nombre': 'Elemento 6'},
    {'id': 1, 'nombre': 'Elemento 1'},
    {'id': 2, 'nombre': 'Elemento 2'},
    {'id': 3, 'nombre': 'Elemento 3'},
    {'id': 4, 'nombre': 'Elemento 4'},
    {'id': 5, 'nombre': 'Elemento 5'},
    {'id': 6, 'nombre': 'Elemento 6'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 36),
                appBar(),
                const SizedBox(height: 24),
                header(),
                const SizedBox(height: 24),
                searchBar(),
                const SizedBox(height: 36),
                categories(),
                const SizedBox(height: 16),
                const CaruselProductos(
                  padding: _padding,
                  spacing: _spacing,
                ),
                const SizedBox(height: 36),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index < jsonData.length) {
                  return ListTile(
                    title: Text(
                        'ID: ${jsonData[index]['id']} - Nombre: ${jsonData[index]['nombre']}'),
                  );
                }
              },
              childCount: jsonData.length,
            ),
          ),
        ],
      ),
    );
  }
}
