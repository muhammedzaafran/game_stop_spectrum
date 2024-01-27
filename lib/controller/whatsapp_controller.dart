import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/product_model.dart';

class GetWhatsappMsg extends GetxController {
  sendMessageOnWhatsApp({required ProductModel productModel}) async {
    String phone = "917012882584";
    var message =
        "\nI want to know about this product\nName :${productModel.productName}\nPrice :${productModel.price}";
    var whatsappUrl =
        "whatsapp://send?phone=$phone&text=${Uri.encodeComponent(message)}";
    var uri = Uri.parse(whatsappUrl);

    await launchUrl(uri)
        ? launchUrl(uri)
        : print(
        "Open WhatsApp app link or show a snackbar with a notification that WhatsApp is not installed");
  }
}
