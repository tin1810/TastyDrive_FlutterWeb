import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/presentation/customer_side/restaurant/widget/add_to_cart_dialog.dart';
import 'package:tasty_drive_website/responsive.dart';

class DetailItemCard extends StatefulWidget {
  final IconData icon;
  final String itemName;
  final int price;
  final String ingredint;
  final Function onClick;

  const DetailItemCard({
    Key? key,
    required this.icon,
    required this.itemName,
    required this.price,
    required this.ingredint,
    required this.onClick,
  }) : super(key: key);

  @override
  _DetailItemCardState createState() => _DetailItemCardState();
}

class _DetailItemCardState extends State<DetailItemCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isHovering = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 1.05).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovering = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovering = false);
        _controller.reverse();
      },
      child: ScaleTransition(
        scale: _animation,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: _isHovering
                ? const Color.fromARGB(255, 223, 255, 242)
                : Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: _isHovering
                ? [
                    const BoxShadow(
                        color: Color.fromARGB(255, 22, 88, 45), blurRadius: 2)
                  ]
                : [const BoxShadow(color: Colors.grey, blurRadius: 4)],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.itemName,
                      style: GoogleFonts.poppins(
                        fontSize: Responsive.isDesktop(context) ? 18 : 15,
                        fontWeight: FontWeight.bold,
                        color: _isHovering ? Colors.blue : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "From \$${widget.price}",
                      style: GoogleFonts.poppins(
                        fontSize: Responsive.isDesktop(context) ? 17 : 15,
                        color: _isHovering ? Colors.blue : Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: Responsive.isDesktop(context)
                          ? width * 0.3
                          : Responsive.isMobile(context)
                              ? width * 0.3
                              : width * 0.7,
                      child: Text(
                        widget.ingredint,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: GoogleFonts.poppins(
                          fontSize: Responsive.isDesktop(context) ? 16 : 12,
                          fontWeight: FontWeight.w400,
                          color: _isHovering ? Colors.blue : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: Responsive.isMobile(context)
                      ? const EdgeInsets.all(1.0)
                      : Responsive.isTablet(context)
                          ? const EdgeInsets.all(2.0)
                          : const EdgeInsets.all(7.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/restaurants/tiger_suger.jpg',
                          fit: BoxFit.contain,
                          width: Responsive.isTablet(context)
                              ? width * 0.13
                              : Responsive.isMobile(context)
                                  ? width * 0.23
                                  : width * 0.13,
                          height: Responsive.isTablet(context)
                              ? width * 0.16
                              : Responsive.isMobile(context)
                                  ? height * 0.14
                                  : height * 0.2,
                        ),
                        Positioned(
                            child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                          ),
                          child: IconButton(
                              mouseCursor: MouseCursor.defer,
                              onPressed: () {
                                widget.onClick();
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              )),
                        ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
