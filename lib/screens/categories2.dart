import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../category2.dart';

class Categories2 extends StatelessWidget {
  Categories2({super.key});
  Map<String, int> ecommerceCategories = {
    "Electronics": 1234,
    "Fashion": 2345,
    "Home & Garden": 3456,
    "Health & Beauty": 4567,
    "Sports & Outdoors": 5678,
    "Toys & Games": 6789,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.black),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 45),
              child: Row(
                children: [
                  const Icon(Icons.search),
                  Expanded(
                    child: TextFormField(
                      decoration:
                          const InputDecoration(hintText: "Search Categories"),
                    ),
                  )
                ],
              )),
          Expanded(
            child: SizedBox(
              height: 350.0,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  shrinkWrap: true,
                  itemCount: ecommerceCategories.length,
                  itemBuilder: (BuildContext context, int index) {
                    {
                      final entry = ecommerceCategories.entries.toList()[index];

                      return Category2(
                        title: entry.key,
                        productsNum: entry.value,
                      );
                    }
                  }),
            ),
          )
        ],
      ),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black),
                child: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text("Home"),
              const SizedBox(
                width: 80,
              ),
              const Icon(Icons.shopping_cart),
              const SizedBox(
                width: 80,
              ),
              const Icon(Icons.notifications_active),
              const SizedBox(
                width: 80,
              ),
              const Icon(Icons.person)
            ],
          ),
        )
      ],
    );
  }
}
