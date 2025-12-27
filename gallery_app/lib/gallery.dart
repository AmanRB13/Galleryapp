import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'favorites_data.dart';

class Galleryapp extends StatefulWidget {
  const Galleryapp({super.key});

  @override
  State<Galleryapp> createState() => _GalleryappState();
}

class _GalleryappState extends State<Galleryapp> {
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    fetchapi();
  }

  fetchapi() async {
    final response = await http.get(
      Uri.parse(
        'https://api.unsplash.com/photos/random?count=10&query=dogs&client_id,
      ),
    );

    setState(() {
      data = jsonDecode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery App'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body:
          data.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                itemCount: data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3,
                ),
                itemBuilder: (context, index) {
                  String imageUrl = data[index]['urls']['regular'];
                  bool isFavorite = favorites.contains(imageUrl);

                  return GestureDetector(
                    onTap: () {
                      if (!isFavorite) {
                        setState(() {
                          favorites.add(imageUrl);
                        });
                      }
                    },

                    onDoubleTap: () {
                      setState(() {
                        favorites.remove(imageUrl);
                      });
                    },

                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              data.removeAt(index);
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          top: 8,
                          right: 8,
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
    );
  }
}
