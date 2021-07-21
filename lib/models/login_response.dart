import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(jsonDecode(str));
String loginResponseToJson(LoginResponse data) => jsonEncode(data.toJson());
class LoginResponse {
    int id;
    String token;

    LoginResponse({required this.id, required this.token});

    factory LoginResponse.fromJson(Map<String, dynamic> json) {
        return LoginResponse(
            id: json['id'], 
            token: json['token'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['token'] = this.token;
        return data;
    }
}