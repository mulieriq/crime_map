# Crime Map

### Background

Develop an application that visualizes crime loations:

* Areas with less than 5 crime reports are marked with a green marker ,those with between 5 and 20 are marked with a yellow marker while those above 20 reports are marked with a red marker.

* Areas within 500 meters radius are categorized as one crime location and have a circle marking the areas with respect to number of crime reported.

* Adding a new area that is within 500 meter radius of an existing location will just update the crime report number else a new crime spot will be created.

* Users can upload images of the crime spots.


## Tech-stack

* Tech-stack
    * [Flutter](https://kotlinlang.org/) - a cross-platform, statically typed, general-purpose programming language with type inference.
    * [Dart](https://kotlinlang.org/docs/reference/coroutines-overview.html) - perform background operations.
    * [Provider](https://kotlinlang.org/docs/reference/coroutines/flow.html) - handle the stream of data asynchronously that executes sequentially.
    * [Google Sign in](https://insert-koin.io/) - a pragmatic lightweight dependency injection framework.
    * [Geocoding](https://developer.android.com/jetpack)
    * [Google Places](https://developer.android.com/topic/libraries/architecture/room) - a persistence library provides an abstraction layer over SQLite.
    * [Cloud Firestore](https://developer.android.com/topic/libraries/architecture/livedata) - is an observable data holder.
    * [Firebase Storage](https://developer.android.com/topic/libraries/architecture/lifecycle) - perform action when lifecycle state changes.
    

* Architecture
    * Clean Architecture

## Dependencies

All the dependencies (external libraries) are defined in the single place - `pubspec.yaml` file. This approach allows to easily manage dependencies and use the same dependency version across all modules.

## Screenshots

The screenshot below shows the tests that are done on the repo:


The UI Tests are tested on an Emulator Running Android 10 (API 29) - Might be flaky on some API levels.

<img src="https://github.com/jumaallan/justeat/blob/develop/screenshots/ui_tests.gif" width="320"/>


