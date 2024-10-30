import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:hello_world_app/modules/home/entities/restaurant.dart';

class RestaurantDetail extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantDetail({super.key, required this.restaurant});

  @override
  _RestaurantDetailState createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurant.name),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carrusel de imágenes con indicador de página
              SizedBox(
                height: 250,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      itemCount: widget.restaurant.imagenes.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            widget.restaurant.imagenes[index],
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.image_not_supported,
                                size: 50,
                                color: Colors.grey,
                              );
                            },
                          ),
                        );
                      },
                    ),
                    Positioned(
                      bottom: 8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          widget.restaurant.imagenes.length,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: _currentPage == index ? 12 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: _currentPage == index
                                  ? Colors.blue
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Descripción del restaurante
              Text(
                widget.restaurant.description,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 20),

              // Estrellas y rating
              Row(
                children: [
                  StarRating(
                    rating: widget.restaurant.count > 0
                        ? widget.restaurant.rating / widget.restaurant.count
                        : 0.0,
                    size: 25,
                    color: Colors.amber,
                    borderColor: Colors.grey,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "${widget.restaurant.rating} / ${widget.restaurant.count}",
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Sección de comentarios
              const Text(
                "Comentarios:",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 10),
              _buildCommentSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Método para construir la sección de comentarios
  Widget _buildCommentSection() {
    // Aquí se pueden agregar comentarios dinámicos según los datos disponibles
    return Column(
      children: [
        _commentCard("Carlos", "Excelente servicio y comida deliciosa."),
        const SizedBox(height: 8),
        _commentCard("Ana", "El ambiente es muy acogedor."),
      ],
    );
  }

  Widget _commentCard(String author, String comment) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(author[0]),
        ),
        title: Text(author),
        subtitle: Text(comment),
      ),
    );
  }
}
