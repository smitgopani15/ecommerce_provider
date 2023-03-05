import 'package:ecommerce_provider/screen/home/modal/home_modal.dart';
import 'package:ecommerce_provider/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeProvider? homeProvider;

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of(context, listen: false);
    HomeModal datam = ModalRoute.of(context)!.settings.arguments as HomeModal;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            "${datam.name}",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "${datam.image}",
                  style: TextStyle(
                    fontSize: 100,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Container(
                        child: Text(
                          "${datam.about}",
                          style: TextStyle(color: Colors.black45),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          "\$ ${datam.price}",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            homeProvider!.addtocart(datam);
                          },
                          child: Container(
                            height: 50,
                            width: 130,
                            alignment: Alignment.center,
                            child: Text(
                              "Add to cart",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
