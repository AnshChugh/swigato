import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;

  // dynamic height padding and margin
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.12;
  static double height45 = screenHeight / 18.76;

  static double popularFoodImgSize = screenHeight / 2.41;

  // dynamic width padding and margin
  static double width10 = screenWidth / 84.4;
  static double width15 = screenWidth / 56.27;
  static double width20 = screenWidth / 42.2;
  static double width30 = screenWidth / 28.12;
  static double width45 = screenWidth / 18.76;

  static double font15 = screenHeight / 56.27;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 36;

  static double iconSize24 = screenWidth / 35.17;
  static double iconSize16 = screenWidth / 52.75;

  static double radius10 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;
}
