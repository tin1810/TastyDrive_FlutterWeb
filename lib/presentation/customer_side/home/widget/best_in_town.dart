import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/presentation/customer_side/home/widget/line_painter.dart';
import 'package:tasty_drive_website/responsive.dart';

class BestInTownSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: Responsive.isDesktop(context)
          ? const EdgeInsets.only(left: 100, right: 100, top: 50, bottom: 50)
          : const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      color: Colors.green.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Responsive.isDesktop(context)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "We Always Provide \nYou The Best In Town",
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      "We Always Provide \nYou The Best In Town",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              : Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "We Always Provide \nYou The Best In Town",
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      "We Always Provide \nYou The Best In Town",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
          const SizedBox(height: 20),
          Image.asset("assets/icons/image.png"),
          const SizedBox(height: 30),
          Responsive.isDesktop(context)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      height: height * 0.07,
                      minWidth: width * 0.17,
                      color: Colors.green.shade800,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Partner With Us",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    Column(
                      children: [
                        CustomPaint(
                          size: const Size(800, 60), // Set the desired size
                          painter: LinePainter(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: '5+ ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 24),
                                  ),
                                  TextSpan(
                                    text: 'Years Experience',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: '100+ ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 24),
                                  ),
                                  TextSpan(
                                    text: 'Young Riders',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: '5K+ ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 24),
                                  ),
                                  TextSpan(
                                    text: 'Regular Customers',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        CustomPaint(
                          size: const Size(800, 60), // Set the desired size
                          painter: LinePainter(),
                        ),
                      ],
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      height: height * 0.07,
                      minWidth: width * 0.17,
                      color: Colors.green.shade800,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Partner With Us",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    Column(
                      children: [
                        CustomPaint(
                          size: const Size(500, 60), // Set the desired size
                          painter: LinePainter(),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: '5+ ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  TextSpan(
                                    text: 'Years Experience',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: '100+ ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  TextSpan(
                                    text: 'Young Riders',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: '5K+ ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  TextSpan(
                                    text: 'Regular Customers',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        CustomPaint(
                          size: const Size(800, 60), // Set the desired size
                          painter: LinePainter(),
                        ),
                      ],
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
