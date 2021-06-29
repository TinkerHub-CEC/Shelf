class EventData {
  int? id;
  String? title;
  String? startDatetime;
  String? endDatetime;
  String? location;
  int? maxParticipants;
  String? shortDescription;
  String? longDescription;
  String? regOpenDate;
  String? regCloseDate;
  String? poster;

  EventData(
      {this.id,
      this.title,
      this.startDatetime,
      this.endDatetime,
      this.location,
      this.maxParticipants,
      this.shortDescription,
      this.longDescription,
      this.regOpenDate,
      this.regCloseDate,
      this.poster});

  EventData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    startDatetime = json['start_datetime'];
    endDatetime = json['end_datetime'];
    location = json['location'];
    maxParticipants = json['max_participants'];
    shortDescription = json['short_description'];
    longDescription = json['long_description'];
    regOpenDate = json['reg_open_date'];
    regCloseDate = json['reg_close_date'];
    poster = json['poster'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['start_datetime'] = this.startDatetime;
    data['end_datetime'] = this.endDatetime;
    data['location'] = this.location;
    data['max_participants'] = this.maxParticipants;
    data['short_description'] = this.shortDescription;
    data['long_description'] = this.longDescription;
    data['reg_open_date'] = this.regOpenDate;
    data['reg_close_date'] = this.regCloseDate;
    data['poster'] = this.poster;
    return data;
  }
}
