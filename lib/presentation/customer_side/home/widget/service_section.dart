import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/controller/home_controller.dart';
import 'package:tasty_drive_website/responsive.dart';

class ServiceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final HomeController homeController = Get.find<HomeController>();
    return Container(
      height: Responsive.isDesktop(context) ? 350 : 200,
      // padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.green[50],
      ),

      child: ListView.builder(
          // shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: homeController.homeBannerList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              padding: Responsive.isDesktop(context)
                  ? const EdgeInsets.all(80)
                  : const EdgeInsets.all(20),
              width:
                  Responsive.isDesktop(context) ? width * 0.245 : width * 0.5,
              decoration: BoxDecoration(
                  color: homeController.homeBannerList[index].color),
              child: Column(
                children: [
                  CircleAvatar(
                    maxRadius: 30,
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(
                      homeController.homeBannerList[index].icon ?? "",
                      color: homeController.homeBannerList[index].iconColor,
                      height: 30,
                    ),
                  ),
                  Responsive.isDesktop(context)
                      ? SizedBox(
                          height: 30,
                        )
                      : SizedBox(
                          height: 10,
                        ),
                  Text(
                    homeController.homeBannerList[index].title ?? "",
                    style: GoogleFonts.poppins(
                        fontSize: Responsive.isDesktop(context) ? 18 : 16,
                        fontWeight: FontWeight.bold,
                        color: homeController.homeBannerList[index].textColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    homeController.homeBannerList[index].subtitle ?? "",
                    style: GoogleFonts.poppins(
                        fontSize: Responsive.isDesktop(context) ? 15 : 13,
                        fontWeight: FontWeight.w400,
                        color: homeController.homeBannerList[index].textColor),
                  ),
                ],
              ),
            );
          }),
      // child: Row(
      //   children: List.generate(homeController.homeBannerList.length,
      //       growable: true, (index) {
      //     return Container(
      //       margin: const EdgeInsets.symmetric(horizontal: 3),
      //       padding: const EdgeInsets.all(80),
      //       width: width * 0.245,
      //       decoration: BoxDecoration(
      //           color: homeController.homeBannerList[index].color),
      //       child: Column(
      //         children: [
      //           CircleAvatar(
      //             maxRadius: 30,
      //             backgroundColor: Colors.white,
      //             child: SvgPicture.asset(
      //               homeController.homeBannerList[index].icon ?? "",
      //               color: homeController.homeBannerList[index].iconColor,
      //               height: 30,
      //             ),
      //           ),
      //           const SizedBox(
      //             height: 30,
      //           ),
      //           Text(
      //             homeController.homeBannerList[index].title ?? "",
      //             style: GoogleFonts.poppins(
      //                 fontSize: 18,
      //                 fontWeight: FontWeight.bold,
      //                 color: homeController.homeBannerList[index].textColor),
      //           ),
      //           const SizedBox(
      //             height: 10,
      //           ),
      //           Text(
      //             homeController.homeBannerList[index].subtitle ?? "",
      //             style: GoogleFonts.poppins(
      //                 fontSize: 15,
      //                 fontWeight: FontWeight.w400,
      //                 color: homeController.homeBannerList[index].textColor),
      //           ),
      //         ],
      //       ),
      //     );
      //   }),
      // ),
    );
  }
}

Widget _buildColumn(String title, List<String> items) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 8),
      for (var item in items)
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            item,
            style: const TextStyle(color: Colors.white),
          ),
        ),
    ],
  );
}
