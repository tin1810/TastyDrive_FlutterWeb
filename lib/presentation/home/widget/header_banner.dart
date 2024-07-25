import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/presentation/restaurant/all_restaurant.dart';
import 'package:tasty_drive_website/responsive.dart';

class HeaderBannerSection extends StatelessWidget {
  const HeaderBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isDesktop(context)) SizedBox(height: 50),
          Text(
            "Fastest Food Ordering Service \nTo Your Place",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: Responsive.isDesktop(context) ? 35 : 18,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 70),
          Container(
            margin: Responsive.isDesktop(context)
                ? EdgeInsets.only(right: 930)
                : null,
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.location_pin),
                  hintText: "Enter address to find nearest restaurant",
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(2),
                    child: MaterialButton(
                      minWidth: width * 0.08,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        Get.to(() => const AllRestaurantScreen());
                      },
                      color: Colors.green,
                      child: Text(
                        "Search",
                        style: GoogleFonts.poppins(
                            fontSize: 13, color: Colors.white),
                      ),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
