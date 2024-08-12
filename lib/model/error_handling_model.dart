import 'dart:convert';

ErrorHandlingModel errorHandlingModelFromJson(String str) =>
    ErrorHandlingModel.fromJson(json.decode(str));

String errorHandlingModelToJson(ErrorHandlingModel data) =>
    json.encode(data.toJson());

class ErrorHandlingModel {
  ErrorHandlingModel({
    required this.timestamp,
    required this.status,
    required this.error,
    required this.message,
    required this.path,
  });

  String timestamp;
  dynamic status;
  dynamic error;
  String message;
  dynamic path;

  factory ErrorHandlingModel.fromJson(Map<String, dynamic> json) =>
      ErrorHandlingModel(
        timestamp: json["timestamp"],
        status: json["status"],
        error: json["error"],
        message: json["message"],
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "status": status,
        "error": error,
        "message": message,
        "path": path,
      };
}
