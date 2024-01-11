import 'dart:convert';

import 'package:ecommerce/components/custom_text.dart';
import 'package:ecommerce/screens/product/components/product_card.dart';
import 'package:ecommerce/screens/product_detail/product_detail_page.dart';
import 'package:ecommerce/screens/profile/profile_page.dart';
import 'package:ecommerce/services/networking/web_apis/product_api.dart';
import 'package:ecommerce/utils/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../constants/app_constants.dart';
import '../../utils/snackbar.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool isLoading = false;
  List productList = [];
  @override
  void initState() {
    getProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomNunitoText(text: 'E-Commerce'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
                onPressed: () {
                  nextScreen(context, const ProfilePage());
                },
                icon: const Icon(Icons.person_2_rounded)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FutureBuilder(
                future: Future.delayed(
                    const Duration(milliseconds: 500),
                        () => getProducts()),
                builder: (context, snapshot) {

                  if (snapshot.hasData) {
                    final productData = snapshot.data!;
                    if (productData != []) {
                      return GridView.builder(
                        itemCount: productList.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (_, index) {
                          var data = productList[index];
                          if(productList.isEmpty){

                            return const Center(
                              child: CustomNunitoText(text: 'No product available',),
                            );
                          }
                          if(productList.isNotEmpty){

                            return ProductCard(
                              productName: data['title'],
                              productPrice: data['price'].toString(),
                              productImage: data['image'],
                              onPressed: () {
                                nextScreen(context, ProductDetailPage(product: data,));
                              },
                              onFavouritePress: () {
                                addToFavorite(productId: data['id'], quantity: 1);
                              },
                            );}
                          return null;
                        }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, mainAxisExtent: 220),);
                    }
                  } else if (snapshot.hasError) {
                    // print(snapshot.error);
                    return const Text(
                        "Network Error, Please Refresh");
                  }
                  return const Center(child: CircularProgressIndicator.adaptive());
                }),

          ],
        ),
      ),
    );
  }
  
  Future getProducts() async {
    final result = await ProductApi.getProduct();
    final data = jsonDecode(result.body);

    productList = data;
    print(data);

    return productList;
  }
  void addToFavorite({
    required int productId,
    required int quantity,
}) async {
    final result = await ProductApi.addFavorite(productId: productId, quantity: quantity);
    final data = jsonDecode(result.body);
    if (result.statusCode == 200 || result.statusCode == 201) {
      if (!mounted) return;
      openSnackBar(context, "Product added Successful", kPrimaryColour);
    } else {
      if (!mounted) return;
      openSnackBar(context, "Error: Could not add product", kPrimaryColour);
    }

  }
}
