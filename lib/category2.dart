import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category2 extends StatelessWidget {
  final String title;
  final int productsNum;

  const Category2({super.key, required this.title, required this.productsNum});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              image: AssetImage("assets/images/category.avif"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            Spacer(),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromRGBO(255, 255, 255, 0.6),
              ),
              width: double.infinity,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                    textAlign: TextAlign.center,
                  ),
                  Text("${productsNum} product",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15))
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
