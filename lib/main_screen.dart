import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:mad_shop/main_screen.dart';
import 'package:mad_shop/screens/cart_screen.dart';
import 'package:mad_shop/screens/favourite_screen.dart';
import 'package:mad_shop/screens/login_screen.dart';
import 'package:mad_shop/screens/password_screen.dart';
import 'package:mad_shop/screens/shop_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/create_account_screen.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(child: ShopScreen()),
    const Center(child: FavoritesScreen()),
    const Center(child: CartScreen()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          showSelectedLabels: false,
          // скрываем текст
          showUnselectedLabels: false,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey.shade400,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 28),
              label: '', // текст скрыт
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline, size: 28),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined, size: 28),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
