import 'package:flutter/material.dart';
import '../data.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Список товаров в корзине с количеством
  final Map<Product, int> cartItems = {};

  @override
  void initState() {
    super.initState();
    // Заполняем карту товарами из глобального списка, где inCart == true
    for (final product in products) {
      if (product.inCart) {
        cartItems[product] = 1; // по умолчанию 1 штука
      }
    }
  }

  double get totalPrice {
    return cartItems.entries.fold(0.0, (sum, entry) {
      return sum + (entry.key.price * entry.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart', style:TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 250.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.only(
                left: 10,
                top: 8,
                bottom: 8,
                right: 10,
              ),
              child: Text(
                '${cartItems.length}',
                style: const TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final entry = cartItems.entries.elementAt(index);
                  final product = entry.key;
                  final quantity = entry.value;

                  return Container(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Stack(
                          children: [
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
                                      width: 121,
                                      height: 101,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              bottom: 20,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    product.inCart = false;
                                    cartItems.remove(product);
                                  });
                                },
                                child: Image.asset(
                                  'assets/images/delete.png', // путь к вашей картинке
                                  width: 35, // размер картинки
                                  height: 35,
                                ),

                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Pink, Size M',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text('\$${product.price.toStringAsFixed(2)}', style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,



                                  ),),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: quantity > 1
                                            ? () {
                                          setState(() {
                                            cartItems[product] = quantity - 1;
                                          });
                                        }
                                            : null,
                                        child: Image.asset(
                                          'assets/images/Less.png', // путь к вашей картинке "-"
                                          width: 30,
                                          height: 30,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Container(
                                        width: 32,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          color: Colors.blue.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child: Center(child: Text('$quantity')),
                                      ),
                                      const SizedBox(width: 10),

                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            cartItems[product] = quantity + 1;
                                          });
                                        },
                                        child: Image.asset(
                                          'assets/images/More.png', // путь к вашей картинке "+"
                                          width: 30,
                                          height: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              children: [
                Text(
                  'Total \$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF004CFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Checkout' ,style:TextStyle(
                    color:Color(0xFFF3F3F3)
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
