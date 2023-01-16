import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/components/sidebar.dart';
import 'package:flutter_tutorial/pages/settings.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter_tutorial/bloc/commands_bloc.dart';

import 'pages/home.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(RepositoryProvider(
      create: (context) => CommandsBloc(),
      child: App(),
    )),
    storage: storage,
  );

  // runApp(const MyApp());
}

class App extends StatelessWidget {
  App({super.key});

  final sc = StreamController<String>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final observer = NavObserver(streamController: sc);

    // return BlocProvider(
    //     create: (context) => CommandsBloc(),
    //     child: MaterialApp(
    //       title: 'Flutter Demo',
    //       theme: ThemeData(
    //           primarySwatch: Colors.amber, brightness: Brightness.dark),
    //       themeMode: ThemeMode.dark,
    //       navigatorObservers: <NavigatorObserver>[observer],
    //       initialRoute: '/',
    //       routes: {
    //         "/": (context) => const HomePage(),
    //         "/settings": (context) => const SettingsPage()
    //       },
    //     ));

    return BlocProvider(
        create: (context) => CommandsBloc(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.amber, brightness: Brightness.dark),
          themeMode: ThemeMode.dark,
          navigatorObservers: <NavigatorObserver>[observer],
          builder: (context, child) => Sidebar(),
          initialRoute: '/',
          routes: {
            "/": (context) => const HomePage(),
            "/settings": (context) => const SettingsPage()
          },
        ));
  }
}

class NavObserver with NavigatorObserver {
  final StreamController<String> streamController;

  NavObserver({required this.streamController});

  @override
  void didPop(Route route, Route? previousRoute) {
    print(route);
    // if (previousRoute != null) {
    //   if (previousRoute.settings.name == null) {
    //     streamController.add(3);
    //   } else {
    //     streamController
    //         .add(int.parse(previousRoute.settings.name!.split('/').last));
    //   }
    // }
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    //   if (route.settings.name == null) {
    //     streamController.add(3);
    //   } else {
    //     streamController.add(int.parse(route.settings.name!.split('/').last));
    //   }
  }
}
