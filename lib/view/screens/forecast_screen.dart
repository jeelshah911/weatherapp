import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:weatherapp/models/forecastday.dart';
import 'package:weatherapp/view/utils/colours.dart';
import 'package:weatherapp/view/widgets/app_style.dart';

class ForecastListScreen extends StatelessWidget {
  final List<Forecastday> forecast;
  final String? location;
  final String? temperatureUnitValue;
  const ForecastListScreen({
    super.key,
    required this.forecast,
    required this.location,
    required this.temperatureUnitValue,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: appBarStyle(
        title: "5-day forecast",
        locationIcon: true,
        selectedLocation: location,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            forecastList(forecast),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.2,
            ),
          ],
        ),
      ),
    );
  }

  Widget forecastList(List<Forecastday> forecast) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          DateTime forecastDate = DateTime.parse(forecast[index].date ?? 'N/A');
          bool isCurrentDate = DateTime.now().day == forecastDate.day &&
              DateTime.now().month == forecastDate.month &&
              DateTime.now().year == forecastDate.year;
          Color containerColor =
              isCurrentDate ? AppColors.offWhiteColor : AppColors.shadeColor;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat('EEE').format(forecastDate),
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          color: AppColors.secondaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      DateFormat('dd/MM').format(forecastDate),
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          color: AppColors.secondaryColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Image.network(
                      "https:${forecast[index].day?.condition!.icon!}",
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      temperatureUnitValue == "°C"
                          ? '${forecast[index].day?.maxtempC!.toStringAsFixed(0)}°'
                          : '${forecast[index].day?.maxtempF!.toStringAsFixed(0)}°',
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          color: AppColors.secondaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      temperatureUnitValue == "°C"
                          ? '${forecast[index].day?.mintempC!.toStringAsFixed(0)}°'
                          : '${forecast[index].day?.mintempF!.toStringAsFixed(0)}°',
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          color: AppColors.secondaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
