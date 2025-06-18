import 'package:anwel/features/auth/login/presentation/pages/login_page.dart';
import 'package:anwel/features/auth/signup/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import '../routing/routes.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';


class AppRouter {
 Route? generateRoute(RouteSettings settings) {
   switch (settings.name) {
     case Routes.splashScreen:
       return _createRoute(const SplashScreen());
     case Routes.onBoardingScreen:
       return _createRoute(const OnboardingScreen());
     case Routes.loginScreen:
       return _createRoute(const LoginPage());
     case Routes.signupScreen:
       return _createRoute(const SignupPage());


     default:
       return null;
   }
 }


 PageRouteBuilder _createRoute(Widget page) {
   return PageRouteBuilder(
     transitionDuration: const Duration(milliseconds: 400),
     pageBuilder: (context, animation, secondaryAnimation) => page,
     transitionsBuilder: (context, animation, secondaryAnimation, child) {
       return FadeTransition(
         opacity: animation,
         child: child,
       );
     },
   );
 }
}
