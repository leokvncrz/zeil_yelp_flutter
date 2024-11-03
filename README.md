# YELP NYC Business List Test App

**Objective:**
Create a mobile application using the Yelp REST API to display a list of public businesses and their details.

**Framework and Language:**
You must use the Flutter framework and Dart language to complete this challenge.

**Fetching Yelp Businesses:**
Utilize the Yelp Business Search endpoint:
https://api.yelp.com/v3/businesses/search?location=NYC
This will provide you with a list of public businesses.

1. Which type of API request (GET, POST) this API has-  GET
2. Which one authorization is required like (JWT Token, Bearer Token, Basic auth)--Bearer Token

You can create  own api key on yelp dashboard https://docs.developer.yelp.com/docs/getting-started

**UX Design:**
There are no predefined UX designs for this challenge. However, you should meet the following objectives and feel free to be creative:

List the public businesses retrieved from the Yelp API.
When a public business is clicked, display its details.

**Deadline:**
Please submit your completed exercise by Nov 4th at 12:00 PM NZT .

Remember, there is no right or wrong solution to this exercise; we are looking for creativity and your approach to problem-solving.

## Getting Started

Install FVM [here](https://fvm.app/documentation/getting-started/installation)

FVM to use a specific version of flutter.

Get Packages
```sh
fvm flutter pub get
```

**Packages used:**
- [equatable](https://pub.dev/packages/equatable)
- [dio](https://pub.dev/packages/dio)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)

Run the App
```sh
fvm flutter run --dart-define=API_KEY=<your yelp api key here>
```

Run the Tests
```sh
fvm flutter test
```

**Others:**
For vscode launch.json, make sure to update the API_KEY value in the file.
You can also add an environment variable on your .zshrc file.

You can also run directly via flutter without using fvm.
```sh
flutter run --dard-define=API_KEY=<your yelp api key here>
```
