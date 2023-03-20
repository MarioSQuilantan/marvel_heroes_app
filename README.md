[![CI](https://github.com/MarioSQuilantan/marvel_heroes_app/actions/workflows/main.yml/badge.svg)](https://github.com/MarioSQuilantan/marvel_heroes_app/actions/workflows/main.yml)
# Marvel Heroes App

A Marvel Heroes app to show the most important events of the Marvel's heroes. This project was created in flutter using BLoC. This project supports Android and iOS devices:

* For Android: [playStore](https://play.google.com/store/) (coming soon)
* For iOS: [AppStore](https://apps.apple.com/mx/app/apple-store/) (coming soon)


## Getting Started

The project contains the implementation of BLoC V8 as a state management, and implemented the Clean Code Architecture and Test Driven Development.

## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/MarioSQuilantan/marvel_heroes_app.git 
```

**Step 2:**

This project works with flutter version `3.7.7` so make sure to have at least this version to avoid conflicts.

**Step 3:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 4:**

Run the project in an Android or iOS device.

## Project Features:

* Characters lists
* Character info
* Character comics list
* Character events list
* Character series list
* Character stories list

### Up-Coming Features:

* desktop design
* refactor widgets
* Add missing tests

### Libraries & Tools Used

* [http](https://pub.dev/packages/http) (A HTTP library for Dart/Flutter)
* [Flutter BLoC](https://pub.dev/packages/flutter_bloc) (Widgets that make it easy to integrate blocs and cubits into Flutter)
* [BLoC](https://pub.dev/packages/bloc) (A dart package that helps implement the BLoC pattern)
* [Dartz](https://pub.dev/packages/dartz) (Functional programming in Dart)
* [Equatable](https://pub.dev/packages/equatable) (Being able to compare objects in Dart often involves having to override the == operator as well as hashCode)
* [Get it](https://pub.dev/packages/get_it) (A Service Locator for Dart and Flutter)
* [BLoC test](https://pub.dev/packages/bloc_test) (A package that makes testing blocs and cubits easy)
* [Mocktail](https://pub.dev/packages/mocktail) (Mock package for Dart)
* [Go router](https://pub.dev/packages/go_router) (A declarative routing package for Flutter)
* [Crypto](https://pub.dev/packages/crypto) (Implementations of SHA, MD5, and HMAC cryptographic functions)

### Folder Structure

Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- core/
|- features/
|- ui/
|- main.dart
|- app_routes.dart
|- injector.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- core - This directory responsible for containing everything related to utilities/common functions of the application.

2- features - Contains the implementation business logic. will be divided into 3 layers - presentation, domain and data.

3- ui — Contains all the ui of the project, contains sub directory for each screen and the common widgets for the applications. For example, Button, TextField etc

7- routes — This folder contains all the routes for the application.

8- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```

### Core

This directory contains all the application level utilities/common functions of the application. A separate folder is created for each type as shown in example below:

```
core/
  |- layout/
    |- screen.layout.dart
  |- error/
    |- failure.dart
    |- exception.dart
  |- utils/
    |- encryptor.dart
    |- scale_size.dart
  |- values/
    |- constants.dart
    |- enums.dart
    |- keys.dart
  |- theme/
    |- theme.dart
    |- texts.dart
```

### Features

Contains the implementation business logic. will be divided into 3 layers - presentation, domain and data. The folder structure is as follows: 

```
features/
|- feature
   |- data
   |- domain
   |- presentation
```

### Presentation

This folder contains the State Manager in this case BLoC.

```
|- bloc/
  |- feature_bloc.dart
  |- feature_event.dart
  |- feature_state.dart
```

### Domain

This folder is the inner layer which shouldn't be susceptible to the whims of changing data sources. It will contain only the core business logic (use cases) and business objects (entities).

```
|- usecases
  |- feature.usecase.dart
|- entities
  |- feature.entity.dart
|- repositories
  |- feature.repository.dart
```

### Data

The data layer consists of a Repository implementation (the contract comes from the domain layer) and data sources.

```
|- datasources/
  |- api.datasource.dart
|- models/
  |- feature.model.dart
|- repositories/
  |- feature.repository_imp.dart
```
### UI

This directory contains all the ui of your application. Each screen is located in a separate folder making it easy to combine group of files related to that particular screen. All the screen specific widgets will be placed in `widgets` directory as shown in the example below:

```
ui/
|- my_page/
  |- layouts/
    |- desktop.layout.dart
    |- phone.layout.dart
    |- tablet.layout.dart
  |- my_page.page.dart
  |- widgets
```
### Widgets

Contains the common widgets that are shared across multiple screens. For example, Button, TextField etc.

```
widgets/
|- app_icon_widget.widget.dart
|- empty_app_bar.widget.dart
|- progress_indicator.widget.dart
```

### AppRoutes

This file contains all the routes and navigation methods for the application.

```dart
class AppRoutes {
  AppRoutes._();
  static GoRouter get call => GoRouter(
        routes: [
          GoRoute(
            path: Routes.my_page,
            builder: (context, state) => const MyPage(),
          ),
        ],
      );

  static void navigateTo(BuildContext context, String route) => context.go(route);
}
```
### Injector

This file contains the dependency injection cases.

```dart
final locator = GetIt.instance;

void init() {
  // blocs
  locator.registerFactory(() => <T>Bloc(getType: locator<Get<T>UseCase>()));

  //use cases
  locator.registerLazySingleton(() => Get<T>UseCase(locator<<T>Repository>()));

  // repositories
  locator.registerLazySingleton<<T>Repository>(() => <T>RepositoryImpl(locator<<T>RemoteDataSource>()));

  // data sources
  locator.registerLazySingleton<<T>RemoteDataSource>(() => <T>RemoteDataSourceImpl(locator<DioClient>()));

  // external
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => HttpClient(locator<http.Client>()));
}
```

### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

```dart
void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<<T>Bloc>(create: (_) => di.locator<<T>Bloc>()),
      ],
      child: MaterialApp.router(
          title: 'Marvel Heroes App',
          theme: theme,
          routerConfig: Routes.call,
      ),
    );
  }
}
```

## Wiki

Checkout [wiki](https://github.com/MarioSQuilantan/{YOUR_PROJECT}/wiki) for more info (coming soon)
