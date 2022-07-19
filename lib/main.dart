import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_mvvm/view/home_view.dart';
import 'package:sample_mvvm/view_model/user_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => UserViewModel()),
      ],
      child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  HomeView(),
    ),);
  }
}


