import 'package:dartz/dartz.dart';
import 'package:frontend_aps/data/models/response/violation_response_models.dart';
import 'package:http/http.dart' as http;
import '../../common/constant/variable.dart';
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
}
