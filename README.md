#Flutter MobilShop

The goal of this application is to manage you shopping items.

- Add items
- Delete items
- Check/Uncheck items

Uses Firebase/Cloud Firestore as a backend service.

## How to download the app

[To download the app click here](https://github.com/joankabello/flutter_mobilshop/releases/download/1.0/app-release.apk)

## Running & building the app commands
##### How to run the app on debug mode

<code>flutter run</code>

##### How to run the app on release mode

<code>flutter run --release</code>

##### How to generate the apk on release mode

<code>flutter build apk --release</code>

## Running tests

##### How to run tests

<code>flutter test test/home_test.dart</code>

##### How to get test coverage
Use genhtml to generate the dashoboard of test coverage
Total test coverage is <b>60%</b>

<code>flutter test --coverage</code>
<code>genhtml coverage/lcov.info -o coverage/html</code>

Open <code>flutter_mobilshop/coverage/html/index.html</code> after generating the test coverage to see the dashboard.

##### About the architecture
This app is made with BLoC architecture & state management, where each screen has its bloc which manages the screen states locally & the logic part.

The <b>/widgets</b> directory is responsible for the storing all the custom & scalable widgets.

The <b>/services</b> directory is responsible for the Firebase services.

The <b>/models</b> directory is responsible for all the models of the app & its functions to manipulate the data.

##### ***NOTE***
The app is tested only in Android. In iOS it requires configurations on Xcode for the Firebase service.
