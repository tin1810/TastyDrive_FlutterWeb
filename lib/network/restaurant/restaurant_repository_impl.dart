// import 'package:dio/dio.dart';
// import 'package:tasty_drive_website/config/api_endpoint.dart';
// import 'package:tasty_drive_website/model/restaurant_model.dart';
// import 'package:tasty_drive_website/provider/api_service.dart';

// class DioServiceAgent {
//   DioServiceAgent._internal();
//   static final DioServiceAgent _singleton = DioServiceAgent._internal();
//   factory DioServiceAgent() => _singleton;

//   Future<RestaurantModel> getRestaurantList() async {
//     var dio = DioUtil.getDio(null);
//     try {
//       final response = await dio.get(
//         "$baseUrl$endPointRestaurantList",
//       );
//       if (response.statusCode == 200) {
//         print(response.data.toString());
//         return RestaurantModel.fromJson(response.data);
//       }
//       throw Exception('Failed to load response');
//     } on DioException catch (e) {
//       throw Exception(e.toString());
//     } catch (e) {
//       throw Exception(e.toString());
//     }
//   }
// }

//   /// 1.1
// //   Future<AuthResponse> login(String userName, String password) async {
// //     var data = {"email": userName, "password": password};
// //     var dio = DioUtil.getDio(null);
// //     try {
// //       final response = await dio
// //           .post("${ApiConstants.baseUrl}${ApiConstants.login}", data: data);
// //       if (response.statusCode == 200) {

// //         return AuthResponse.fromJson(response.data);
// //       }
// //       throw Exception('Failed to load response');
// //     } on DioException catch (e) {
// //       throw Exception(e.toString());
// //     } catch (e) {
// //       throw Exception(e.toString());
// //     }
// //   }

// //   /// 1.2
// //   Future<AuthResponse> register(String name, String phone, String email,
// //       String password, String photo, int isMember, int isAdmin) async {
// //     var data = {
// //       "name": name,
// //       "phone": phone,
// //       "email": email,
// //       "password": password,
// //       "photo": photo,
// //       "is_member": isMember,
// //       "is_admin": isAdmin
// //     };
// //     var dio = DioUtil.getDio(null);
// //     try {
// //       final response = await dio
// //           .post("${ApiConstants.baseUrl}${ApiConstants.register}", data: data);
// //       if (response.statusCode == 200) {
// //         return AuthResponse.fromJson(response.data);
// //       }
// //       throw Exception('Failed to load response');
// //     } on DioException catch (e) {
// //       throw Exception(e.toString());
// //     } catch (e) {
// //       throw Exception(e.toString());
// //     }
// //   }

// //   /// 1.3
// //   Future<AuthResponse> updateUser(
// //       int id,
// //       String name,
// //       String phone,
// //       String email,
// //       String password,
// //       String photo,
// //       int isMember,
// //       int isAdmin) async {
// //     var data = {
// //       "name": name,
// //       "phone": phone,
// //       "email": email,
// //       "password": password,
// //       "photo": photo,
// //       "is_member": isMember,
// //       "is_admin": isAdmin
// //     };
// //     var dio = DioUtil.getDio(null);
// //     try {
// //       final response = await dio.put(
// //           "${ApiConstants.baseUrl}${ApiConstants.updateUser}/$id",
// //           data: data);
// //       if (response.statusCode == 200) {
// //         return AuthResponse.fromJson(response.data);
// //       }
// //       throw Exception('Failed to load response');
// //     } on DioException catch (e) {
// //       throw Exception(e.toString());
// //     } catch (e) {
// //       throw Exception(e.toString());
// //     }
// //   }

// //   /// 1.4
// //   Future<AuthResponse> deleteUser(int id) async {
// //     var dio = DioUtil.getDio(null);
// //     try {
// //       final response = await dio.delete(
// //         "${ApiConstants.baseUrl}${ApiConstants.deleteUser}/$id",
// //       );
// //       if (response.statusCode == 200) {
// //         return AuthResponse.fromJson(response.data);
// //       }
// //       throw Exception('Failed to load response');
// //     } on DioException catch (e) {
// //       throw Exception(e.toString());
// //     } catch (e) {
// //       throw Exception(e.toString());
// //     }
// //   }

// //   /// 1.5
// //   Future<GetGymUsersResponse> getUsers() async {
// //     var dio = DioUtil.getDio(null);
// //     try {
// //       final response = await dio.get(
// //         "${ApiConstants.baseUrl}${ApiConstants.getUsers}",
// //       );
// //       if (response.statusCode == 200) {
// //         print(response.data.toString());
// //         return GetGymUsersResponse.fromJson(response.data);
// //       }
// //       throw Exception('Failed to load response');
// //     } on DioException catch (e) {
// //       throw Exception(e.toString());
// //     } catch (e) {
// //       throw Exception(e.toString());
// //     }
// //   }

