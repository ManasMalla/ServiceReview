import 'package:flutter/material.dart';
import 'package:service_review/review_screen.dart';

main() {
  runApp(const ServiceReview());
}

class ServiceReview extends StatelessWidget {
  const ServiceReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          subtitle2: TextStyle(
              fontSize: 24,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600),
          caption: TextStyle(
              fontSize: 16,
              fontFamily: "Montserrat",
              height: 1.5,
              fontWeight: FontWeight.w500),
          bodyText2: TextStyle(
            fontSize: 16,
            fontFamily: "Montserrat",
          ),
          button: TextStyle(
            fontSize: 18,
            fontFamily: "Montserrat",
          ),
        ),
      ),
      home: const Scaffold(body: ReviewScreen()),
    );
  }
}
