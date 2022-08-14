import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:kaboo_app/utils/gloable_data.dart';
import 'package:logger/logger.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlacePicker(
        apiKey: GlobalData.API_KEY,
        onPlacePicked: (result) {
          Logger().i(result.formattedAddress);
          Navigator.of(context).pop();
        },
        initialPosition: LatLng(7.8731, 80.7718),
        useCurrentLocation: true,
        resizeToAvoidBottomInset:
            false, // remove this line, if map offsets are wrong
      ),
    );
  }
}
