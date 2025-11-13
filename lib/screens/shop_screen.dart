import 'package:flutter/material.dart';

import '../data.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}



class _ShopScreenState extends State<ShopScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // белый фон
      appBar: AppBar(
        title: const Text('Shop', style:TextStyle(fontWeight:FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFE5EBFC),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.only(
                left: 10,
                top: 8,
                right: 180,
                bottom: 8,
              ),
              child: const Text(
                'Clothing',
                style: TextStyle(color:  Color(0xFF0042E0)),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.6, // чуть выше, чтобы не было overflow
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            // Карточка товара
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Контейнер с рамкой
                  Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.white, // цвет рамки
                        width: 6, // толщина рамки
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25), // цвет тени
                          blurRadius: 8, // степень размытия
                          offset: const Offset(0, 4), // смещение по оси X и Y
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          // Изображение
                          Image.asset(
                            product.imagePath,
                            fit: BoxFit.cover,
                            width: 155,
                            height: 171,
                          ),
                          // Иконка "избранное"
                          Positioned(
                            top: 4,
                            left: 4,
                            child: IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: product.isFavorite
                                    ? Colors.red
                                    : Colors.white.withOpacity(0.7),
                              ),
                              onPressed: () {
                                setState(() {
                                  product.isFavorite = !product.isFavorite;
                                });
                              },
                            ),
                          ),
                          // Иконка "корзина"
                          Positioned(
                            bottom: 4,
                            left: 4,
                            child: IconButton(
                              icon: Icon(
                                Icons.shopping_bag_outlined,
                                color: product.inCart
                                    ? Colors.black
                                    : Colors.white.withOpacity(0.7),
                              ),
                              onPressed: () {
                                setState(() {
                                  product.inCart = !product.inCart;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Текст под картинкой
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
