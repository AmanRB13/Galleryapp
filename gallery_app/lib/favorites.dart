import 'package:flutter/material.dart';
import 'favorites_data.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: Colors.redAccent,
      ),
      body:
          favorites.isEmpty
              ? const Center(child: Text('No favorites'))
              : GridView.builder(
                itemCount: favorites.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(favorites[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
