import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import '../../helpers/common/app_constants.dart';
import '../../helpers/widgets/app_text.dart';
import '../../utils/media_utility.dart';
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

  List<Asset> images = <Asset>[];
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
            Container(
                child: images.isEmpty
                    ? Stack(
                        children: <Widget>[
                          Container(
                            color: Colors.grey,
                            height: MediaQuery.of(context).size.height * 0.35,
                            child: Center(
                              child: Text(
                                AppConstants.noImageSelected,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.4225,
                            bottom: MediaQuery.of(context).size.height * 0.1900,
                            child: Center(
                              child: FloatingActionButton(
                                onPressed: () {
                                  MediaService.getImages().then((value) =>
                                      setState(() => images = value));
                                },
                                child: Icon(Icons.add),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        color: Colors.grey.withAlpha(100),
                        child: GridView.builder(
                            itemCount: images.length,
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: images.length == 1
                                        ? 1
                                        : images.length == 2
                                            ? 1
                                            : images.length == 3
                                                ? 1
                                                : images.length == 4
                                                    ? 1
                                                    : 1),
                            itemBuilder: (BuildContext context, index) {
                              Asset asset = images[index];

                              return Stack(
                                fit: StackFit.expand,
                                children: <Widget>[
                                  Container(
                                    child: AssetThumb(
                                      quality: 100,
                                      height: 120,
                                      width: 150,
                                      asset: asset,
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: Center(
                                        child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          images.removeAt(index);
                                        });
                                      },
                                      icon: Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                      ),
                                    )),
                                  ),
                                ],
                              );
                            }))),
            Card(
              child: TextField(
                controller: _controller,
                readOnly: true,
                onTap: () async {
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
          ],
        ),
      ),
    );
  }
}
