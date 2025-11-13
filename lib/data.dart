class Product {
  final String imagePath;
  final String title;
  final double price;
  bool isFavorite;
  bool inCart;

  Product({
    required this.imagePath,
    required this.title,
    required this.price,
    this.isFavorite = false,
    this.inCart = false,
  });
}

List<Product> products = [
  Product(
    imagePath: 'assets/images/product1.jpg',
    title: 'Lorem ipsum dolor sit amet consectetur',
    price: 17.00,
  ),
  Product(
    imagePath: 'assets/images/product2.jpg',
    title: 'Lorem ipsum dolor sit amet consectetur',
    price: 17.00,
  ),
  Product(
    imagePath: 'assets/images/product3.jpg',
    title: 'Lorem ipsum dolor sit amet consectetur',
    price: 17.00,
  ),
  Product(
    imagePath: 'assets/images/product4.jpg',
    title: 'Lorem ipsum dolor sit amet consectetur',
    price: 17.00,
  ),
  Product(
    imagePath: 'assets/images/product5.jpg',
    title: 'Lorem ipsum dolor sit amet consectetur',
    price: 17.00,
  ),
  Product(
    imagePath: 'assets/images/product6.jpg',
    title: 'Lorem ipsum dolor sit amet consectetur',
    price: 17.00,
  ),
];
