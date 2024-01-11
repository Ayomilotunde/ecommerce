import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/components/custom_text.dart';
import 'package:ecommerce/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../../utils/button.dart';

class ProductDetailPage extends StatefulWidget {
  final Map product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: CachedNetworkImage(
                    imageUrl: widget.product['image'],
                    imageBuilder: (context, imageProvider) => Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.contain),
                      ),
                    ),
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.center,
                  child: CustomNunitoText(
                    text: widget.product['title'].toString(),
                    textSize: 14,
                    textColor: kPrimaryColour,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                k20VerticalSpacing,
                const CustomNunitoText(text: 'Price',fontWeight: FontWeight.bold, textSize: 16,),
                k5VerticalSpacing,
                CustomNunitoText(
                  text: '$kCurrency${widget.product['price'].toString()}',
                  textSize: 16,
                  textColor: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
               k20VerticalSpacing,
                const CustomNunitoText(text: 'Category',fontWeight: FontWeight.bold, textSize: 16,),
                k5VerticalSpacing,
                CustomNunitoText(
                  text: widget.product['category'],
                  textSize: 16,
                  textColor: Colors.black,
                ),

                k20VerticalSpacing,
                const CustomNunitoText(text: 'Description',fontWeight: FontWeight.bold, textSize: 16,),
                k5VerticalSpacing,
                CustomNunitoText(
                  text: widget.product['description'],
                  textSize: 16,
                  textColor: Colors.black,
                ),

                const SizedBox(
                  height: 60,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Button(
                    block: true,
                    onPressed: () => {},
                    color: kPrimaryColour,
                    text: 'Place order',
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
