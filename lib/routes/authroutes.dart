import 'package:go_router/go_router.dart';
import 'package:ostello/ui/pages/forgot_passowrd/checkmail/page.dart';
import 'package:ostello/ui/pages/forgot_passowrd/checkphone/page.dart';
import 'package:ostello/ui/pages/forgot_passowrd/page.dart';
import 'package:ostello/ui/pages/login/page.dart';
import 'package:ostello/ui/pages/otp/page.dart';
import 'package:ostello/ui/pages/signup/mobile/page.dart';
import 'package:ostello/ui/pages/signup/name/page.dart';

List<RouteBase> authroutes = [
  GoRoute(
    path: LoginPage.route,
    name: LoginPage.routeName,
    builder: (context, state) => LoginPage(),
  ),
  GoRoute(
    path: OtpPage.route,
    name: OtpPage.routeName,
    builder: (context, state) => OtpPage(
      phoneNumber: state.extra as String?,
    ),
  ),
  GoRoute(
    path: SignupEmail.route,
    name: SignupEmail.routeName,
    builder: (context, state) => SignupEmail(),
  ),
  GoRoute(
    path: SignupNamePage.route,
    name: SignupNamePage.routeName,
    builder: (context, state) => SignupNamePage(),
  ),
  GoRoute(
    path: ForgotPasswordpage.route,
    name: ForgotPasswordpage.routeName,
    builder: (context, state) => ForgotPasswordpage(),
  ),
  GoRoute(
    path: CheckmailPage.route,
    name: CheckmailPage.routeName,
    builder: (context, state) => CheckmailPage(),
  ),
  GoRoute(
    path: CheckPhone.route,
    name: CheckPhone.routeName,
    builder: (context, state) => CheckPhone(),
  ),
];
