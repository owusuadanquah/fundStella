import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _projectGoal = prefs.getInt('ff_projectGoal') ?? _projectGoal;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _explore = true;
  bool get explore => _explore;
  set explore(bool value) {
    _explore = value;
  }

  bool _history = false;
  bool get history => _history;
  set history(bool value) {
    _history = value;
  }

  bool _notification = false;
  bool get notification => _notification;
  set notification(bool value) {
    _notification = value;
  }

  bool _profile = false;
  bool get profile => _profile;
  set profile(bool value) {
    _profile = value;
  }

  int _projectNumber = 0;
  int get projectNumber => _projectNumber;
  set projectNumber(int value) {
    _projectNumber = value;
  }

  int _projectGoal = 0;
  int get projectGoal => _projectGoal;
  set projectGoal(int value) {
    _projectGoal = value;
    prefs.setInt('ff_projectGoal', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
