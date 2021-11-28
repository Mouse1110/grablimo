class UserOTD {
  String id;
  String name;
  String pass;
  String phone;
  UserOTD({this.name, this.pass, this.phone});

  UserOTD.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['_id'],
        pass = json['pass'],
        phone = json['phone'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'pass': pass,
        'phone': phone,
      };
}