// //   /// 2.1
// //   Future<CommonClassResponse> createClass(String name, String date, String time,
// //       String day, String youTubeLink) async {
// //     var data = {
// //       "name": name,
// //       "date": date,
// //       "time": time,
// //       "day": day,
// //       "youtube_link": youTubeLink
// //     };
// //     var dio = DioUtil.getDio(null);
// //     try {
// //       final response = await dio.post(
// //           "${ApiConstants.baseUrl}${ApiConstants.createClass}",
// //           data: data);
// //       if (response.statusCode == 200) {
// //         return CommonClassResponse.fromJson(response.data);
// //       }
// //       throw Exception('Failed to load response');
// //     } on DioException catch (e) {
// //       throw Exception(e.toString());
// //     } catch (e) {
// //       throw Exception(e.toString());
// //     }
// //   }

// //   /// 2.2
// //   Future<CommonClassResponse> updateClass(int id, String name, String date,
// //       String time, String day, String youTubeLink) async {
// //     var data = {
// //       "name": name,
// //       "date": date,
// //       "time": time,
// //       "day": day,
// //       "youtube_link": youTubeLink
// //     };
// //     var dio = DioUtil.getDio(null);
// //     try {
// //       final response = await dio.post(
// //           "${ApiConstants.baseUrl}${ApiConstants.updateClass}/$id",
// //           data: data);
// //       if (response.statusCode == 200) {
// //         return CommonClassResponse.fromJson(response.data);
// //       }
// //       throw Exception('Failed to load response');
// //     } on DioException catch (e) {
// //       throw Exception(e.toString());
// //     } catch (e) {
// //       throw Exception(e.toString());
// //     }
// //   }

// //   /// 2.3
// //   Future<CommonClassResponse> deleteClass(int id) async {
// //     var dio = DioUtil.getDio(null);
// //     try {
// //       final response = await dio.delete(
// //         "${ApiConstants.baseUrl}${ApiConstants.deleteClass}/$id",
// //       );
// //       if (response.statusCode == 200) {
// //         return CommonClassResponse.fromJson(response.data);
// //       }
// //       throw Exception('Failed to load response');
// //     } on DioException catch (e) {
// //       throw Exception(e.toString());
// //     } catch (e) {
// //       throw Exception(e.toString());
// //     }
// //   }

// //   /// 2.4
// //   Future<GetClassesResponse> getClasses() async {
// //     var dio = DioUtil.getDio(null);
// //     try {
// //       final response = await dio.get(
// //         "${ApiConstants.baseUrl}${ApiConstants.getClasses}",
// //       );
// //       if (response.statusCode == 200) {
// //         return GetClassesResponse.fromJson(response.data);
// //       }
// //       throw Exception('Failed to load response');
// //     } on DioException catch (e) {
// //       throw Exception(e.toString());
// //     } catch (e) {
// //       throw Exception(e.toString());
// //     }
// //   }

// //   /// 3.1
// //   Future<CommonMembershipTypeResponse> createMembershipType(String level,
// //       String plan, double price, String day, String youTubeLink) async {
// //     var data = {"level": level, "plan": plan, "price": price};
// //     var dio = DioUtil.getDio(null);
// //     try {
// //       final response = await dio.post(
// //           "${ApiConstants.baseUrl}${ApiConstants.createMembershipType}",
// //           data: data);
// //       if (response.statusCode == 200) {
// //         return CommonMembershipTypeResponse.fromJson(response.data);
// //       }
// //       throw Exception('Failed to load response');
// //     } on DioException catch (e) {
// //       throw Exception(e.toString());
// //     } catch (e) {
// //       throw Exception(e.toString());
// //     }
// //   }

// //   /// 3.2
// //   Future<CommonMembershipTypeResponse> updateMembershipType(
// //       int id,
// //       String level,
// //       String plan,
// //       double price,
// //       String day,
// //       String youTubeLink) async {
// //     var data = {"level": level, "plan": plan, "price": price};
// //     var dio = DioUtil.getDio(null);
// //     try {
// //       final response = await dio.post(
// //           "${ApiConstants.baseUrl}${ApiConstants.updateMembershipType}/$id",
// //           data: data);
// //       if (response.statusCode == 200) {
// //         return CommonMembershipTypeResponse.fromJson(response.data);
// //       }
// //       throw Exception('Failed to load response');
// //     } on DioException catch (e) {
// //       throw Exception(e.toString());
// //     } catch (e) {
// //       throw Exception(e.toString());
// //     }
// //   }

