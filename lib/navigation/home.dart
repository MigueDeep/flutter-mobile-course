import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio"),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.pushNamed(context, '/reservations'),
        },
        child: const Icon(Icons.chevron_right),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
                onPressed: () => {
                      Navigator.pushNamed(context, '/profile'),
                    },
                child: const Text("Perfil", style: TextStyle(fontSize: 20, color: Colors.purpleAccent))),
          ],
        ),
      ),
    );
  }
}
