import 'package:dartz/dartz.dart';
import 'package:frontend_aps/data/models/response/violation_response_models.dart';
import 'package:http/http.dart' as http;
import '../../common/constant/variable.dart';
import '../models/request/violation_request_models.dart';
import '../models/request/violation_update_request_models.dart';
import 'auth_local_datasources.dart';

class ViolationRemoteDataSources {
  Future<Either<String, ViolationsResponseModel>> getViolation() async {
    final loginToken = await AuthLocalDataSources().getToken();

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $loginToken',
    };

    const baseUrl = "${Variables.baseUrl}/api/violations";

    final response = await http.get(
      Uri.parse(baseUrl),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return Right(ViolationsResponseModel.fromJson(response.body));
    } else {
      return const Left("Failed fetching violations");
    }
  }

  Future<Either<String, ViolationRequestModel>> storeViolation(
      ViolationRequestModel requestModels) async {
    final loginToken = await AuthLocalDataSources().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $loginToken',
    };

    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/violations/store'),
      headers: headers,
      body: requestModels.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(ViolationRequestModel.fromJson(response.body));
    } else if (response.statusCode == 422) {
      return const Left(
          'Data yang anda masukkan tidak dapat diproses, harap coba kembali dalam beberapa saat!');
    } else if (response.statusCode == 401) {
      return const Left('Unauthenticated');
    } else {
      return const Left(
          'Server error, harap coba kembali dalam beberapa saat!');
    }
  }

  Future<Either<String, ViolationUpdateRequestModel>> updateViolation(
      ViolationUpdateRequestModel requestModels) async {
    final loginToken = await AuthLocalDataSources().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $loginToken',
    };

    final response = await http.put(
      Uri.parse(
          '${Variables.baseUrl}/api/violations/update/${requestModels.id}/'),
      headers: headers,
      body: requestModels.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(ViolationUpdateRequestModel.fromJson(response.body));
    } else if (response.statusCode == 422) {
      return const Left(
          'Data yang anda masukkan tidak dapat diproses, harap coba kembali dalam beberapa saat!');
    } else if (response.statusCode == 401) {
      return const Left('Unauthenticated');
    } else {
      return const Left(
          'Server error, harap coba kembali dalam beberapa saat!');
    }
  }

  Future<String> validateViolation(int id, String isValidate) async {
    final loginToken = await AuthLocalDataSources().getToken();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $loginToken',
    };
    final body = {
      'is_validate': isValidate,
    };

    final response = await http.put(
      Uri.parse('${Variables.baseUrl}/api/violations/validation/$id'),
      headers: headers,
      body: body,
    );
    return response.body;
  }

  Future<String> confirmViolation(int id, String isConfirm) async {
    final loginToken = await AuthLocalDataSources().getToken();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $loginToken',
    };
    final body = {
      'is_confirm': isConfirm,
    };

    final response = await http.put(
      Uri.parse('${Variables.baseUrl}/api/violations/confirmation/$id'),
      headers: headers,
      body: body,
    );
    return response.body;
  }

  Future<String> deleteViolation(int id) async {
    final loginToken = await AuthLocalDataSources().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $loginToken',
    };

    final response = await http.delete(
      Uri.parse('${Variables.baseUrl}/api/violations/delete/$id'),
      headers: headers,
    );
    return response.body;
  }
}
