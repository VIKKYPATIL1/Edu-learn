import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<String> _PlayListIDsLocal = [];
  List<String> get PlayListIDsLocal => _PlayListIDsLocal;
  set PlayListIDsLocal(List<String> value) {
    _PlayListIDsLocal = value;
  }

  void addToPlayListIDsLocal(String value) {
    PlayListIDsLocal.add(value);
  }

  void removeFromPlayListIDsLocal(String value) {
    PlayListIDsLocal.remove(value);
  }

  void removeAtIndexFromPlayListIDsLocal(int index) {
    PlayListIDsLocal.removeAt(index);
  }

  void updatePlayListIDsLocalAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    PlayListIDsLocal[index] = updateFn(_PlayListIDsLocal[index]);
  }

  void insertAtIndexInPlayListIDsLocal(int index, String value) {
    PlayListIDsLocal.insert(index, value);
  }

  bool _CheckSubjectSelected = false;
  bool get CheckSubjectSelected => _CheckSubjectSelected;
  set CheckSubjectSelected(bool value) {
    _CheckSubjectSelected = value;
  }

  bool _IsNotesSearch = false;
  bool get IsNotesSearch => _IsNotesSearch;
  set IsNotesSearch(bool value) {
    _IsNotesSearch = value;
  }

  String _filterSubject = '';
  String get filterSubject => _filterSubject;
  set filterSubject(String value) {
    _filterSubject = value;
  }

  List<String> _filterSubjectButtonValue = [];
  List<String> get filterSubjectButtonValue => _filterSubjectButtonValue;
  set filterSubjectButtonValue(List<String> value) {
    _filterSubjectButtonValue = value;
  }

  void addToFilterSubjectButtonValue(String value) {
    filterSubjectButtonValue.add(value);
  }

  void removeFromFilterSubjectButtonValue(String value) {
    filterSubjectButtonValue.remove(value);
  }

  void removeAtIndexFromFilterSubjectButtonValue(int index) {
    filterSubjectButtonValue.removeAt(index);
  }

  void updateFilterSubjectButtonValueAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    filterSubjectButtonValue[index] =
        updateFn(_filterSubjectButtonValue[index]);
  }

  void insertAtIndexInFilterSubjectButtonValue(int index, String value) {
    filterSubjectButtonValue.insert(index, value);
  }

  bool _toggleLike = false;
  bool get toggleLike => _toggleLike;
  set toggleLike(bool value) {
    _toggleLike = value;
  }

  bool _searchButtonClick = false;
  bool get searchButtonClick => _searchButtonClick;
  set searchButtonClick(bool value) {
    _searchButtonClick = value;
  }

  bool _isNotesPageLoad = false;
  bool get isNotesPageLoad => _isNotesPageLoad;
  set isNotesPageLoad(bool value) {
    _isNotesPageLoad = value;
  }
}
