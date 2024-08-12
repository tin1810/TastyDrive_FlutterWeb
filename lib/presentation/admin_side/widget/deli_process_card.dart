import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/controller/home_controller.dart';

class DeliProcessCardWidget extends StatelessWidget {
  const DeliProcessCardWidget({
    super.key,
    required this.homeController,
    required this.height,
    required this.width,
  });

  final HomeController homeController;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(homeController.deliveryCardList.length, (index) {
        return Container(
          height: height * 0.13,
          width: width * 0.2,
          margin: EdgeInsets.only(right: 5, top: 20),
          decoration: BoxDecoration(
              color: homeController.deliveryCardList[index].color),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(homeController.deliveryCardList[index].icon ?? ""),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    homeController.deliveryCardList[index].title ?? "",
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    homeController.deliveryCardList[index].count ?? "",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
