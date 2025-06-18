import 'package:flutter/material.dart';
import 'package:nawel/features/home/presentation/widgets/home_page_app_bar.dart';
import 'package:nawel/features/home/presentation/widgets/services_widget.dart';
import 'package:nawel/features/home/presentation/widgets/shortcut_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomePageAppBar(),
          ServicesWidget(),
          ShortcutWidget(),
        ],
      ),
    );
  }
}
