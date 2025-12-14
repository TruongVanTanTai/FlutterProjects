import 'package:dio/dio.dart';
import 'package:flutter_application_10/model/token.dart';
import 'package:flutter_application_10/model/user.dart';

class Api {
  Future<Token?> getToken(
    String? username,
    String? password,
    int expiresInMins,
  ) async {
    var headers = {"Content-Type": "application/json"};
    var data = {
      "username": username,
      "password": password,
      "expiresInMins": expiresInMins,
    };

    var dio = Dio();
    try {
      var response = await dio.request(
        "https://dummyjson.com/auth/login",
        options: Options(method: "POST", headers: headers),
        data: data,
      );

      if (response.statusCode == 200) {
        return Token.fromJson(response.data);
      } else {
        print(response.statusMessage);
      }
    } on DioException catch (e, stackTrace) {
      //print("Error: $e");
      //print("Error at: $stackTrace");
    }
    return null;
  }

  Future<User?> getUser(String accessToken) async {
    var headers = {"Authorization": "Bearer $accessToken"};

    var dio = Dio();
    try {
      var response = await dio.request(
        "https://dummyjson.com/auth/me",
        options: Options(method: "GET", headers: headers),
      );

      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        print(response.statusMessage);
      }
    } on DioException catch (e) {
      print(e);
    }
    return null;
  }
}
