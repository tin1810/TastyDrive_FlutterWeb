import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasty_drive_website/responsive.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 1, 55, 17),
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        maxRadius: 30,
                        backgroundImage: AssetImage(
                          'assets/icons/Tasty.png',
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Tasty Drive',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Morbi augue ut dignissim ut nunc sed\nipsum sit. Quam diam molestie quam et\narcu eget sed condimentum at.',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        Icons.facebook_outlined,
                        color: Colors.blue.shade800,
                        size: 35,
                      ),
                      const SizedBox(width: 8),
                      SvgPicture.asset("assets/icons/instagram.svg"),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          Responsive.isDesktop(context)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildColumn('Company', [
                      'About us',
                      'Delivery Information',
                      'Privacy Policy',
                      'Terms & Conditions',
                      'Contact Us',
                      'FAQ'
                    ]),
                    _buildColumn('Account', [
                      'Sign In',
                      'View Cart',
                      'My Wishlist',
                      'Track My Order',
                      'Help Ticket',
                      'Shipping Details',
                      'Compare products'
                    ]),
                    _buildColumn('Corporate', [
                      'Become a Merchant',
                      'Become a Rider',
                      'Foodeliver Business',
                      'Foodeliver Careers',
                      'Our Suppliers',
                      'Accessibility',
                      'Promotions'
                    ]),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Address',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Bangkok Thailand',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.phone, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              '0807 096 8420',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.email, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              'info@tastydrive.com',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.access_time, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              '24 hours support',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildColumn('Company', [
                          'About us',
                          'Delivery Information',
                          'Privacy Policy',
                          'Terms & Conditions',
                          'Contact Us',
                          'FAQ'
                        ]),
                        _buildColumn('Account', [
                          'Sign In',
                          'View Cart',
                          'My Wishlist',
                          'Track My Order',
                          'Help Ticket',
                          'Shipping Details',
                          'Compare products'
                        ]),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildColumn('Corporate', [
                          'Become a Merchant',
                          'Become a Rider',
                          'Foodeliver Business',
                          'Foodeliver Careers',
                          'Our Suppliers',
                          'Accessibility',
                          'Promotions'
                        ]),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Address',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Bangkok Thailand',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.phone, color: Colors.white),
                                SizedBox(width: 8),
                                Text(
                                  '0807 096 8420',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.email, color: Colors.white),
                                SizedBox(width: 8),
                                Text(
                                  'info@tastydrive.com',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.access_time, color: Colors.white),
                                SizedBox(width: 8),
                                Text(
                                  '24 hours support',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
          const SizedBox(height: 32),
          // Footer
          Wrap(
            children: [
              const Text(
                '© 2024, TastyDrive - Sustainable Food To Your Door All rights reserved',
                style: TextStyle(color: Colors.white),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Secured Payment Gateways',
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/visa.svg",
                        height: 35,
                      ),
                      SvgPicture.asset(
                        "assets/icons/mastercard.svg",
                        height: 35,
                      ),
                      SvgPicture.asset(
                        "assets/icons/jcb.svg",
                        height: 35,
                      ),
                      SvgPicture.asset(
                        "assets/icons/unionpay.svg",
                        height: 35,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
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
}
