import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivial_game/constatnts/app_name.dart';
import 'package:trivial_game/repo/game_repo.dart';
import 'package:trivial_game/repo/init_repo.dart';
import 'package:trivial_game/screens/splash_screen.dart';
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


void main() {
    WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Initialize()),
        ChangeNotifierProvider(create: (_) => GameRepo()),
      ],
      child: MaterialApp(
       
      navigatorKey: navigatorKey,
        title: appName,
        theme: ThemeData(
    
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}

