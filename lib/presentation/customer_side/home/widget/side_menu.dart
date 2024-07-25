import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/controller/home_controller.dart';

class SideMenu extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Obx(
          () => ListView(
            children: [
              DrawerHeader(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset("assets/icons/Tasty.png")),
              ),
              ...List.generate(
                homeController.menuItems.length,
                (index) => DrawerItem(
                  isActive: index == homeController.selectedIndex,
                  title: homeController.menuItems[index],
                  press: () {
                    homeController.setMenuIndex(index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback press;

  const DrawerItem({
    Key? key,
    required this.title,
    required this.isActive,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        selected: isActive,
        selectedTileColor: Colors.red,
        onTap: press,
        title: Text(
          title,
          style: GoogleFonts.poppins(fontSize: 12),
        ),
      ),
    );
  }
}
