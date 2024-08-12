import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/model/restaurant_model.dart';

class AllRestaurantItem extends StatelessWidget {
  final Restaurants? restaurants;
  const AllRestaurantItem({
    super.key,
    required this.height,
    this.restaurants,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              "assets/restaurants/tiger_suger.jpg",
              height: height * 0.2,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            restaurants?.name ?? "",
            style: GoogleFonts.poppins(
                fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            restaurants?.description ?? "",
            style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.black54),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(Icons.access_time, color: Colors.black),
              SizedBox(
                width: 10,
              ),
              Text("15 mins"),
              SizedBox(
                width: 10,
              ),
              Text("0.2 km")
            ],
          )
        ],
      ),
    );
  }
}
