// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:userinfo/feature/user_info/view/user_info_screen.dart';
import '../../../feature/user_info/binding/user_info_binding.dart';
import '../../constants/routes/navigation_constants.dart';

class AppPages {
  static const INITIAL = Routes.USER_INFO;
  static final List<GetPage>routes = [

    GetPage(
        name: Routes.USER_INFO,
        page: () => const UserInfoScreen(),
        binding: UserInfoBinding(),
        transition: Transition.rightToLeft,
    ),

  ];

}
