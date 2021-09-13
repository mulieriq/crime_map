import 'package:flutter/material.dart';

import '../common/app_constants.dart';
import '../../data/service/places_service.dart';

class AddressSearch extends SearchDelegate<Suggestion> {
  final sessionToken;
  PlaceApiProvider? apiClient;
  AddressSearch(this.sessionToken) {
    apiClient = PlaceApiProvider(sessionToken);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: AppConstants.clear,
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: AppConstants.back,
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Suggestion>>(
      future: query == ""
          ? null
          : apiClient!.fetchSuggestions(
              query, Localizations.localeOf(context).languageCode),
      builder: (context, snapshot) => query == ''
          ? Container(
              padding: EdgeInsets.all(16.0),
              child: Text(AppConstants.enterYourAdress),
            )
          : snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(snapshot.data![index].description),
                    onTap: () {
                      close(context, snapshot.data![index]);
                    },
                  ),
                )
              : Container(
                  child: Center(
                  child: CircularProgressIndicator.adaptive(),
                )),
    );
  }
}