// //   /// 3.3
// //   Future<CommonMembershipTypeResponse> deleteMembershipType(int id) async {
// //     var dio = DioUtil.getDio(null);
// //     try {
// //       final response = await dio.delete(
// //         "${ApiConstants.baseUrl}${ApiConstants.deleteMembershipType}/$id",
// //       );
// //       if (response.statusCode == 200) {
// //         return CommonMembershipTypeResponse.fromJson(response.data);
// //       }
// //       throw Exception('Failed to load response');
// //     } on DioException catch (e) {
// //       throw Exception(e.toString());
// //     } catch (e) {
// //       throw Exception(e.toString());
// //     }
// //   }

// //   /// 3.4
// //   Future<GetMembershipTypesResponse> getMembershipTypes() async {
// //     var dio = DioUtil.getDio(null);
// //     try {
// //       final response = await dio.get(
// //         "${ApiConstants.baseUrl}${ApiConstants.getMembershipType}",
// //       );
// //       if (response.statusCode == 200) {
// //         return GetMembershipTypesResponse.fromJson(response.data);
// //       }
// //       throw Exception('Failed to load response');
// //     } on DioException catch (e) {
// //       throw Exception(e.toString());
// //     } catch (e) {
// //       throw Exception(e.toString());
// //     }
// //   }

// //   /// 4.1
// //   Future<CommonPaymentResponse> createPayment(int userId, bool buyClass,
// //       bool buyMembership, String paymentDate, double amount) async {
// //     var data = {
// //       "user_id": userId,
// //       "buy_class": buyClass,
// //       "buy_membership": buyMembership,
// //       "paymentDate": paymentDate,
// //       "amount": amount
// //     };
// //     var dio = DioUtil.getDio(null);
// //     try {
// //       final response = await dio.post(
// //           "${ApiConstants.baseUrl}${ApiConstants.createPayment}",
// //           data: data);
// //       if (response.statusCode == 200) {
// //         return CommonPaymentResponse.fromJson(response.data);
// //       }
// //       throw Exception('Failed to load response');
// //     } on DioException catch (e) {
// //       throw Exception(e.toString());
// //     } catch (e) {
// //       throw Exception(e.toString());
// //     }
// //   }

// //   /// 4.2
// //   Future<CommonPaymentResponse> deletePayment(int id) async {
// //     var dio = DioUtil.getDio(null);
// //     try {
// //       final response = await dio.delete(
// //         "${ApiConstants.baseUrl}${ApiConstants.deletePayment}/$id",
// //       );
// //       if (response.statusCode == 200) {
// //         return CommonPaymentResponse.fromJson(response.data);
// //       }
// //       throw Exception('Failed to load response');
// //     } on DioException catch (e) {
// //       throw Exception(e.toString());
// //     } catch (e) {
// //       throw Exception(e.toString());
// //     }
// //   }

// //   /// 4.3
// //   Future<GetPaymentsResponse> getPayment() async {
// //     var dio = DioUtil.getDio(null);
// //     try {
// //       final response = await dio.get(
// //         "${ApiConstants.baseUrl}${ApiConstants.getPayments}",
// //       );
// //       if (response.statusCode == 200) {
// //         return GetPaymentsResponse.fromJson(response.data);
// //       }
// //       throw Exception('Failed to load response');
// //     } on DioException catch (e) {
// //       throw Exception(e.toString());
// //     } catch (e) {
// //       throw Exception(e.toString());
// //     }
// //   }

// //   /// 5.1
// //   Future<CommonMembershipsResponse> createMembership(int userId,
// //       int membershipTypeID, String purchaseDate, String expiredDate) async {
// //     var data = {
// //       "user_id": userId,
// //       "membershiptype_id": membershipTypeID,
// //       "purchase_date": purchaseDate,
// //       "expired_date": expiredDate
// //     };
// //     var dio = DioUtil.getDio(null);
// //     try {
// //       final response = await dio.post(
// //           "${ApiConstants.baseUrl}${ApiConstants.createMembership}",
// //           data: data);
// //       if (response.statusCode == 200) {
// //         return CommonMembershipsResponse.fromJson(response.data);
// //       }
// //       throw Exception('Failed to load response');
// //     } on DioException catch (e) {
// //       throw Exception(e.toString());
// //     } catch (e) {
// //       throw Exception(e.toString());
// //     }
// //   }

