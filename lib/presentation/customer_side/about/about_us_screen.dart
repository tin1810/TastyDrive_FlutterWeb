import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tasty_drive_website/controller/home_controller.dart';
import 'package:tasty_drive_website/presentation/customer_side/home/widget/footer_section.dart';
import 'package:tasty_drive_website/presentation/customer_side/home/widget/line_painter.dart';
import 'package:tasty_drive_website/responsive.dart';
import 'package:tasty_drive_website/util/widget/custom_appbar.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final HomeController homeController = Get.put(HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.green[50],
              // margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Charging Forward Together",
                    style: GoogleFonts.poppins(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/icons/aboutus.png",
                    height: height * 0.5,
                    width: width * 0.9,
                    fit: BoxFit.fitWidth,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 70, vertical: 10),
                      child: Text(
                        """Guided by the Grab Way, our mission is to drive \nSoutheast Asia forward by creating \neconomic empowerment for everyone. """,
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CustomPaint(
              size: const Size(1300, 10), // Set the desired size
              painter: LinePainter(),
            ),
            ResponsiveRowColumn(
              layout: ResponsiveBreakpoints.of(context).isDesktop
                  ? ResponsiveRowColumnType.ROW
                  : ResponsiveRowColumnType.COLUMN,
              rowPadding: const EdgeInsets.symmetric(horizontal: 55),
              columnPadding: const EdgeInsets.all(10),
              rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ResponsiveRowColumnItem(
                  child: Text(
                    "Creating sustainable impact",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: Text(
                    "We hold ourselves \nresponsible for the \nsustainable economic \nempowerment of this region.",
                    style: GoogleFonts.poppins(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 60),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         "Creating sustainable impact",
            //         style: GoogleFonts.poppins(
            //             fontSize: 16,
            //             color: Colors.black,
            //             fontWeight: FontWeight.w600),
            //       ),
            //       Text(
            //         "We hold ourselves \nresponsible for the \nsustainable economic \nempowerment of this region.",
            //         style: GoogleFonts.poppins(
            //             fontSize: 30,
            //             color: Colors.black,
            //             fontWeight: FontWeight.w600),
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              child: Image.asset(
                "assets/icons/deli_man_about.jpg",
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
            ),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
