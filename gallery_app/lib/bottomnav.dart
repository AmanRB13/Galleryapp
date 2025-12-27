import 'package:flutter/material.dart';
import 'gallery.dart';
import 'favorites.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedindex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      selectedindex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [Galleryapp(), FavoritesPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorites',
          ),
        ],
        currentIndex: selectedindex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: onTapped,
      ),
    );
  }
}
