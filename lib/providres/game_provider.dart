import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  int _value1 = 0;
  int _value2 = 0;
  String _player1 = 'P 1';
  String _player2 = 'P 2';
  int _finalCounter = 0;


  int get value1 => _value1;
  int get value2 => _value2;
  String get player1 => _player1;
  String get player2 => _player2;
  int get finalCounter => _finalCounter;


  void add1() {
    _value1++;
    notifyListeners();
  }

  void add2() {
    _value2++;
    notifyListeners();
  }

  void remove1() {
    if (_value1 > 0) {
      _value1--;
      notifyListeners();
    }
  }

  void remove2() {
    if (_value2 > 0) {
      _value2--;
      notifyListeners();
    }
  }

  void reset() {
    _value1 = 0;
    _value2 = 0;
    notifyListeners();
  }

  void resetAll() {
    _value1 = 0;
    _value2 = 0;
    _player1 = 'P 1';
    _player2 = 'P 2';
    _finalCounter = 0;
    notifyListeners();
  }

  void setPlayer1(String name) {
    _player1 = name;
    notifyListeners();
  }

  void setPlayer2(String name) {
    _player2 = name;
    notifyListeners();
  }

  void setFinalCounter(int value) {
    _finalCounter = value;
    notifyListeners();
  }

  bool checkWinner(int value) {
    return value == _finalCounter && _finalCounter > 0;
  }

  String? getWinner() {
    if (checkWinner(_value1)) return _player1;
    if (checkWinner(_value2)) return _player2;
    return null;
  }
}