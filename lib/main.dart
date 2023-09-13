import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_task_for_job/screens/hotel_screen/hotel_screen.dart';
import 'package:test_task_for_job/screens/paid_screen/paid_screen.dart';
import 'helpers/size_config.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return MaterialApp(
      title: 'Test Task for Job',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'SFProDisplay',
        inputDecorationTheme: const InputDecorationTheme(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        ),
      ),
      home:const PaidScreen(title: 'Заказ оплачен',)
      // HotelScreen(
      //   title: 'Отель',
      // ),
    );
  }
}
