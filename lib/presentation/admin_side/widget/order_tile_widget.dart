import 'package:flutter/material.dart';
import 'package:tasty_drive_website/model/order_model.dart';
import 'package:tasty_drive_website/presentation/customer_side/home/widget/line_painter.dart';

class OrderTile extends StatelessWidget {
  final Order order;

  OrderTile({required this.order});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Card(
      color: Color.fromARGB(255, 241, 251, 242),
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1519058082700-08a0b56da9b4?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), // Placeholder image
                  radius: 24,
                ),
                SizedBox(width: 16),
                Text(order.name,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            CustomPaint(
              size: Size(width, 30), // Set the desired size
              painter: LinePainterGrey(),
            ),
            Row(
              children: [
                Image.asset(
                  'assets/restaurants/daddy_bubble_tea_tiger_sugar.jpg', // Placeholder image for product
                  width: 50,
                  height: 50,
                ),
                SizedBox(width: 16),
                Expanded(flex: 2, child: Text(order.product)),
                // SizedBox(width: width * 0.07),
                Expanded(flex: 1, child: Text('x${order.quantity}')),
                // SizedBox(width: width * 0.07),
                Expanded(flex: 1, child: Text('\$${order.price}')),
                // SizedBox(width: width * 0.06),
                Expanded(flex: 2, child: Text(order.status)),
                // SizedBox(width: width * 0.1),
                Expanded(flex: 1, child: Text(order.deliveryService)),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Arrange Delivery'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
