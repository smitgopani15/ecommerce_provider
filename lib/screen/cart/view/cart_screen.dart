import 'package:ecommerce_provider/screen/home/modal/home_modal.dart';
import 'package:ecommerce_provider/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  HomeProvider? homeProvider;

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            "Cart List",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        body: Consumer<HomeProvider>(
          builder: (context, value, child) => ListView.builder(
            itemCount: homeProvider!.cartList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => ListTile(
              leading: Text(
                "${homeProvider!.productList[index].image}",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              title: Text(
                "${homeProvider!.productList[index].name}",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                "\$ ${homeProvider!.productList[index].price}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      HomeModal datam = HomeModal(
                        image: homeProvider!.productList[index].image,
                        price: homeProvider!.productList[index].price! / 2,
                        name: homeProvider!.productList[index].name,
                        quantity:
                            homeProvider!.productList[index].quantity! - 1,
                      );
                      homeProvider!.updatequantity(datam, index);
                    },
                    icon: Icon(
                      Icons.remove,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "${homeProvider!.productList[index].quantity}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      HomeModal datam = HomeModal(
                        image: homeProvider!.productList[index].image,
                        price: homeProvider!.productList[index].price! * 2,
                        name: homeProvider!.productList[index].name,
                        quantity:
                            homeProvider!.productList[index].quantity! + 1,
                      );
                      homeProvider!.updatequantity(datam, index);
                    },
                    icon: Icon(
                      Icons.add,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
