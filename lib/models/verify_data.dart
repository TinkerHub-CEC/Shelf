// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    @required this.id,
    @required this.firstName,
    @required this.lastName,
    @required this.semester,
    @required this.batch,
    @required this.photosubmission,
    @required this.user,
    @required this.attendance,
  });

  final int? id;
  final String? firstName;
  final String? lastName;
  final String? semester;
  final String? batch;
  final String? photosubmission;
  final int? user;
  final int? attendance;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["id"] == null ? null : json["id"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        semester: json["semester"] == null ? null : json["semester"],
        batch: json["batch"] == null ? null : json["batch"],
        photosubmission:
            json["photosubmission"] == null ? null : json["photosubmission"],
        user: json["user"] == null ? null : json["user"],
        attendance: json["attendance"] == null ? null : json["attendance"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "semester": semester == null ? null : semester,
        "batch": batch == null ? null : batch,
        "photosubmission": photosubmission == null ? null : photosubmission,
        "user": user == null ? null : user,
        "attendance": attendance == null ? null : attendance,
      };
}
