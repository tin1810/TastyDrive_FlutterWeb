import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/controller/home_controller.dart';
import 'package:tasty_drive_website/responsive.dart';

class CustomAppBarAdminPanel extends StatelessWidget
    implements PreferredSizeWidget {
  final HomeController homeController = Get.put(HomeController());

  CustomAppBarAdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leadingWidth: 300,
      leading: Container(
        padding: Responsive.isDesktop(context)
            ? const EdgeInsets.only(
                left: 50,
                top: 5,
                bottom: 5,
              )
            : Responsive.isTablet(context)
                ? const EdgeInsets.only(
                    left: 20,
                    top: 5,
                    bottom: 5,
                  )
                : null,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (!Responsive.isDesktop(context))
              IconButton(
                  onPressed: () {
                    // homeController.openOrCloseDrawer();
                  },
                  icon: const Icon(Icons.menu)),
            const CircleAvatar(
              maxRadius: 30,
              backgroundImage: AssetImage(
                'assets/icons/Tasty.png',
              ),
            ),
            Flexible(
              child: Text(
                "Tasty Drive",
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.green),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_outlined),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
