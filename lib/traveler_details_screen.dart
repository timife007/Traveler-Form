import 'package:flutter/material.dart';
import 'package:traveller_form/main.dart';

class TravelerDetail extends StatelessWidget {
  const TravelerDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final travelerInfo =
        ModalRoute.of(context)!.settings.arguments as TravelerInfo;
    var addOn = '';
    for (var element in travelerInfo.addOns) {
      addOn += '$element,';
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            'State Fly',
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                    padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
                    child: Text("Traveler's Information",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0))),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
                    child: Text(
                      'Full Name: ${travelerInfo.fullName}',
                      textAlign: TextAlign.start,
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
                    child: Text(
                      "Age:${travelerInfo.age}",
                      textAlign: TextAlign.start,
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
                    child: Text(
                      "Passport Number:${travelerInfo.passportNo}",
                      textAlign: TextAlign.start,
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
                    child: Text(
                      "Address: ${travelerInfo.address}",
                      textAlign: TextAlign.start,
                    ))
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                    padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
                    child: Text("Travel Add-Ons",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0))),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
                    child: Text(
                      addOn,
                      textAlign: TextAlign.start,
                    )),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                    padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
                    child: Text("Promo Code",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0))),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
                    child: Text(
                      travelerInfo.promoCode,
                      textAlign: TextAlign.start,
                    )),
              ],
            )
          ],
        ));
  }
}
