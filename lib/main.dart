import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveller_form/travelerState.dart';
import 'package:traveller_form/traveler_form_screen.dart';

class TravelerInfo {
  final String fullName;
  final String age;
  final String address;
  final List<String> addOns;
  final String passportNo;
  final String promoCode;

  const TravelerInfo(this.fullName, this.age, this.passportNo, this.address,
      this.addOns, this.promoCode);
}

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TravelerState(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text(
              'State Fly',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: const Center(
            child: TravellersForm(),
          ),
        ),
      ),
    );
  }
}
