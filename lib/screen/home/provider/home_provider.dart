import 'package:flutter/cupertino.dart';
import '../modal/home_modal.dart';

class HomeProvider extends ChangeNotifier {
  List<HomeModal> productList = [
    HomeModal(
      image: "📱",
      name: "14 Pro Max",
      price: 949.49,
      about:
          "12+12+48 Rear Camera Set up.\nA16 Bionic chip with 16 Bellion tranistors.\nNew Ios 16.\nBrand new Dynamic.",
      quantity: 1,
    ),
    HomeModal(
      image: "🖥️",
      name: "iMac m1(2021)",
      price: 1299.49,
      about:
          "Actual diagonal screen size is 59.69 cm(23.5 inches).\n8-core CPU and up to 8‑core GPU.\nUp to 16GB unified memory.\nMagic Keyboard with Touch ID.",
      quantity: 1,
    ),
  ];

  List<HomeModal> cartList = [];

  void addtocart(HomeModal datam) {
    cartList.add(datam);
    notifyListeners();
  }

  void updatequantity(HomeModal datam, int index) {
    productList[index] = datam;
    notifyListeners();
  }
}
