import 'package:flutter/material.dart';
import 'package:tasty_drive_website/presentation/customer_side/restaurant/widget/detail_card.dart';
import 'package:tasty_drive_website/responsive.dart';

class GridViewDetail extends StatelessWidget {
  const GridViewDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        int crossAxisCount;
        if (constraints.maxWidth < 600) {
          crossAxisCount = 1;
        } else if (constraints.maxWidth < 1200) {
          crossAxisCount = 2;
        } else {
          crossAxisCount = 2;
        }
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context)
                  ? 16
                  : Responsive.isTablet(context)
                      ? 30
                      : 50,
              vertical: Responsive.isMobile(context) ? 10 : 20),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: Responsive.isMobile(context)
                ? 7
                : Responsive.isDesktop(context)
                    ? 30
                    : 20,
            mainAxisSpacing: Responsive.isMobile(context)
                ? 7
                : Responsive.isDesktop(context)
                    ? 30
                    : 20,
            childAspectRatio: Responsive.isMobile(context)
                ? 1.6
                : Responsive.isTablet(context)
                    ? 1.9
                    : 3.5,
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            return const DetailItemCard(
              icon: Icons.abc,
              itemName: "Chicken Shawarma Wrap",
              price: "10",
              ingredint: 'Lettuce , tomato,pickles,garlic sauce',
            );
          },
        );
      },
    );
  }
}
