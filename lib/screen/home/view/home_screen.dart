import 'package:ecommerce_provider/screen/home/modal/home_modal.dart';
import 'package:ecommerce_provider/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            "Apple Store",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'cart_screen');
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: GridView.builder(
          itemCount: homeProvider!.productList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                HomeModal datam = HomeModal(
                  image: homeProvider!.productList[index].image,
                  name: homeProvider!.productList[index].name,
                  price: homeProvider!.productList[index].price,
                  about: homeProvider!.productList[index].about,
                );
                Navigator.pushNamed(context, 'detail_screen', arguments: datam);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${homeProvider!.productList[index].image}",
                      style: TextStyle(
                        fontSize: 80,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$ ${homeProvider!.productList[index].price}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "${homeProvider!.productList[index].name}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 18,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 15,
                        ),
                        Icon(
                          Icons.star_border,
                          color: Colors.amber,
                          size: 15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "See the detail> ",
                          style: TextStyle(
                            color: Colors.blue.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
