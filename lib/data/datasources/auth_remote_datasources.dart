import 'package:frontend_aps/common/constant/variable.dart';
import 'package:frontend_aps/data/datasources/auth_local_datasources.dart';
import 'package:frontend_aps/data/models/request/auth_request_models.dart';
import 'package:frontend_aps/data/models/response/auth_response_models.dart';
import 'package:frontend_aps/data/models/response/user_response_models.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import 'dart:convert';

class AuthRemoteDataSources {
  Future<Either<String, AuthResponseModels>> login(
      AuthRequestModels requestModels) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };

    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/auth/login'),
      headers: headers,
      body: requestModels.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModels.fromJson(response.body));
    } else if (response.statusCode == 422) {
      Map<String, dynamic> responseBody = json.decode(response.body);
      if (responseBody.containsKey('errors')) {
        Map<String, dynamic> errors = responseBody['errors'];
        if (errors.containsKey('email')) {
          return const Left('Email salah, harap masukkan data dengan benar!');
        } else if (errors.containsKey('password')) {
          return const Left(
              'Password salah, harap masukkan data dengan benar!');
        }
      }
      return const Left(
          'Data yang anda masukkan tidak dapat diproses, harap hubungi administrator !');
    } else {
      return const Left('Server error, please back again !');
    }
  }

  Future<Either<String, String>> logout() async {
    final loginToken = await AuthLocalDataSources().getToken();

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $loginToken',
    };
    const baseUrl = "${Variables.baseUrl}/api/auth/logout";

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return const Right('Logout Successfully');
    } else {
      return const Left('Logout Failed');
    }
  }

  Future<Either<String, UserProfileResponseModel>> getUserProfile() async {
    final loginToken = await AuthLocalDataSources().getToken();

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $loginToken',
    };

    const baseUrl = "${Variables.baseUrl}/api/user";

    final response = await http.get(
      Uri.parse(baseUrl),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return Right(UserProfileResponseModel.fromJson(response.body));
    } else {
      return const Left("Failed fetching user profile");
    }
  }
}
