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
  int? _officerIdStore;
  int? get getOfficerIdStore => _officerIdStore;
  int? _officerIdUpdate;
  int? get getOfficerIdUpdate => _officerIdUpdate;
  int? _violationTypesId;
  int? get getViolationTypesId => _violationTypesId;

  TextEditingController studentController = TextEditingController();
  TextEditingController officerControllerStore = TextEditingController();
  TextEditingController officerControllerUpdate = TextEditingController();
  TextEditingController violationTypesController = TextEditingController();

  Future<void> setStudentId(int? id) async {
    _studentId = id;
    notifyListeners();
  }

  Future<void> setOfficerIdStore(int? id) async {
    _officerIdStore = id;
    notifyListeners();
  }

  Future<void> setOfficerIdUpdate(int? id) async {
    _officerIdUpdate = id;
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

  void setOfficerControllerStore(String value) {
    officerControllerStore.text = value;
    notifyListeners();
  }

  void setOfficerControllerUpdate(String value) {
    officerControllerUpdate.text = value;
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
