import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/model/restaurant_model.dart';
import 'package:tasty_drive_website/model/user_model.dart';

class AllRestaurantItem extends StatefulWidget {
  final Users? restaurants;
  final double height;

  const AllRestaurantItem({
    Key? key,
    this.restaurants,
    required this.height,
  }) : super(key: key);

  @override
  _AllRestaurantItemState createState() => _AllRestaurantItemState();
}

class _AllRestaurantItemState extends State<AllRestaurantItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isHovering = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 1.05).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovering = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovering = false);
        _controller.reverse();
      },
      child: ScaleTransition(
        scale: _animation,
        child: Container(
          decoration: BoxDecoration(
            color: _isHovering
                ? const Color.fromARGB(255, 223, 255, 242)
                : Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: _isHovering
                ? [
                    const BoxShadow(
                        color: Color.fromARGB(255, 22, 88, 45), blurRadius: 2)
                  ]
                : [const BoxShadow(color: Colors.grey, blurRadius: 4)],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Image.asset(
                  "assets/restaurants/tiger_suger.jpg",
                  height: widget.height * 0.2,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.restaurants?.name ?? "",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.restaurants?.description ?? "",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    const Icon(Icons.access_time, color: Colors.black),
                    const SizedBox(width: 10),
                    Text(widget.restaurants?.time ?? "10 min"),
                    const SizedBox(width: 10),
                    Text(widget.restaurants?.distance ?? "0.2 km"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
