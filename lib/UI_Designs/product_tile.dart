import 'package:api_integration/Model/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {

  final ProductModel products;
  ProductTile(this.products);

  @override
  Widget build(BuildContext context) {
  return Card(
    elevation: 2,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 180,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: CachedNetworkImage(
                  imageUrl: products.image,
                ),
              ),

            ],
          ),
           SizedBox(height: 8),
          Text(
            products.title,
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),
          ),
          SizedBox(height: 8),
          Text(
            products.category,
          ),
          SizedBox(height: 8),
          Text('\$${products.price}',),

          SizedBox(height: 8),
          Text(
            products.description,
          ),
          SizedBox(height: 8),
          Container(
            height: 30,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.green
            ),
            child: Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(products.rating.rate.toString()),
                  ),
                  Icon(Icons.star,size: 16,)
                ],
              ),
            ),
          )
        ],
      ),
    ),

  );
  }

}