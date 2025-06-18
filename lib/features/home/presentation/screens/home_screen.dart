import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nawel/core/constants/colors.dart';
import 'package:nawel/features/home/presentation/controllers/blocs/nearby_bloc.dart';
import 'package:nawel/features/home/presentation/controllers/blocs/offer_bloc.dart';
import 'package:nawel/features/home/presentation/screens/pages/home_page.dart';
import 'package:nawel/features/home/presentation/widgets/home_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          MultiBlocProvider(
            providers: [
              BlocProvider<NearbyBloc>(
                create: (context) => NearbyBloc(),
              ),
              BlocProvider<OfferBloc>(
                create: (context) => OfferBloc(),
              ),
            ],
            child: const HomePage(),
          ),
          const Center(child: Text('Categories')),
          const Center(child: Text('Delivery')),
          const Center(child: Text('Cart')),
          const Center(child: Text('Profile')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.grey[700],
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (index) async {
          await _pageController.animateToPage(index,
              duration: Durations.long2, curve: Curves.easeInOut);
        },
        items: List.generate(icons.length, (index) {
          final isSelected = index == _selectedIndex;
          return BottomNavigationBarItem(
            label: labels[index],
            icon: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 4.h,
                  width: 48.w,
                  decoration: BoxDecoration(
                    color: isSelected ? kPrimaryColor : Colors.transparent,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4.r),
                      bottomRight: Radius.circular(4.r),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                index == 0
                    ? icons[0]
                    : SvgPicture.asset(
                        icons[index],
                        height: 24.h,
                        width: 24.w,
                        color: isSelected ? kPrimaryColor : Colors.grey[700],
                      )
              ],
            ),
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
