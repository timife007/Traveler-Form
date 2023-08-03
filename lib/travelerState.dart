// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TravelerState extends ChangeNotifier {
  String fullName = '';
  String age = '';
  String passportNo = '';
  String address = '';
  String promoCode = '';
  Option coffee = Option('Coffee', false);
  Option internet = Option('Internet', false);
  Option lounge = Option('Lounge', false);
  Option shopping = Option('Shopping', false);
  Option cancellation = Option('Cancellation', false);
  List<String> options = [];

  void getOptions() {
    List<Option> optionList = [
      coffee,
      internet,
      lounge,
      shopping,
      cancellation
    ];
    for (var element in optionList) {
      if (element.isSelected) {
        if (!options.contains(element.item)) {
          options.add(element.item);
        }
      } else {
        if (options.contains(element.item)) {
          options.remove(element.item);
        }
      }
    }
    notifyListeners();
  }

  void updateFullName(String name) {
    fullName = name;
    notifyListeners();
  }

  void updateAge(String newAge) {
    age = newAge;
    notifyListeners();
  }

  void updatePassport(String passport) {
    passportNo = passport;
    notifyListeners();
  }

  void updateAddress(String newAddress) {
    address = newAddress;
    notifyListeners();
  }

  void updatePromocode(String newPromo) {
    promoCode = newPromo;
    notifyListeners();
  }

  void updateCoffee(bool isCoffee) {
    coffee = Option('Coffee', isCoffee);
    notifyListeners();
  }

  void updateInternet(bool isInternet) {
    internet = Option('Internet', isInternet);
    notifyListeners();
  }

  void updateLounge(bool isLounge) {
    lounge = Option('Lounge', isLounge);
    notifyListeners();
  }

  void updateShopping(bool isShopping) {
    shopping = Option('Shopping', isShopping);
    notifyListeners();
  }
}

class Option {
  bool isSelected;
  String item;
  Option(
    this.item,
    this.isSelected,
  );
}
