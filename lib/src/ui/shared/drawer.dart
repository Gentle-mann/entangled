import 'package:entangled/src/cache/app_cache.dart';
import 'package:entangled/src/constants.dart';
import 'package:entangled/src/provider/location_provider.dart';
import 'package:entangled/src/ui/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: AppColors.kPrimaryColor,
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 20),
        child: Column(
          children: [
            DefaultText(
              'Choose a Nigerian State',
              fontSize: 15,
            ),
            NigerianCitiesDropdown(),
            SizedBox(height: 20),
            DefaultText(
              'Choose an LGA',
              fontSize: 15,
            ),
            NigerianLGAsDropdown(),
          ],
        ),
      ),
    );
  }
}

class NigerianCitiesDropdown extends StatelessWidget {
  const NigerianCitiesDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(
        builder: (context, locationProvider, child) {
      return DropdownButton<String>(
        key: const ValueKey('States'),
        style: const TextStyle(color: AppColors.kSecondaryColor),
        value: locationProvider.state,
        onChanged: (newState) async {
          locationProvider.updateNigerianState(newState!);

          locationProvider.updateLga(
            NigerianStatesAndLGA.getStateLGAs(locationProvider.state)[0],
          );
          await AppCache().setNigerianState(locationProvider.state);
          await AppCache().setLga(locationProvider.lga);
        },
        isExpanded: true,
        hint: const Text('Select a Nigerian state'),
        items: NigerianStatesAndLGA.allStates
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    });
  }
}

class NigerianLGAsDropdown extends StatelessWidget {
  const NigerianLGAsDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(
        builder: (context, locationProvider, child) {
      return DropdownButton<String>(
        key: const ValueKey('LGAs'),
        style: const TextStyle(color: AppColors.kSecondaryColor),
        value: locationProvider.lga,
        onChanged: (newLga) async {
          locationProvider.updateLga(newLga!);
          await AppCache().setLga(locationProvider.lga);
        },
        isExpanded: true,
        hint: const Text('Select an LGA'),
        items: NigerianStatesAndLGA.getStateLGAs(locationProvider.state)
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    });
  }
}
