import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controller/unit_controller.dart';
import 'package:weatherapp/view/screens/splash.dart';
import 'package:weatherapp/view/utils/colours.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        colorSchemeSeed: AppColors.primaryColor,
        useMaterial3: true,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.secondaryColor,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(
              AppColors.secondaryColor,
            ),
          ),
        ),
      ),
      home: const SplashScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put<UnitController>(UnitController());
      }),
    );
  }
}
