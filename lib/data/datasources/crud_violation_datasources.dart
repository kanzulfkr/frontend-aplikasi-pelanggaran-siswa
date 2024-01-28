import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:frontend_aps/data/models/response/crud_students_response_models.dart';

import '../../common/constant/variable.dart';

// class CRUDViolationDatasources {
//   Future<List<StudentsResponseModel>> getAllStudents() async {
//     const baseUrl = "${Variables.baseUrl}/api/student";

//     final response = await http.get(Uri.parse(baseUrl));

//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       return data.map((json) => StudentsResponseModel.fromJson(json)).toList();

//       return Right(UserProfileResponseModel.fromJson(response.body));

//     } else {
//       throw Exception('Failed to load Student from API');
//     }
//   }
// }
