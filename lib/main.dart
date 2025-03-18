import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sql_lite/db_handler.dart';
import 'home.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme:ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent,

      ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
            elevation: 4,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          )
          )
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent
        )
      ),


    );
  }

}

