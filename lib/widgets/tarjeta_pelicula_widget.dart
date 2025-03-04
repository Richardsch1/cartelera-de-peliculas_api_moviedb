import 'package:flutter/material.dart';
import '../models/pelicula_model.dart';
import '../core/api_constants.dart';

class TarjetaPeliculaWidget extends StatelessWidget {
  final Pelicula pelicula;

  const TarjetaPeliculaWidget({Key? key, required this.pelicula})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen del póster
          Image.network(
            '${ApiConstants.urlImagenes}${pelicula.posterPath}',
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          // Información de la película
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pelicula.titulo,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 20),
                    Text(
                      '${pelicula.calificacion}/10',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  'Estreno: ${pelicula.fechaEstreno}',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
