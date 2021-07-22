import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';

import '../../helpers/common/app_constants.dart';
import '../../helpers/widgets/app_text.dart';
import 'places/adress_search.dart';
import 'places/places_service.dart';

class AddCrimeLocation extends StatefulWidget {
  @override
  _AddCrimeLocationState createState() => _AddCrimeLocationState();
}

class _AddCrimeLocationState extends State<AddCrimeLocation> {
  GoogleMapsPlaces _places =
      GoogleMapsPlaces(apiKey: AppConstants.kGoogleApiKey);
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextTitle(
          text: AppConstants.addCrimePageTitle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Positioned(
              top: 10,
              left: 5,
              right: 5,
              child: Card(
                child: TextField(
                  controller: _controller,
                  readOnly: true,
                  onTap: () async {
                    // generate a new token here
                    final sessionToken =
                        DateTime.now().microsecondsSinceEpoch.toString();
                    final Suggestion? result = await showSearch(
                      context: context,
                      delegate: AddressSearch(sessionToken),
                    );
                    PlacesDetailsResponse detail =
                        await _places.getDetailsByPlaceId(result!.placeId);
                    setState(() {
                      print(
                          "this is the place =============== ${detail.result.geometry!.location.lat} , ${detail.result.geometry!.location.lng}");
                    });
                  },
                  decoration: InputDecoration(
                    icon: Container(
                      width: 10,
                      height: 10,
                      child: Icon(
                        Icons.home,
                        color: Colors.black,
                      ),
                    ),
                    hintText: AppConstants.kGoogleSearchLocation,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 8.0, top: 16.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
