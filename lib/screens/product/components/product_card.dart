import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';

import '../../../constants/app_constants.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productImage;
  final Function()? onPressed;
  final Function()? onFavouritePress;

  const ProductCard({super.key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    this.onPressed,
    this.onFavouritePress
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(4, 4)),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: FullScreenWidget(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    child: CachedNetworkImage(
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.contain),
                        ),
                      ),
                      width: 75.0,
                      height: 75.0,
                      imageUrl: productImage,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => CircularProgressIndicator.adaptive(value: downloadProgress.progress),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              Text(
                productName,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      r'$'+productPrice,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: kPrimaryColour,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                    IconButton(
                        onPressed: onFavouritePress,
                        icon: const Icon(
                            size: 20,
                            color: kPrimaryColour,
                            Icons.favorite_border))
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
