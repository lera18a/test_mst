import 'package:flutter/material.dart';
import 'package:test_mst/global_page/global_page.dart';
import 'package:test_mst/onbording/onbording.dart';
import 'package:test_mst/shared_preferences/shared_preferences_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bool subscribed = await SharedPreferencesService.isSubscribed();
  runApp(MyApp(whatPage: subscribed));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.whatPage});
  final bool whatPage;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: whatPage ? GlobalPage() : Onbording(),
    );
  }
}
