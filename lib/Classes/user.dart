import 'package:flutter/foundation.dart';

class User with ChangeNotifier {
  String _name = 'Romain Floriani';
  String _bio =
      "Salut a tous les amis c'est David Lafarge Pokemon opening adaiofa aofafna angagiapagn oagnaogangoa agoaonga";
  String _username = 'Nyzart';
  int _publicationsNumber = 4;
  int _likedPostedPicturesNumber = 0;
  int _likedPicturesNumber = 0;

  String get name => _name;
  String get username => _username;
  String get bio => _bio;
  int get publicationsNumber => _publicationsNumber;
  int get likedPostedPicturesNumber => _likedPostedPicturesNumber;
  int get likedPicturesNumber => _likedPicturesNumber;

  set name(String name) {
    _name = name;
    notifyListeners();
  }

  set username(String username) {
    _username = username;
    notifyListeners();
  }

  set bio(String bio) {
    _bio = bio;
    notifyListeners();
  }

  set publicationsNumber(int publicationsNumber) {
    _publicationsNumber = publicationsNumber;
    notifyListeners();
  }

  set likedPostedPicturesNumber(int number) {
    _likedPostedPicturesNumber = number;
    notifyListeners();
  }

  set likedPicturesNumber(int number) {
    _likedPicturesNumber = number;
    notifyListeners();
  }
}
