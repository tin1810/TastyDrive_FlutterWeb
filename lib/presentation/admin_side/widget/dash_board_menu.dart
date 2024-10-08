import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:tasty_drive_website/controller/auth_controller.dart';
import 'package:tasty_drive_website/controller/home_controller.dart';

class DashBoardMenuWidget extends StatelessWidget {
  const DashBoardMenuWidget({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          border: Border.all(color: Colors.black12),
        ),
        width: width * 0.18,
        height: double.infinity,
        child: GetBuilder<HomeController>(builder: (homeController) {
          return ListView.builder(
              itemCount: authController.loginresponse.value?.users?.isAdmin == 1
                  ? homeController.adminList.length
                  : homeController.restaurantAdminList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                bool isSelected = homeController.selected.value == index;
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: MaterialButton(
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
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            authController
                                        .loginresponse.value?.users?.isAdmin ==
                                    1
                                ? homeController.adminList[index].icon ?? ""
                                : homeController
                                        .restaurantAdminList[index].icon ??
                                    "",
                            height: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Text(authController.loginresponse.value
                                          ?.users?.isAdmin ==
                                      1
                                  ? homeController.adminList[index].title ?? ""
                                  : homeController
                                          .restaurantAdminList[index].title ??
                                      "")),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          ),
                        ],
                      ),
                    ));
              });
        }));
  }
}
