import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scratch_advanture/app/helpers/app_haptic.dart';

class HomeController extends GetxController {
  final storage = GetStorage();
  var scratchedImages = <String>[].obs;

  // final RxList<String> imagePaths = List.generate(52, (index) => 'assets/pack1/SS${index + 1}.jpg').obs;
  final RxList<String> imagePaths = List.generate(210, (index) => 'assets/pack2/Position ${index + 1}.jpg').obs;

  RxBool isScratching = false.obs;

  @override
  void onInit() {
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
