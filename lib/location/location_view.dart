import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmpnp_application/screens/home_screen.dart';
import 'package:tmpnp_application/util/constants.dart';

import '../bloc/app/app_bloc.dart';
import '../models/models.dart';
import '../services/location_service.dart';
import '../services/region_service.dart';

class LocationPicker extends StatefulWidget {
  const LocationPicker({super.key});

  @override
  _LocationPickerState createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  final RegionService regionService = RegionService();
  final LocationService locationService = LocationService();

  List<Region> regions = [];
  Region? selectedRegion;

  Location? selectedLocation;

  List<Location> stores = [];

  @override
  void initState() {
    super.initState();
    _loadRegions();
  }

  Future<void> _loadRegions() async {
    try {
      final data = await regionService.fetchRegions();
      setState(() {
        regions = data;
      });
    } catch (e) {
      // Handle error gracefully
      print('Error fetching regions: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: const Color(0xFFFAFAFA),
      ),
      body: BlocProvider(
        create: (context) => AppBloc(),
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                children: [
                  const Text(
                    "Please select your preferred collection point.",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 20),

                  const Text("Region:"),

                  const SizedBox(height: 5),

                  // Region Dropdown
                  SizedBox(
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color(secondaryColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: DropdownButtonHideUnderline(
                            // drop down button
                            child: DropdownButton<Region>(
                              isExpanded: true,
                              value: selectedRegion,
                              iconEnabledColor: Colors.white,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              hint: const Text(
                                "Select region",
                                style: TextStyle(color: Colors.white),
                              ),
                              items: regions.map((Region region) {
                                return DropdownMenuItem<Region>(
                                  value: region,
                                  child: Text(region.name),
                                );
                              }).toList(),
                              selectedItemBuilder: (BuildContext context) {
                                return regions.map((Region region) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14),
                                    child: Text(region.name,
                                        style: const TextStyle(
                                            color: Colors.white)),
                                  );
                                }).toList();
                              },
                              onChanged: (Region? newRegion) {
                                setState(() {
                                  selectedRegion = newRegion;
                                  // context.read<CartBloc>().add(CartSetLocation(null));

                                  setState(() {
                                    selectedLocation = null;
                                  });
                                  if (newRegion != null) {
                                    stores = newRegion.stores;
                                  }


                                });
                                // print(eligibleStores);
                              },
                            ),
                          )),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text("Store:"),

                  const SizedBox(height: 5),

                  // Store Dropdown
                  SizedBox(
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color(secondaryColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: DropdownButtonHideUnderline(
                            // drop down button
                            child: DropdownButton<Location>(
                              isExpanded: true,
                              value: selectedLocation,
                              iconEnabledColor: Colors.white,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              hint: const Text(
                                "Select store",
                                style: TextStyle(color: Colors.white),
                              ),
                              items: stores.map((Location store) {
                                return DropdownMenuItem<Location>(
                                  value: store,
                                  child: Text(store.name),
                                );
                              }).toList(),
                              selectedItemBuilder: (BuildContext context) {
                                return stores.map((Location store) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14),
                                    child: Text(store.name,
                                        style: const TextStyle(
                                            color: Colors.white)),
                                  );
                                }).toList();
                              },
                              onChanged: (Location? newLocation) {
                                setState(() {
                                  selectedLocation = newLocation;
                                });
                                  context.read<AppBloc>().add(CartSetLocation(newLocation));
                              },
                            ),
                          )),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Proceed Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(primaryColor),
                        minimumSize: const Size.fromHeight(45)),
                    child: const Text(
                      "Proceed",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'By proceeding, you agree to our\nprivacy policy and terms.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue, height: 1.2),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
