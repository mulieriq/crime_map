import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/crime_location_model.dart';
import '../common/app_constants.dart';
import 'app_text.dart';

mapWidgets(CrimeLocationModel crimeLocation, BuildContext context) {
  return crimeLocation.crimeImages!.isEmpty
      ? null
      : showModalBottomSheet(
          context: context,
          builder: (builder) => Container(
              height: MediaQuery.of(context).size.height * .30,
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CustomTextTitle(
                        text: AppConstants.locationImages,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: crimeLocation.crimeImages!.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * .5,
                          child: CachedNetworkImage(
                              fit: BoxFit.contain,
                              fadeInCurve: Curves.easeInOutCirc,
                              fadeInDuration: Duration(seconds: 2),
                              fadeOutCurve: Curves.easeInOutCirc,
                              fadeOutDuration: Duration(seconds: 2),
                              imageUrl: crimeLocation.crimeImages![index],
                              useOldImageOnUrlChange: true,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error)),
                        ),
                      ),
                    ),
                  ),
                ],
              )));
}
