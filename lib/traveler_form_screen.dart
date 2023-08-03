import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveller_form/main.dart';
import 'package:traveller_form/travelerState.dart';
import 'package:traveller_form/traveler_details_screen.dart';

class TravellersForm extends StatelessWidget {
  const TravellersForm({super.key});
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<TravelerState>(context);
    return ListView(
      children: <Widget>[
        const Padding(
            padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
            child: Text("Traveler's Information",
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0))),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), label: Text('Full Name')),
            textAlign: TextAlign.start,
            onChanged: (value) => state.updateFullName(value),
          ),
        ),
        // )),
        const SizedBox(height: 10), // Add spacing between TextFields
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text('Age')),
                    onChanged: (value) => state.updateAge(value),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Passport Number')),
                    onChanged: (value) => state.updatePassport(value),
                  ),
                ))
          ],
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), label: Text('Address')),
            textAlign: TextAlign.start,
            onChanged: (value) => state.updateAddress(value),
          ),
        ),
        const SizedBox(height: 10),
        const Padding(
            padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
            child: Text("Travel Add-ons",
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0))),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: state.coffee.isSelected
                            ? Colors.green
                            : Colors.transparent, // Set the background color
                        shape: BoxShape.rectangle
                        // Optionally set the shape
                        ),
                    child: Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.coffee_maker),
                          isSelected: state.coffee.isSelected,
                          onPressed: () {
                            state.updateCoffee(!state.coffee.isSelected);
                          },
                        ),
                        const Text('Coffee')
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: state.shopping.isSelected
                          ? Colors.green
                          : Colors.transparent, // Set the background color
                      shape: BoxShape.rectangle, // Optionally set the shape
                    ),
                    child: Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.shopping_bag),
                          isSelected: state.shopping.isSelected,
                          onPressed: () {
                            state.updateShopping(!state.shopping.isSelected);
                          },
                        ),
                        const Text('Shopping')
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: state.internet.isSelected
                          ? Colors.green
                          : Colors.transparent, // Set the background color
                      shape: BoxShape.rectangle, // Optionally set the shape
                    ),
                    child: Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.wifi),
                          isSelected: state.internet.isSelected,
                          onPressed: () {
                            state.updateInternet(!state.internet.isSelected);
                          },
                        ),
                        const Text('Internet')
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.free_cancellation),
                        onPressed: () {},
                      ),
                      const Text('Cancellation')
                    ],
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: state.lounge.isSelected
                      ? Colors.green
                      : Colors.transparent, // Set the background color
                  shape: BoxShape.rectangle, // Optionally set the shape
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.bed),
                      isSelected: state.lounge.isSelected,
                      onPressed: () {
                        state.updateLounge(!state.lounge.isSelected);
                      },
                    ),
                    const Text('Lounge')
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        const Padding(
            padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
            child: Text("Promo code",
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0))),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), label: Text('Promo Code')),
            textAlign: TextAlign.start,
            onChanged: (value) => state.updatePromocode(value),
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: ElevatedButton(
            onPressed: () {
              state.getOptions();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const TravelerDetail(),
                  settings: RouteSettings(
                      arguments: TravelerInfo(
                          state.fullName,
                          state.age,
                          state.passportNo,
                          state.address,
                          state.options,
                          state.promoCode))));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50)),
            child: const Text('Next'),
          ),
        )
      ],
    );
  }
}
