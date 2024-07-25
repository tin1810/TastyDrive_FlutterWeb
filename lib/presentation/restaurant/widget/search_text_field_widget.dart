import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
      child: TextField(
        decoration: InputDecoration(
            fillColor: Colors.white,
            prefixIcon: const Icon(Icons.location_pin),
            hintText: "Enter address to find nearest restaurant",
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(2),
              child: MaterialButton(
                minWidth: width * 0.08,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {},
                color: Colors.green,
                child: Text(
                  "Search",
                  style: GoogleFonts.poppins(fontSize: 13, color: Colors.white),
                ),
              ),
            )),
      ),
    );
  }
}
