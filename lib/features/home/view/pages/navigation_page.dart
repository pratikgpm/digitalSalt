import 'package:digital_salt/features/home/view/pages/account_page.dart';
import 'package:digital_salt/features/home/view/pages/course_page.dart';
import 'package:digital_salt/features/home/view/pages/home_page.dart';
import 'package:digital_salt/features/home/view/pages/message_page.dart';
import 'package:digital_salt/features/home/view/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../../core/theme/app_pallete.dart';

class navigationScreen extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => navigationScreen(),
      );

  const navigationScreen({super.key});

  @override
  State<navigationScreen> createState() => _navigationScreenState();
}

class _navigationScreenState extends State<navigationScreen> {
  final controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreen() {
    return [
      homeScreen(),
      courseScreen(),
      searchScreen(),
      messageScreen(),
      accountScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItem() {
    return [
      PersistentBottomNavBarItem(
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
         Container(
           height: 2,
           width: 26,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(15),
             color: Pallete.bgBlue
           ),
         ),
          const SizedBox(height: 3.1,),
          SvgPicture.asset(
            'assets/svg_files/homefill.svg',
            color: Pallete.bgBlue,
          ),
        ],),
        inactiveIcon: SvgPicture.asset(
          'assets/svg_files/homefill.svg',
          color: Pallete.formFieldGrey,
        ),
        title: "Home",
        activeColorPrimary: Pallete.bgBlue,
        inactiveColorPrimary: Pallete.formFieldGrey,
        activeColorSecondary: Pallete.bgBlue,
        // for active icon
        inactiveColorSecondary: Pallete.formFieldGrey, // for inactive icon
      ),
      PersistentBottomNavBarItem(
        icon:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 2,
              width: 26,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Pallete.bgBlue
              ),
            ),
            const SizedBox(height: 3.1,),
            SvgPicture.asset(
              'assets/svg_files/Subtract.svg',
              color: Pallete.bgBlue,
            ),
          ],),
        inactiveIcon: SvgPicture.asset(
          'assets/svg_files/Subtract.svg',
          color: Pallete.formFieldGrey,
        ),
        title: "course",
        activeColorPrimary: Pallete.bgBlue,
        inactiveColorPrimary: Pallete.formFieldGrey,
        activeColorSecondary: Pallete.bgBlue,
        // for active icon
        inactiveColorSecondary: Pallete.formFieldGrey, // for inactive icon
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/svg_files/search.svg',
            color: Pallete.bgBlue),
        inactiveIcon: SvgPicture.asset(
          'assets/svg_files/search.svg',
          color: Pallete.bgBlue,
        ),
        title: "Search",
        activeColorPrimary: Color(0xffF3F5FD),
        inactiveColorPrimary: Pallete.formFieldGrey,
        activeColorSecondary: Pallete.bgBlue,
        // for active icon
        inactiveColorSecondary: Pallete.formFieldGrey, // for inactive icon
      ),
      PersistentBottomNavBarItem(
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 2,
              width: 26,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Pallete.bgBlue
              ),
            ),
            const SizedBox(height: 3.1,),
            SvgPicture.asset(
              'assets/svg_files/message_1_fill.svg',
              color: Pallete.bgBlue,
            ),
          ],),
        inactiveIcon: SvgPicture.asset(
          'assets/svg_files/message_1_fill.svg',
          color: Pallete.formFieldGrey,
        ),
        title: "Message",
        activeColorPrimary: Pallete.bgBlue,
        inactiveColorPrimary: Pallete.formFieldGrey,
        activeColorSecondary: Pallete.bgBlue,
        // for active icon
        inactiveColorSecondary: Pallete.formFieldGrey, // for inactive icon
      ),
      PersistentBottomNavBarItem(
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 2,
              width: 26,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Pallete.bgBlue
              ),
            ),
            const SizedBox(height: 2.0,),
            SvgPicture.asset(
              'assets/svg_files/off.svg',
              color: Pallete.bgBlue,
            ),
          ],),
        inactiveIcon: SvgPicture.asset(
          'assets/svg_files/off.svg',
          color: Pallete.formFieldGrey,
        ),
        title: "Account",
        activeColorPrimary: Pallete.bgBlue,
        inactiveColorPrimary: Pallete.formFieldGrey,
        activeColorSecondary: Pallete.bgBlue,
        // for active icon
        inactiveColorSecondary: Pallete.formFieldGrey, // for inactive icon
      ),

    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      backgroundColor: Pallete.whiteColor,
      navBarHeight: 60,resizeToAvoidBottomInset: true,
      //margin: const EdgeInsets.symmetric(vertical: 10),
      context,
      screens: _buildScreen(),
      items: _navBarItem(),
      navBarStyle: NavBarStyle.style15,
      decoration: const NavBarDecoration(),

    );
  }
}
