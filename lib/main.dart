import 'dart:convert';
import 'package:coincap/models/app_config.dart';
import 'package:coincap/pages/home_page.dart';
import 'package:coincap/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadConfig();
  registerHTTPService();
  
  runApp(const MyApp());
}

Future<void> loadConfig() async {
  String _configContent =
      await rootBundle.loadString("assets/config/main.json");
  Map<String, dynamic>? _configData = jsonDecode(_configContent);
  if (_configData != null && _configData.containsKey("COIN_API_BASE_URL")) {
    GetIt.instance.registerSingleton<AppConfig>(
      AppConfig(
        COIN_API_BASE_URL: _configData["COIN_API_BASE_URL"] as String,
      ),
    );
  } else {
    // Handle the case where COIN_API_BASE_URL is not found or null
    print("COIN_API_BASE_URL is missing or null in the config file.");
  }
}


void registerHTTPService() {
  GetIt.instance.registerSingleton<HTTPService>(
    HTTPService(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoinCap',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color.fromRGBO(
          88,
          60,
          197,
          1.0,
        ),
      ),
      home: HomePage(),
    );
  }
}