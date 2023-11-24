class Reviews {
  String? user;
  String? name;
  String? comment;
  String? sId;

  Reviews({this.user, this.name, this.comment, this.sId});

  Reviews.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    name = json['name'];
    comment = json['comment'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['name'] = this.name;
    data['comment'] = this.comment;
    data['_id'] = this.sId;
    return data;
  }
}
