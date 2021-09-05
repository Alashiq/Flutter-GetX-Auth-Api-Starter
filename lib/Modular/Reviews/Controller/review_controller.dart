import 'package:flutterauthgetxstarter/Modular/Reviews/Models/review.dart';
import 'package:flutterauthgetxstarter/Modular/Reviews/Services/review_api.dart';
import 'package:flutterauthgetxstarter/View/Widgets/loading/loading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ReviewController extends GetxController {
  List<ReviewModel>? reviews;
  final box = GetStorage();

  bool homeScreen = false;



  loadReviews() async {
    print("Load Review");
    homeScreen = false;
    update();
    showLoading();
    //await Future.delayed(Duration(seconds: 2));
    if (box.hasData("token") == true) {
      reviews = await ReviewApi().loadReviewsAPI(box.read("token"));
      stopLoading();
      print(reviews?[0].name);
    //   print(reviews!.status);
    //   if (reviews!.status == 200) {
    //     print(reviews);
    //     Get.offAndToNamed("/home");
    //   } else if (user!.status == 404) {
    //     startScreen = true;
    //     update();
    //   } else if (user!.status == 401) {
    //     print("expired token 401");
    //     box.remove("token");
    //     Get.offAndToNamed("/login");
    //   } else {
    //     print("someting wrong 400");
    //     box.remove("token");
    //     Get.offAndToNamed("/login");
    //   }
    // } else {
    //   stopLoading();
    //   Get.offAndToNamed("/login");
    // }
  }

}
















}