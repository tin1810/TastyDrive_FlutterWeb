import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/presentation/customer_side/home/widget/footer_section.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 600,
              width: double.infinity,
              color: Colors.cyan.withOpacity(0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Tasty Drive ",
                        style: GoogleFonts.lato(
                          fontSize: 35,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Blog",
                        style: GoogleFonts.lato(
                          fontSize: 35,
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "It is a long established fact that a reader will be distracted by \nthe readable content of a page when looking at its layout.",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlogPost(
                  title: '6 Tips To Make Paleo Eating Easy',
                  content: 'September 21, 2020',
                  image: 'assets/restaurants/cupcake.jpg',
                ),
                BlogPost(
                  title: 'T6 Tips To Make Paleo Eating Easy',
                  content: 'April 10, 2024',
                  image: 'assets/restaurants/chicken.jpg',
                ),
              ],
            ),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

class BlogPost extends StatelessWidget {
  final String title;
  final String content;
  final String image;

  BlogPost({required this.title, required this.content, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: 600,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.cyan.withOpacity(0.1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 350,
              margin: EdgeInsets.only(bottom: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(image)),
              )),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(content),
        ],
      ),
    );
  }
}
