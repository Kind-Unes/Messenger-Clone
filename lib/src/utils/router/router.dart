import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:messenger_clone_app/src/features/auth/screens/join_facebook.dart';
import 'package:messenger_clone_app/src/features/auth/screens/join_facebook_email.dart';
import 'package:messenger_clone_app/src/features/auth/screens/join_facebook_finishing.dart';
import 'package:messenger_clone_app/src/features/auth/screens/join_facebook_gender.dart';
import 'package:messenger_clone_app/src/features/auth/screens/join_facebook_name.dart';
import 'package:messenger_clone_app/src/features/auth/screens/join_facebook_password.dart';
import 'package:messenger_clone_app/src/features/auth/screens/login.dart';
import 'package:messenger_clone_app/src/features/auth/screens/login_state_page.dart';
import 'package:messenger_clone_app/src/features/auth/screens/main_auth.dart';
import 'package:messenger_clone_app/src/features/home/main_messenger.dart';
import 'package:messenger_clone_app/src/utils/router/router_animation_widget.dart';

class MyRouter {
  GoRouter router = GoRouter(
      navigatorKey: GlobalKey<NavigatorState>(),
      // initialLocation: "/signin_introduction/signin_fullname/signin_email",
      initialLocation: "/state_page",
      routes: [
        // State Page Decider
        customTransitionRoute(
            const HomeScreen(), "/state_page", "StatePage", []),

        /// Post creation Path
        customTransitionRoute(const Home(), "/home", "Home", []),
        // Sign In Paths (Email/Mobile):
        customTransitionRoute(const MainAutth(), "/", "MainAuth", [
          // LogIn Routes
          customTransitionRoute(const LogIn(), "login", "LogIn", []),
          // LogIn Routes
          //! customTransitionRoute(
          //!     const FindMyAccount(), "find_my_account", "FindMyAccount", []),
          // Create New Account Routes
          customTransitionRoute(const JoinFacebookFirst(),
              "signin_introduction", "Introduction", [
            customTransitionRoute(
                const JoinFacebookSecond(), "signin_fullname", "FullName", [
              customTransitionRoute(
                  const JoinFacebookThird(), "signin_email", "Email", [
                customTransitionRoute(const JoinFacebookSeventh(),
                    "signin_password", "Password", [
                  customTransitionRoute(
                      const JoinFacebookSixth(), "signin_gender", "Gender", [
                    customTransitionRoute(const JoinFacebookLast(),
                        "signin_finish", "Finish", []),
                  ]),
                ]),
              ]),
            ]),
          ]),
        ]),
      ]);
}
