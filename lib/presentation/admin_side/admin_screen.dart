import 'package:flutter/material.dart';
import 'package:tasty_drive_website/util/widget/custom_appbar_for_admin.dart';

class AdminDashBoardScreen extends StatelessWidget {
  const AdminDashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarAdminPanel(),
    );
  }
}
