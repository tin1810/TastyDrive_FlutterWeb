import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasty_drive_website/model/checkout_order_model.dart';
import 'package:tasty_drive_website/model/order_model.dart';
import 'package:tasty_drive_website/presentation/customer_side/home/widget/line_painter.dart';

class OrderTile extends StatelessWidget {
  final OrderItems? order;
  final String? userName;
  final String? address;
  final Function onClicked;

  OrderTile(this.order, this.userName, this.address, this.onClicked);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final dateFormat = DateFormat('dd.MMM.yyy');
    return Card(
      color: const Color.fromARGB(255, 241, 251, 242),
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1519058082700-08a0b56da9b4?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), // Placeholder image
                  radius: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(userName ?? "",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                Expanded(
                  child: SizedBox(),
                ),
                Text("Address: $address" "",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
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
                const SizedBox(width: 16),
                Expanded(flex: 2, child: Text(order?.name ?? "")),
                // SizedBox(width: width * 0.07),
                const Expanded(flex: 1, child: Text('x${1}')),
                // SizedBox(width: width * 0.07),
                Expanded(flex: 1, child: Text('\$${order?.price}')),
                // SizedBox(width: width * 0.06),
                Expanded(flex: 2, child: Text(order?.orderStatus ?? "")),
                // SizedBox(width: width * 0.1),
                Expanded(
                  flex: 1,
                  child: Text(order?.createdAt != null
                      ? dateFormat.format(DateTime.parse(order!.createdAt!))
                      : ""),
                ),

                order?.orderStatus == "Completed"
                    ? SizedBox(
                        width: 150,
                      )
                    : ElevatedButton(
                        onPressed: () {
                          onClicked();
                        },
                        child: const Text('Complete Delivery'),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OrderTileUser extends StatelessWidget {
  final OrderItems? order;
  final String? userName;
  final String? address;

  OrderTileUser(
    this.order,
    this.userName,
    this.address,
  );

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final dateFormat = DateFormat('dd.MMM.yyy');
    return Card(
      color: const Color.fromARGB(255, 241, 251, 242),
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1519058082700-08a0b56da9b4?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), // Placeholder image
                  radius: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(userName ?? "",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                Expanded(
                  child: SizedBox(),
                ),
                Text("Address: $address" "",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
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
                const SizedBox(width: 16),
                Expanded(flex: 2, child: Text(order?.name ?? "")),
                // SizedBox(width: width * 0.07),
                const Expanded(flex: 1, child: Text('x${1}')),
                // SizedBox(width: width * 0.07),
                Expanded(flex: 1, child: Text('\$${order?.price}')),
                // SizedBox(width: width * 0.06),
                Expanded(flex: 2, child: Text(order?.orderStatus ?? "")),
                // SizedBox(width: width * 0.1),
                Expanded(
                  flex: 1,
                  child: Text(order?.createdAt != null
                      ? dateFormat.format(DateTime.parse(order!.createdAt!))
                      : ""),
                ),
                Expanded(
                  flex: 1,
                  child: Text(order?.restaurantName ?? ""),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
