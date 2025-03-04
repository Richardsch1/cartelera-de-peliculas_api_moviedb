class Pelicula {
  final int id;
  final String titulo;
  final String posterPath;
  final String descripcion;
  final double calificacion;
  final String fechaEstreno;

  Pelicula({
    required this.id,
    required this.titulo,
    required this.posterPath,
    required this.descripcion,
    required this.calificacion,
    required this.fechaEstreno,
  });

  factory Pelicula.fromJson(Map<String, dynamic> json) {
    return Pelicula(
      id: json['id'],
      titulo: json['title'],
      posterPath: json['poster_path'] ?? '',
      descripcion: json['overview'],
      calificacion: json['vote_average'].toDouble(),
      fechaEstreno: json['release_date'],
    );
  }
}
