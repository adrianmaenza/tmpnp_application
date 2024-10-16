import 'package:flutter/material.dart';
import 'package:tmpnp_application/screens/home_screen.dart';
import 'package:tmpnp_application/util/constants.dart';
import 'package:tmpnp_application/widgets/pnp_button.dart';


class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: const Color(0xFFFAFAFA),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            const Text(
              "Please select your preferred collection point.",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),

            const SizedBox(
              height: 20,
            ),

            const Text("Region:"),

            const SizedBox(height: 5),
            // Region list
            SizedBox(
              width: double.infinity,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: const Color(secondaryColor),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      iconEnabledColor: Colors.white,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      hint: const Text(
                        "Select region",
                        style: TextStyle(color: Colors.white),
                      ),
                      items: <String>['A', 'B', 'C', 'D'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (region) {},
                    ),
                  )),
            ),

            const SizedBox(
              height: 20,
            ),

            const Text("Store:"),

            const SizedBox(height: 5),

            // Location list
            SizedBox(
              width: double.infinity,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: const Color(secondaryColor),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: DropdownButton<String>(
                        isExpanded: true,
                        iconEnabledColor: Colors.white,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        hint: const Text(
                          "Select location",
                          style: TextStyle(color: Colors.white),
                        ),
                        items: <String>['A', 'B', 'C', 'D'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (location) {},
                      ),
                    ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            PnpButton(
              "Proceed",
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()))
              },
            )
          ],
        ),
      ),
    );
  }
}
