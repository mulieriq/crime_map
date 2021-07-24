import 'package:crime_map/src/models/crime_location_model.dart';
import 'package:crime_map/src/utils/map_utility.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:provider/provider.dart';

import '../../helpers/common/app_constants.dart';
import '../../helpers/widgets/app_text.dart';
import '../../models/entity/location_entity.dart';
import '../../provider/map_provider.dart';
import '../../utils/app_extenstions.dart';
import '../../utils/location_html_parser.dart';
import '../../utils/media_utility.dart';

class AddCrimeLocation extends StatefulWidget {
  @override
  _AddCrimeLocationState createState() => _AddCrimeLocationState();
}

class _AddCrimeLocationState extends State<AddCrimeLocation> {
  List<Asset> images = <Asset>[];
  late MapProvider? mapProvider;
  PlaceEntity? searchCoordinates;
  bool isSearchLocation = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mapProvider = Provider.of<MapProvider>(context);
  }

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
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          onPressed: () {
                            mapProvider!
                                .getUserPlaceSearch(context)
                                .then((value) {
                              setState(() {
                                isSearchLocation = true;
                                searchCoordinates = PlaceEntity(
                                    latitude: mapProvider!.placedetails!.result
                                        .geometry!.location.lat,
                                    longitude: mapProvider!.placedetails!.result
                                        .geometry!.location.lat,
                                    city: mapProvider!
                                        .placedetails!.result.adrAddress);
                              });
                            });
                          },
                          child: CustomText(
                              text: AppConstants.kGoogleSearchLocation)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(AppConstants.or),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          onPressed: () => setState(() {
                                isSearchLocation = false;
                                searchCoordinates = PlaceEntity(
                                    latitude: mapProvider!
                                        .currentUserLocation!.latitude,
                                    longitude: mapProvider!
                                        .currentUserLocation!.longitude,
                                    city: mapProvider!
                                        .places![0].administrativeArea);
                              }),
                          child: CustomText(
                              text: AppConstants.kGoogleUseCurrentLocation)),
                    ])),
            searchCoordinates == null
                ? Container()
                : ListTile(
                    title: CustomTextTitle(
                      text: AppConstants.locationCoordinates &
                          "${searchCoordinates!.latitude},${searchCoordinates!.latitude}",
                    ),
                    subtitle: isSearchLocation
                        ? locationHtmlParser(searchCoordinates!.city)
                        : CustomText(
                            text: AppConstants.locationName &
                                searchCoordinates!.city!,
                          ),
                  ),
            Center(
                child: mapProvider!.appBusy
                    ? CircularProgressIndicator.adaptive()
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () async {
                          mapProvider!.setBusy(true);
                          MapSerivce.isAreaFrequentFlagged(
                                  searchCoordinates!.latitude!,
                                  searchCoordinates!.longitude!,
                                  mapProvider!.crimeLocations)
                              .then((value) {
                            int resultValue = int.parse(value!.split(" ")[0]);
                            print("Report NUmber .......$value");
                            print("Report NUmber .......$resultValue");
                            resultValue == 0
                                ? mapProvider!
                                    .saveLocationToDB(CrimeLocationModel(
                                        latitude: searchCoordinates!.latitude!,
                                        longitude:
                                            searchCoordinates!.longitude!,
                                        reportNumber: 0,
                                        crimeImages: [
                                          'https://google.com',
                                          'https://google.com',
                                          'https://google.com'
                                        ]))
                                    .then((value) => Fluttertoast.showToast(
                                        msg: AppConstants.locationSaved))
                                : mapProvider!
                                    .updateLocationToDB(CrimeLocationModel(
                                      latitude: searchCoordinates!.latitude!,
                                      longitude: searchCoordinates!.longitude!,
                                      reportNumber: resultValue,
                                      crimeImages: [
                                        'https://google.com',
                                        'https://google.com',
                                        'https://google.com'
                                      ],
                                      locationId: value.split(" ")[1],
                                    ))
                                    .then((value) => Fluttertoast.showToast(
                                        msg: AppConstants.locationSaved));
                          }).catchError((onError) {
                            Fluttertoast.showToast(
                                msg: AppConstants.locationSaved);
                          });
                        },
                        child: CustomText(text: AppConstants.saveLocation)))
          ],
        ),
      ),
    );
  }
}
