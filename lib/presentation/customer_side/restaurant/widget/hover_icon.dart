import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tasty_drive_website/presentation/customer_side/checkout/checkout_screen.dart';
import 'package:tasty_drive_website/responsive.dart';

class HoverableIconButton extends StatefulWidget {
  @override
  _HoverableIconButtonState createState() => _HoverableIconButtonState();
}

class _HoverableIconButtonState extends State<HoverableIconButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _onEnter(true),
      onExit: (event) => _onEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: IconButton(
          iconSize: _isHovering ? 40 : 30, // Increase size when hovering
          color: _isHovering
              ? Colors.blue
              : Colors.grey, // Change color when hovering
          icon: SvgPicture.asset("assets/icons/cart.svg"),
          onPressed: () {
            Get.to(() => CheckoutScreen());
          },
        ),
        decoration: BoxDecoration(
          boxShadow: _isHovering
              ? [BoxShadow(color: Colors.blue.withOpacity(0.2), blurRadius: 10)]
              : [],
        ),
      ),
    );
  }

  void _onEnter(bool isHovering) {
    setState(() {
      _isHovering = isHovering;
    });
  }

  void _showDialog() {
    double width = MediaQuery.of(context).size.width;
    Get.dialog(
      LayoutBuilder(
        builder: (context, constraints) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('My Cart'),
            content: Container(
              width: constraints.maxWidth * 0.4, // Adjust the width as needed
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        "assets/restaurants/daddy_bubble_tea_tiger_sugar.jpg",
                      ),
                      title: Row(
                        children: [
                          Responsive.isDesktop(context)
                              ? Expanded(
                                  child:
                                      Text("Daddy Signature Sugar Bubble Tea"),
                                )
                              : Text("Daddy Signature Sugar Bubble Tea"),
                          SizedBox(width: 20),
                          Text("* 1"),
                        ],
                      ),
                      trailing: const Text("\$ 10"),
                    ),
                  );
                },
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Checkout'),
              ),
            ],
          );
        },
      ),
    );
  }
}
