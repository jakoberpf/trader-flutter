import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:best_flutter_ui_templates/custom_drawer/drawer_user_controller.dart';
import 'package:best_flutter_ui_templates/custom_drawer/home_drawer.dart';
import 'package:best_flutter_ui_templates/feedback_screen.dart';
import 'package:best_flutter_ui_templates/help_screen.dart';
import 'package:best_flutter_ui_templates/invite_friend_screen.dart';
import 'package:best_flutter_ui_templates/login/pages/login.page.dart';
import 'package:best_flutter_ui_templates/trader_list/hotel_home_screen.dart';
import 'package:flutter/material.dart';

import 'design_course/home_design_course.dart';
import 'fitness_app/fitness_app_home_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget screenView;
  DrawerIndex drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = const TraderListScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = TraderListScreen();
        });
      } else if (drawerIndex == DrawerIndex.LOGIN) { // TODO Implement TraderHelp Infos
        setState(() {
          screenView = LoginPage();
        });
      } else if (drawerIndex == DrawerIndex.Help) { // TODO Implement TraderHelp Infos
        setState(() {
          screenView = HelpScreen();
        });
      } else if (drawerIndex == DrawerIndex.FeedBack) { // TODO Remove
        setState(() {
          screenView = FeedbackScreen();
        });
      } else if (drawerIndex == DrawerIndex.Invite) { // TODO Specify who can invite (Moderators)
        setState(() {
          screenView = InviteFriend();
        });
      } else if (drawerIndex == DrawerIndex.Theme1) { // TODO Remove
        setState(() {
          screenView = FitnessAppHomeScreen();
        });
      } else if (drawerIndex == DrawerIndex.Theme2) { // TODO Remove
        setState(() {
          screenView = DesignCourseHomeScreen();
        });
      }
    }
  }
}
