// ignore_for_file: file_names

import 'dart:convert';

GetBaseResponse getBaseResponseFromJson(String str) =>
    GetBaseResponse.fromJson(json.decode(str));

String getBaseResponseToJson(GetBaseResponse data) =>
    json.encode(data.toJson());

class GetBaseResponse {
  GetBaseResponse({
    this.status,
    this.code,
    this.total,
    this.message,
    this.data,
    this.raw,
  });

  String? status;
  int? code;
  int? total;
  String? message;
  dynamic data;
  dynamic raw;

  factory GetBaseResponse.fromJson(json) => GetBaseResponse(
        status: json["status"],
        code: json["code"],
        total: json["total"],
        message: json["message"],
        data: json["data"],
        raw: json,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "total": total,
        "message": message,
        "data": data,
        "raw": raw,
      };
}
