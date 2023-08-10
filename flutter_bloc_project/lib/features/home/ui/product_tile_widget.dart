import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_project/features/home/models/home_product_data_model.dart';

import '../bloc/home_bloc.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTileWidget({super.key, required this.productDataModel, required this.homeBloc});

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            child: Image.asset(
              productDataModel.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productDataModel.name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(productDataModel.description,
                style: const TextStyle(fontWeight: FontWeight.w300),
              ),
            ],
          ),
          const SizedBox(width: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$ ${productDataModel.price}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  IconButton(
                      tooltip: 'Add To Wishlist',
                      mouseCursor: SystemMouseCursors.click,
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {
                        homeBloc.add(HomeProductWishlistButtonClickedEvent(
                          clickedProduct: productDataModel
                        ));
                      }),
                  IconButton(
                      tooltip: 'Add To Cart',
                      onPressed: () {
                        homeBloc.add(HomeProductCartButtonClickedEvent(
                          clickedProduct: productDataModel
                        ));
                      },
                      icon: const Icon(Icons.shopping_bag_outlined)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
