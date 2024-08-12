import 'package:flutter/material.dart';
import 'package:tasty_drive_website/responsive.dart';

class CartItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double price;
  final double originalPrice;
  final int quantity;
  final VoidCallback onDelete; // Add this line

  const CartItem({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.quantity,
    required this.onDelete, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 20 : 60, vertical: 30),
      child: Row(
        children: [
          Image.asset(
            imageUrl,
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                Text(description),
                // Text('Size: $size / Color: $color'),
                Row(
                  children: [
                    Text('\$$price',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 5),
                    Text('\$$originalPrice',
                        style: const TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.lineThrough)),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: onDelete, // Add this line
          ),
        ],
      ),
    );
  }
}
