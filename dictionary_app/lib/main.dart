import 'package:dictionary_app/app.dart';
import 'package:dictionary_app/providers.dart';
import 'package:dictionary_app/services/database_helper.dart';
import 'package:flutter/material.dart';

void main() async {
  setupProviders();
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.database;
  runApp(const App());
}
