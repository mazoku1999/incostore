import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:incostore/ui/card_productos.dart';

import '../models/products.dart';

class CaruselProductos extends StatefulWidget {
  final double padding;
  final double spacing;

  const CaruselProductos({
    Key? key,
    required this.padding,
    required this.spacing,
  }) : super(key: key);

  @override
  State<CaruselProductos> createState() => _CaruselProductosState();
}

class _CaruselProductosState extends State<CaruselProductos> {
  static const _imageWidth = 230.0;

  late final ScrollController _scrollController;
  late final double _indexFactor;

  double _imageOffset = 0.0;
  final dio = Dio();
  List data = []; // Almacena los datos obtenidos
  @override
  void initState() {
    final deviceWidth =
        (window.physicalSize.shortestSide / window.devicePixelRatio);
    _indexFactor = (widget.spacing + _imageWidth) / deviceWidth;
    _imageOffset = -widget.padding / deviceWidth;

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _imageOffset =
            ((_scrollController.offset - widget.padding) / deviceWidth);
      });
    });
    getHttp();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> getHttp() async {
    final response =
        await dio.get('http://192.168.100.10:3000/productos?apiKey=clave1');
    final jsonData = response.data;

    data = jsonData.map((item) {
      return Producto(
        image: item['imagen'],
        title: item['titulo'],
        price: item['precio'].toDouble(), // Mapea el campo de precio
      );
    }).toList();
    setState(() {
      data = data;
      // ordenar de mayor a menor
      data.sort((a, b) => b.price.compareTo(a.price));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: widget.padding),
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => SizedBox(width: widget.spacing),
        itemCount: data.length,
        itemBuilder: (_, index) => CardProducto(
          index: index,
          details: data[index],
          imageWidth: _imageWidth,
          imageOffset: _imageOffset,
          indexFactor: _indexFactor,
        ),
      ),
    );
  }
}
