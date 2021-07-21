class UserModel {
    int? id;
    String? password;
    String? username;
    String? email;

    UserModel({this.id, this.password, this.username, this.email});

    factory UserModel.fromJson(Map<String, dynamic> json) {
        return UserModel(
            id: json['id'],
            password: json['password'],
            username: json['username'],
            email: json['email'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['password'] = this.password;
        data['username'] = this.username;
        data['email'] = this.email;
        return data;
    }
}