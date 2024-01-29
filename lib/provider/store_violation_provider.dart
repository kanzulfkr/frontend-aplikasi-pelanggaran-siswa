import 'package:flutter/material.dart';

import '../../data/datasources/search_remote_datasources.dart';

enum SearchProviderStatus { empty, loading, success, error }

class StoreViolationProvider extends ChangeNotifier {
  List<dynamic> _searchStudent = [];
  List<dynamic> get allStudent => _searchStudent;
  List<dynamic> _searchViolationTypes = [];
  List<dynamic> get allViolationTypes => _searchViolationTypes;

  int? _studentId;
  int? get getStudentId => _studentId;
  int? _officerId;
  int? get getOfficerId => _officerId;
  int? _violationTypesId;
  int? get getViolationTypesId => _violationTypesId;

  TextEditingController studentController = TextEditingController();
  TextEditingController officerController = TextEditingController();
  TextEditingController violationTypesController = TextEditingController();

  Future<void> setStudentId(int? id) async {
    _studentId = id;
    notifyListeners();
  }

  Future<void> setOfficerId(int? id) async {
    _officerId = id;
    notifyListeners();
  }

  Future<void> setViolationTypesId(int? id) async {
    _violationTypesId = id;
    notifyListeners();
  }

  void setStudentController(String value) {
    studentController.text = value;
    notifyListeners();
  }

  void setOfficerController(String value) {
    officerController.text = value;
    notifyListeners();
  }

  void setViolationTypesController(String value) {
    violationTypesController.text = value;
    notifyListeners();
  }

  Future<void> getSearchStudent() async {
    var response = await SearchRemoteDataSources().getAllStudents();
    _searchStudent = response['student'];
    notifyListeners();
  }

  Future<void> getSearchViolationTypes() async {
    var response = await SearchRemoteDataSources().getAllViolationTypes();
    _searchViolationTypes = response['violation-types'];
    notifyListeners();
  }
}
