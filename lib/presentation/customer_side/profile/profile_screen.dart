import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/controller/home_controller.dart';
import 'package:tasty_drive_website/presentation/customer_side/profile/order_history_widget.dart';
import 'package:tasty_drive_website/presentation/customer_side/profile/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final HomeController homeController = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.withOpacity(0.2),
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MenuWidget(),
          Obx(() => Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    homeController.selected.value == 0
                        ? const ProfileWidget()
                        : const OrderHistoryWidget()
                  ],
                ),
              )))
        ],
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
        width: width * 0.18,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          border: Border.all(color: Colors.black12),
        ),
        child: GetBuilder<HomeController>(builder: (homeController) {
          return ListView.builder(
              itemCount: homeController.profileList.length,
              itemBuilder: (context, index) {
                bool isSelected = homeController.selected.value == index;

                return MaterialButton(
                  elevation: 0.2,
                  height: height * 0.07,
                  color: isSelected ? Colors.green.shade100 : Colors.white,
                  onPressed: () {
                    homeController.changeSelectedIndex(index);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(color: Colors.black12)),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        homeController.profileList[index].icon ?? "",
                        height: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child:
                            Text(homeController.profileList[index].title ?? ""),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    ],
                  ),
                );
              });
        }));
  }
}
