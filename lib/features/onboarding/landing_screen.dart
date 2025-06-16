import 'package:flutter/material.dart';
import 'package:nawel/features/onboarding/widgets/landing_widget.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({super.key});
  final PageController controller = PageController(
    initialPage: 0,
    keepPage: true,
  );
  final int lastPage = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          
      controller: controller,
      children: [
        LandingWidget(
          title: 'all-in-one delivery',
          description:
              'Order groceries, medicines, and meals delivered straight to your door',
          lastPage: lastPage,
          controller: controller,
        ),
        LandingWidget(
          title: 'User-to-User Delivery',
          description:
              'Order groceries, medicines, and meals delivered straight to your door',
          controller: controller,
          lastPage: lastPage,
        ),
        LandingWidget(
          title: 'Sales & Discounts',
          description: 'Discover exclusive sales and deals every day',
          controller: controller,
          lastPage: lastPage,
        ),
      ],
    ));
  }
}
