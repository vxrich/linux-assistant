import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter_tutorial/bloc/commands_bloc.dart';

import './button.dart';
import 'screens/home.dart';

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
    () => runApp(const MyApp()),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CommandsBloc()..add(LoadCommands()))
        ],
        child: const MaterialApp(
          title: 'Flutter Demo',
          // theme: ThemeData(
          //   primarySwatch: Colors.amber,
          // ),
          themeMode: ThemeMode.dark,
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}
