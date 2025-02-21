import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scratch_advanture/app/helpers/app_haptic.dart';

class HomeController extends GetxController {
  final storage = GetStorage();
  var scratchedImages = <String>[].obs;

  // final RxList<String> imagePaths = List.generate(52, (index) => 'assets/pack1/SS${index + 1}.jpg').obs;
  // final RxList<String> imagePaths = List.generate(210, (index) => 'assets/pack2/Position ${index + 1}.jpg').obs;
  var imagePaths = <String>[].obs;

  RxBool isScratching = false.obs;

  @override
  void onInit() {
    int level = Get.arguments ?? 1;
    int start = 0, end = 0;
    if (level == 1) {
      start = 1;
      end = 46;
    } else if (level == 2) {
      start = 47;
      end = 105;
    } else if (level == 3) {
      start = 106;
      end = 210;
    }
    imagePaths.value = List.generate(end - start + 1, (index) => 'assets/pack2/Position ${start + index}.jpg');
    loadScratchedImages();
    super.onInit();
  }

  void loadScratchedImages() {
    scratchedImages.value = storage.read<List>('scratchedImages')?.cast<String>() ?? [];
  }

  void saveScratchedImage(String imagePath) {
    scratchedImages.add(imagePath);
    storage.write('scratchedImages', scratchedImages);
    update();
  }

  void removeScratchedImage(String imagePath) {
    scratchedImages.removeWhere((path) => path == imagePath);
    storage.write('scratchedImages', scratchedImages);
    update();
  }

  void resetScratchedImages() {
    AppHaptics.mediumImpact();
    scratchedImages.clear();
    storage.remove('scratchedImages');
    update();
  }
}