// //   /// 5.2
// //   Future<CommonMembershipsResponse> updateMembership(int id, int userId,
// //       int membershipTypeID, String purchaseDate, String expiredDate) async {
// //     var data = {
// //       "user_id": userId,
// //       "membershiptype_id": membershipTypeID,
// //       "purchase_date": purchaseDate,
// //       "expired_date": expiredDate
// //     };
// //     var dio = DioUtil.getDio(null);
// //     try {
// //       final response = await dio.post(
// //           "${ApiConstants.baseUrl}${ApiConstants.updateMembership}/$id",
// //           data: data);
// //       if (response.statusCode == 200) {
// //         return CommonMembershipsResponse.fromJson(response.data);
// //       }
// //       throw Exception('Failed to load response');
// //     } on DioException catch (e) {
// //       throw Exception(e.toString());
// //     } catch (e) {
// //       throw Exception(e.toString());
// //     }
// //   }

// //   /// 5.3
// //   Future<CommonMembershipsResponse> deleteMembership(int id) async {
// //     var dio = DioUtil.getDio(null);
// //     try {
// //       final response = await dio.delete(
// //         "${ApiConstants.baseUrl}${ApiConstants.deleteMembership}/$id",
// //       );
// //       if (response.statusCode == 200) {
// //         return CommonMembershipsResponse.fromJson(response.data);
// //       }
// //       throw Exception('Failed to load response');
// //     } on DioException catch (e) {
// //       throw Exception(e.toString());
// //     } catch (e) {
// //       throw Exception(e.toString());
// //     }
// //   }

// //   /// 5.4
// //   Future<GetMembershipsResponse> getMemberships() async {
// //     var dio = DioUtil.getDio(null);
// //     try {
// //       final response = await dio.get(
// //         "${ApiConstants.baseUrl}${ApiConstants.getMembership}",
// //       );
// //       if (response.statusCode == 200) {
// //         return GetMembershipsResponse.fromJson(response.data);
// //       }
// //       throw Exception('Failed to load response');
// //     } on DioException catch (e) {
// //       throw Exception(e.toString());
// //     } catch (e) {
// //       throw Exception(e.toString());
// //     }
// //   }

// //   /// 6.1
// //   Future<CommonUserClassesResponse> createUserClass(
// //       int userId, int classId) async {
// //     var data = {"user_id": userId, "class_id": classId};
// //     var dio = DioUtil.getDio(null);
// //     try {
// //       final response = await dio.post(
// //           "${ApiConstants.baseUrl}${ApiConstants.createUserClass}",
// //           data: data);
// //       if (response.statusCode == 200) {
// //         return CommonUserClassesResponse.fromJson(response.data);
// //       }
// //       throw Exception('Failed to load response');
// //     } on DioException catch (e) {
// //       throw Exception(e.toString());
// //     } catch (e) {
// //       throw Exception(e.toString());
// //     }
// //   }

// //   /// 6.2
// //   Future<CommonUserClassesResponse> updateUserClass(
// //       int id, int userId, int classId) async {
// //     var data = {"user_id": userId, "class_id": classId};
// //     var dio = DioUtil.getDio(null);
// //     try {
// //       final response = await dio.post(
// //           "${ApiConstants.baseUrl}${ApiConstants.updateUserClass}/$id",
// //           data: data);
// //       if (response.statusCode == 200) {
// //         return CommonUserClassesResponse.fromJson(response.data);
// //       }
// //       throw Exception('Failed to load response');
// //     } on DioException catch (e) {
// //       throw Exception(e.toString());
// //     } catch (e) {
// //       throw Exception(e.toString());
// //     }
// //   }

// //   /// 6.3
// //   Future<CommonUserClassesResponse> deleteUserClass(int id) async {
// //     var dio = DioUtil.getDio(null);
// //     try {
// //       final response = await dio.delete(
// //         "${ApiConstants.baseUrl}${ApiConstants.deleteUserClass}/$id",
// //       );
// //       if (response.statusCode == 200) {
// //         return CommonUserClassesResponse.fromJson(response.data);
// //       }
// //       throw Exception('Failed to load response');
// //     } on DioException catch (e) {
// //       throw Exception(e.toString());
// //     } catch (e) {
// //       throw Exception(e.toString());
// //     }
// //   }

// //   /// 6.4
// //   Future<GetUserClassesResponse> getUserClasses() async {
// //     var dio = DioUtil.getDio(null);
// //     try {
// //       final response = await dio.get(
// //         "${ApiConstants.baseUrl}${ApiConstants.getUserClass}",
// //       );
// //       if (response.statusCode == 200) {
// //         return GetUserClassesResponse.fromJson(response.data);
// //       }
// //       throw Exception('Failed to load response');
// //     } on DioException catch (e) {
// //       throw Exception(e.toString());
// //     } catch (e) {
// //       throw Exception(e.toString());
// //     }
// //   }
// // }
