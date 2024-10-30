import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hello_world_app/modules/home/entities/restaurant.dart';
import 'package:hello_world_app/widgets/home/list_restaurant.dart';
import 'package:hello_world_app/widgets/home/restaurant_detail.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Restaurant> restaurants = [];
  final db = FirebaseFirestore.instance;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final snapshot = await db.collection("restaurants").get();
      final List<Restaurant> loadedRestaurants = snapshot.docs.map((doc) {
        final data = doc.data();
        print(data);
        return Restaurant(
          data['name'] ?? 'Nombre desconocido',
          data['description'] ?? 'Sin descripción',
          List<String>.from(data['images'] ?? []),
          data['rating'] ?? 0.0,
          data['count'] ?? 0,
        );
      }).toList();

      if (mounted) {
        setState(() {
          restaurants = loadedRestaurants;
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error al cargar los datos: $e');
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (restaurants.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Inicio"),
          backgroundColor: Colors.blue,
        ),
        body: const Center(
          child: Text("No hay restaurantes disponibles."),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = restaurants[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RestaurantDetail(restaurant: restaurant),
                ),
              );
            },
            child: ListRestaurantData(restaurant: restaurant),
          );
        },
      ),
    );
  }
}
