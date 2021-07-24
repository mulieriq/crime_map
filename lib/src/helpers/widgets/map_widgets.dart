import 'package:cached_network_image/cached_network_image.dart';
import 'package:crime_map/src/models/crime_location_model.dart';
import 'package:flutter/material.dart';

mapWidgets(CrimeLocationModel crimeLocation, BuildContext context) {
  return crimeLocation.crimeImages!.isEmpty
      ? null
      : showModalBottomSheet(
          context: context,
          builder: (builder) => Container(
                height: MediaQuery.of(context).size.height * .30,
                child: ListView.builder(
                  itemCount: crimeLocation.crimeImages!.length,
                  itemBuilder: (context, index) => CachedNetworkImage(
                      fit: BoxFit.contain,
                      fadeInCurve: Curves.easeInOutCirc,
                      fadeInDuration: Duration(seconds: 2),
                      fadeOutCurve: Curves.easeInOutCirc,
                      fadeOutDuration: Duration(seconds: 2),
                      imageUrl: crimeLocation.crimeImages![index],
                      useOldImageOnUrlChange: true,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error)),
                ),
              ));
}
