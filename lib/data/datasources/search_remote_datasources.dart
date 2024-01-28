import 'dart:convert';

import 'package:frontend_aps/common/constant/variable.dart';
import 'package:http/http.dart' as http;

class SearchRemoteDataSources {
  Future<dynamic> getAllStudents() async {
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/student'),
    );

    final Map<String, dynamic> jsonResponse = json.decode(response.body);

    return jsonResponse;
  }

  Future<dynamic> getAllViolationTypes() async {
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/violations-types'),
    );

    final Map<String, dynamic> jsonResponse = json.decode(response.body);

    return jsonResponse;
  }
}
