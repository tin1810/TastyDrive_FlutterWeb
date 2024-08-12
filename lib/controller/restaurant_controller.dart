// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
// import 'package:logger/web.dart';
// import 'package:tasty_drive_website/model/restaurant_model.dart';
// import 'package:tasty_drive_website/network/restaurant/restaurant_repository_impl.dart';

// class RestaurantController extends GetxController {
//   final _logger = Logger();
//   final DioServiceAgent _restaurantRepository = DioServiceAgent();
//   RestaurantModel? restaurantModel;
//   List<Restaurants>? restaurantList;

//   @override
//   void onInit() async {
//     await getRestaurantList();
//     super.onInit();
//   }

//   Future<void> getRestaurantList() async {
//     await EasyLoading.show();
//     try {
//       restaurantModel = await _restaurantRepository.getRestaurantList();
//       update();
//       _logger.i(restaurantModel);
//       // restaurantList = restaurantModel?.restaurants;

//       await EasyLoading.dismiss();
//     } catch (e) {
//       EasyLoading.dismiss();
//       Get.snackbar('Error', 'Failed to fetch restaurant list: $e');
//     }
//     update();
//   }
// }
