import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/addnew_dishes_dialog.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/addnew_restaurant_dialog.dart';

class TitleWIdgetForDishes extends StatelessWidget {
  final String name;
  final String buttonName;
  const TitleWIdgetForDishes({
    super.key,
    required this.name,
    required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          MaterialButton(
            minWidth: 70,
            height: 50,
            color: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                buttonName,
                style: GoogleFonts.poppins(fontSize: 13, color: Colors.white),
              ),
            ),
            onPressed: () {
              name == "Manage Dishes"
                  ? showAddDishDialog()
                  : addAddRestaurantDialog();
            },
          ),
        ],
      ),
    );
  }
}
