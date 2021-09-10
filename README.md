# Crime Map App


![Github Workflow](https://img.shields.io/github/workflow/status/EricRootLee/crime_map/Development?style=flat)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/b885028a4e894114a72d48d51a610545)](https://app.codacy.com/gh/EricRootLee/crime_map?utm_source=github.com&utm_medium=referral&utm_content=EricRootLee/crime_map&utm_campaign=Badge_Grade_Settings)
[![codecov](https://codecov.io/gh/EricRootLee/crime_map/branch/main/graph/badge.svg)](https://codecov.io/gh/EricRootLee/crime_map)

### Prerequisites

Before you run the application, make sure you add google maps API Key in  the following places:

* 1
```shell script
/android/app/src/main/AndroidManifest.xml =>  [ <meta-data android:name="com.google.android.geo.API_KEY"android:value="API_KEY"/>]
```
* 2 Add your api key in the  `.env` file found in `lib/assets`:

```shell script
GOOGLE_MAP_API_KEY=Your API Key
```

### Background

Develop an application that visualizes crime loations:

* Areas with less than 5 crime reports are marked with a green marker ,those with between 5 and 20 are marked with a yellow marker while those above 20 reports are marked with a red marker.

* Areas within 500 meters radius are categorized as one crime location and have a circle marking the areas with respect to number of crime reported.

* Adding a new area that is within 500 meter radius of an existing location will just update the crime report number else a new crime spot will be created.

* Users can upload images of the crime spots.

### Point to note 
 Places search is set to Kenya only. To enable it in your country or to make it global,consider removing the restriction in `/lib/src/data/services/places service` file. 
## Tech-stack

* Tech-stack
    * [Flutter](http://flutter.dev/) - a cross-platform, framework for building mobile applications.
    * [Dart](http://dart.dev/) - client-optimized language for fast apps on any platform.
    * [Provider](https://pub.dev/packages/provider) - A wrapper around InheritedWidget to make them easier to use and more reusable.(State management)
    * [Google Sign in](https://pub.dev/packages/google_sign_in) - A plugin to access Google Sign in.
    * [Geocoding](https://pub.dev/packages/geocoding) - A Flutter Geocoding plugin which provides easy geocoding and reverse-geocoding features.
    * [Google Places](https://pub.dev/packages/google_place) - A Flutter package for handle google place api that place search and details and photos and autocomplete and query autocomplete requests
    * [Cloud Firestore](https://pub.dev/packages/cloud_firestore) - Flutter plugin for Cloud Firestore, a cloud-hosted, noSQL database with live synchronization and offline support on Android and iOS.
    * [Firebase Storage](https://pub.dev/packages/firebase_storage) - Flutter plugin for Firebase Cloud Storage, a powerful, simple, and cost-effective object storage service for Android and iOS.
    

* Architecture
    * MVVM Architecture

## Dependencies

All the dependencies (external libraries) are defined in a single place - `pubspec.yaml` file. This approach allows to easily manage dependencies and use the same dependency version across all modules.

## Screenshots

The screenshot below shows the working application:

|<image src="screenshots/1.jpg"> | <image src="screenshots/2.jpg"> | <image src="screenshots/3.jpg">| <image src="screenshots/4.jpg">|
|:---:|:---:|:---:|:---:|
|LogIn|Map Screen|Add Crime|Location Images|


