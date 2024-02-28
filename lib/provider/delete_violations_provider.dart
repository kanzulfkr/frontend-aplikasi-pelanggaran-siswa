import 'package:flutter/material.dart';
import 'package:frontend_aps/data/datasources/violation_remote_datasources.dart';

enum UpdateStatus { empty, loading, success, error }

class DeleteViolationProvider extends ChangeNotifier {
  UpdateStatus _updateStatus = UpdateStatus.empty;
  UpdateStatus get updateStatus => _updateStatus;

  Future<void> deleteViolation(int id) async {
    _updateStatus = UpdateStatus.loading;
    notifyListeners();
    try {
      await ViolationRemoteDataSources().deleteViolation(id);
      _updateStatus = UpdateStatus.success;
      notifyListeners();
    } catch (e) {
      print('Error : $e');
      _updateStatus = UpdateStatus.error;
      notifyListeners();
    }
  }

  Future<void> validateViolation(int id, String isValidate) async {
    _updateStatus = UpdateStatus.loading;
    notifyListeners();
    try {
      await ViolationRemoteDataSources().validateViolation(id, isValidate);
      _updateStatus = UpdateStatus.success;
      notifyListeners();
    } catch (e) {
      print('Error : $e');
      _updateStatus = UpdateStatus.error;
      notifyListeners();
    }
  }

  Future<void> confirmViolation(int id, String isConfirm) async {
    _updateStatus = UpdateStatus.loading;
    notifyListeners();
    try {
      await ViolationRemoteDataSources().confirmViolation(id, isConfirm);
      _updateStatus = UpdateStatus.success;
      notifyListeners();
    } catch (e) {
      print('Error : $e');
      _updateStatus = UpdateStatus.error;
      notifyListeners();
    }
  }
}
