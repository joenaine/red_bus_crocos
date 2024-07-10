import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_bus_crocos_project/application/home/location/user_location_bloc.dart';
import 'package:red_bus_crocos_project/core/constants/app_assets.dart';
import 'package:red_bus_crocos_project/core/theme/colors.dart';
import 'package:red_bus_crocos_project/core/theme/theme_global_var.dart'
    as global;
import 'package:red_bus_crocos_project/presentation/bottom_navigation/widget/bottom_nav_icon_widget.dart';
import 'package:red_bus_crocos_project/presentation/bus_stops/bus_stops_page.dart';
import 'package:red_bus_crocos_project/presentation/home/home_page.dart';
import 'package:red_bus_crocos_project/presentation/home/widgets/huawei_map_widget.dart';
import 'package:red_bus_crocos_project/presentation/schedule/schedule_page.dart';
import 'package:red_bus_crocos_project/presentation/tickets/tickets_page.dart';

@RoutePage()
class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage>
    with WidgetsBindingObserver {
  int _currentIndex = 0;
  bool _isVisible = true;
  late final List<Widget> _screens;

  void _changeNavBarVisibility(bool visibility) {
    setState(() {
      _isVisible = visibility;
    });
  }

  void _onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      context.read<UserLocationBloc>().add(
            const UserLocationEvent.getLocation(silent: true),
          );
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _screens = [
      const HomePage(),
      const BusStopsPage(),
      const SchedulePage(),
      const TicketsPage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).padding.bottom > 0) {
      global.safeAreaBottomPadding = MediaQuery.of(context).padding.bottom;
    }
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
          bottom: false,
          child: IndexedStack(
            index: _currentIndex,
            children: _screens,
          )),
      extendBody: true,
      bottomSheet: AnimatedContainer(
        height: _isVisible ? kBottomNavigationBarHeight + 30 : 0,
        duration: const Duration(milliseconds: 0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
          child: BottomNavigationBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            type: BottomNavigationBarType.fixed,
            elevation: 0.0,
            onTap: _onTappedBar,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _currentIndex,
            selectedItemColor:
                global.isDarkModeOn ? AppColors.white : AppColors.black,
            unselectedItemColor: AppColors.body,
            items: [
              BottomNavigationBarItem(
                icon: BottomNavigationIconWidget(
                  svgPath: AppAssets.svg.location,
                  isSelected: _currentIndex == 0,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: BottomNavigationIconWidget(
                  svgPath: AppAssets.svg.flag,
                  isSelected: _currentIndex == 1,
                ),
                label: 'Bus Stops',
              ),
              BottomNavigationBarItem(
                icon: BottomNavigationIconWidget(
                  svgPath: AppAssets.svg.timer,
                  isSelected: _currentIndex == 2,
                ),
                label: 'Schedule',
              ),
              BottomNavigationBarItem(
                icon: BottomNavigationIconWidget(
                  svgPath: AppAssets.svg.shoppingCart,
                  isSelected: _currentIndex == 3,
                ),
                label: 'Cart',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
