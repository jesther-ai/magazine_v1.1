import 'package:flutter/material.dart';
import 'package:magazine_v1/providers/dummy_loading.dart';
import 'package:magazine_v1/screens/home.dart';
import 'package:magazine_v1/screens/magazine_details.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DummyLoading>(create: (context) => DummyLoading()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Magazine',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
        routes: {MagazineDetails.routeName: (context) => const MagazineDetails()},
      ),
    );
  }
}
