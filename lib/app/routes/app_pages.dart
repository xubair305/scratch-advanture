import 'package:get/get.dart';

import '../modules/choose_level/bindings/choose_level_binding.dart';
import '../modules/choose_level/views/choose_level_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/position_scratcher/bindings/position_scratcher_binding.dart';
import '../modules/position_scratcher/views/position_scratcher_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.CHOOSE_LEVEL;

  static final routes = [
    GetPage(name: _Paths.HOME, page: () => HomeView(), binding: HomeBinding()),
    GetPage(
      name: _Paths.POSITION_SCRATCHER,
      page: () => PositionScratcherView(),
      binding: PositionScratcherBinding(),
    ),
    GetPage(
      name: _Paths.CHOOSE_LEVEL,
      page: () => const ChooseLevelView(),
      binding: ChooseLevelBinding(),
    ),
  ];
}
