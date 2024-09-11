

import 'dart:convert';

List<UserdataResponse> userdataResponseFromJson(String str) => List<UserdataResponse>.from(json.decode(str).map((x) => UserdataResponse.fromJson(x)));


class UserdataResponse {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  UserdataResponse({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory UserdataResponse.fromJson(Map<String, dynamic> json) => UserdataResponse(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

}
