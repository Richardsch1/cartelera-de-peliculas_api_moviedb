import 'package:flutter/material.dart';
import '../services/peliculas_service.dart';
import '../models/pelicula_model.dart';
import '../widgets/tarjeta_pelicula_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PeliculasService _peliculasService = PeliculasService();
  List<Pelicula> _peliculas = [];
  bool _cargando = true;

  @override
  void initState() {
    super.initState();
    _cargarPeliculas();
  }

  Future<void> _cargarPeliculas() async {
    setState(() {
      _cargando = true;
    });

    final peliculas = await _peliculasService.obtenerPeliculasCartelera();

    setState(() {
      _peliculas = peliculas;
      _cargando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartelera de Películas'),
        centerTitle: true,
      ),
      body:
          _cargando
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _peliculas.length,
                itemBuilder: (context, index) {
                  return TarjetaPeliculaWidget(pelicula: _peliculas[index]);
                },
              ),
    );
  }
}
