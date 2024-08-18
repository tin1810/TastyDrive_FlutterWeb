import 'package:tasty_drive_website/model/error_handling_model.dart';

typedef DynamicMap = Map<String, dynamic>;
typedef ErrorRequestFunction = Function(ErrorHandlingModel? response);
typedef ServerAndTimeoutErrorFunction = Function(dynamic response)?;

enum OrderStatus {
  Pending,
  OnGoing,
  Completed,
}
