import 'package:flutterauthgetxstarter/Modular/Reviews/Models/review_list.dart';
import 'package:flutterauthgetxstarter/Modular/Reviews/Services/review_api.dart';
import 'package:flutterauthgetxstarter/View/Widgets/loading/loading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ReviewController extends GetxController {
  ReviewListModel? reviews;
  final box = GetStorage();

  bool homeScreen = false;
  bool homeScreenEmpity = false;

  loadReviews() async {
    homeScreen = false;
    update();
    showLoading();
    reviews = await ReviewApi().loadReviewsAPI();
    update();
    stopLoading();
    if (reviews?.status == 200) {
    } else if (reviews!.status == 204) {
      print("Empty");
    } else if (reviews!.status == 404) {
      homeScreen = true;
      update();
    } else if (reviews!.status == 401) {
      print("expired token 401nn");
      box.remove("token");
      Get.offAndToNamed("/login");
    } else {
      print("someting wrong 400");
      box.remove("token");
      Get.offAndToNamed("/login");
    }
  }
}

