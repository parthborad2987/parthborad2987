class UserDetail{
  String? Name;
  String? Email;
  String? photoUrl;

  UserDetail({this.Name,this.Email,this.photoUrl});

  UserDetail.fromJson(Map<String,dynamic> json) {
    Name = json['Name'];
    Email = json['Email'];
    photoUrl = json['photourl'];
  }
  Map<String,dynamic> toJson() {
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['Name'] = this.Name;
    data['Email'] = this.Email;
    data['photourl'] = this.photoUrl;

    return data;
  }
}