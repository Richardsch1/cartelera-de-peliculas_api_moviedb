import 'package:http/http.dart' as http;
import 'dart:convert';
import '../core/api_constants.dart';
import '../models/pelicula_model.dart';

class PeliculasService {
  Future<List<Pelicula>> obtenerPeliculasCartelera() async {
    try {
      final url = Uri.parse(
        '${ApiConstants.baseUrl}/movie/now_playing?api_key=${ApiConstants.apiKey}&language=es-ES',
      );

      final respuesta = await http.get(url);

      if (respuesta.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(respuesta.body);

        List<Pelicula> peliculas =
            (data['results'] as List)
                .map((json) => Pelicula.fromJson(json))
                .toList();

        return peliculas;
      } else {
        print('Error en la solicitud: ${respuesta.statusCode}');
        return [];
      }
    } catch (error) {
      print('Error al obtener películas: $error');
      return [];
    }
  }
}
