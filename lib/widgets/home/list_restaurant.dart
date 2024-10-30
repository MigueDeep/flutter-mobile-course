  import 'package:flutter/material.dart';
  import 'package:flutter_rating/flutter_rating.dart';
  import 'package:hello_world_app/modules/home/entities/restaurant.dart';

  class ListRestaurantData extends StatelessWidget {
    const ListRestaurantData({
      super.key,
      required this.restaurant,
    });

    final Restaurant restaurant;

    @override
    Widget build(BuildContext context) {
      // Validar URL de la imagen.
      String imageUrl = restaurant.imagenes.isNotEmpty
          ? restaurant.imagenes[0]
          : 'https://via.placeholder.com/150'; // Imagen de placeholder

      return Padding(
        padding: const EdgeInsets.all(10.0), // Márgenes alrededor del contenido
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8), // Bordes redondeados
                  child: Image.network(
                    imageUrl,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.image_not_supported,
                        size: 80,
                        color: Colors.grey,
                      );
                    },
                  ),
                ),
                const SizedBox(width: 15), // Espacio entre imagen y contenido
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8), // Espacio entre nombre y descripción
                      Text(
                        restaurant.description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10), // Espacio entre texto y estrellas
                Column(
                  children: [
                    StarRating(
                      rating: restaurant.count > 0
                          ? restaurant.rating / restaurant.count
                          : 0.0,
                      size: 20,
                      color: Colors.amber,
                      borderColor: Colors.grey,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "${restaurant.rating} / ${restaurant.count}",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
