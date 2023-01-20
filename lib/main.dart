import 'package:cryptbee/Routing/routing.dart';
import 'package:cryptbee/Screens/Utilities/Dynamic%20Link/dynamic_link.dart';
import 'package:cryptbee/Screens/Utilities/static_classes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Config/api_integration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await _initAuth();
  FlutterNativeSplash.remove();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    initDynamicLink();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}

Future _initAuth() async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('access')) {
    String access = prefs.getString('access')!;
    if (JwtDecoder.isExpired(access)) {
      await ApiCalls.renewToken();
      access = prefs.getString('access')!;
    }
    App.isLoggedIn = true;
    App.acesss = access;
    User.name = prefs.getString('name') ?? '';
  } else {
    App.isLoggedIn = false;
    // it doesnt exist

  }
}
