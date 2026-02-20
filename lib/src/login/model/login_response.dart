class LoginResponse {
  String? token;
  String? role;
  List<String>? permissions;
  User? user;

  LoginResponse({this.token, this.role, this.permissions, this.user});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    role = json['role'];
    permissions = json['permissions'] != null
        ? List<String>.from(json['permissions'] as List)
        : null;
    user = json['user'] != null
        ? User.fromJson(json['user'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['role'] = role;
    data['permissions'] = permissions;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? name;
  String? email;
  String? role;
  String? employeeId;

  User({this.id, this.name, this.email, this.role, this.employeeId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    employeeId = json['employeeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['role'] = role;
    data['employeeId'] = employeeId;
    return data;
  }
}
