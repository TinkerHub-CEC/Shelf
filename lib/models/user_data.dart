class UserData {
  String? firstName;
  String? lastName;
  String? rollNo;
  String? semester;
  String? batch;
  String? username;
  String? email;
  String? password;

  UserData(
      {this.firstName,
      this.lastName,
      this.rollNo,
      this.semester,
      this.batch,
      this.username,
      this.email,
      this.password});

  UserData.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    rollNo = json['roll_no'];
    semester = json['semester'];
    batch = json['batch'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['roll_no'] = this.rollNo;
    data['semester'] = this.semester;
    data['batch'] = this.batch;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
