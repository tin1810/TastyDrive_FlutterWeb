import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tasty_drive_website/responsive.dart';

class RestaurantCardWidget extends StatelessWidget {
  final String name;
  final String time;
  final String image;
  const RestaurantCardWidget({
    super.key,
    required this.width,
    required this.name,
    required this.time,
    required this.image,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 10 : 55, vertical: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              width: Responsive.isMobile(context) ? width * 0.24 : width * 0.12,
              // height: height * 0.2,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: Responsive.isMobile(context) ? 15 : 30,
                ),
                child: Text(
                  name,
                  style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              ResponsiveRowColumn(
                layout: ResponsiveBreakpoints.of(context).isDesktop ||
                        ResponsiveBreakpoints.of(context).isTablet
                    ? ResponsiveRowColumnType.ROW
                    : ResponsiveRowColumnType.COLUMN,
                rowPadding: const EdgeInsets.symmetric(horizontal: 30),
                columnPadding: const EdgeInsets.all(10),
                rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ResponsiveRowColumnItem(child: const Icon(Icons.pedal_bike)),
                  ResponsiveRowColumnItem(
                    child: const SizedBox(
                      width: 5,
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: Text(
                      "Free Delivery",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: const SizedBox(
                      width: 5,
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: const CircleAvatar(
                      maxRadius: 3,
                      backgroundColor: Colors.black,
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: const SizedBox(
                      width: 5,
                    ),
                  ),
                  ResponsiveRowColumnItem(
                      child: const Icon(Icons.access_alarm)),
                  ResponsiveRowColumnItem(
                    child: const SizedBox(
                      width: 5,
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: Text(
                      time,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Responsive.isMobile(context) ? 15 : 30, top: 5),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "5/5(34)",
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
