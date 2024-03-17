import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter_tutorial/bloc/commands_bloc.dart';

import 'package:flutter_acrylic/flutter_acrylic.dart';

import 'pages/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Window.initialize();

  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(RepositoryProvider(
      create: (context) => CommandsBloc(),
      child: const MyApp(),
    )),
    storage: storage,
  );

  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CommandsBloc(),
        child: MaterialApp(
          title: 'Linux assistant',
          theme: ThemeData(
            primarySwatch: Colors.green,
            brightness: Brightness.dark,
          ),
          themeMode: ThemeMode.dark,
          routes: {
            "/": (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
          },
        ));
  }
}
