import 'package:flutter/material.dart';
import 'package:radar_soft_tech/core/resources/strings.dart';
import 'package:radar_soft_tech/core/resources/styles.dart';
import 'features/users/view/screens/users_screen.dart';

void main() => runApp(const RadarSoftTech());

class RadarSoftTech extends StatelessWidget {
  const RadarSoftTech({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,

      /// I usually create a Theme in a separate file
      /// And specify each component's style
      /// But there was not much here, so I haven't done that
      /// Instead, I have made a styles.dart file

      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color(0xFF333333)),
          titleTextStyle: AppStyles.titleText,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const UserListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
