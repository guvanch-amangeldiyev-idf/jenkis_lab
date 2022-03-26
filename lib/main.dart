import 'package:flutter/material.dart';
import 'package:presentation/screen/my_app.dart';

import 'di/injector.dart';

void main() async {
  await initInjector();
  runApp(const MyApp());
}
