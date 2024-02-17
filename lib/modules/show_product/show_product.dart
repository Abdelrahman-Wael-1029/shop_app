import 'package:flutter/material.dart';
import 'package:shop_app/models/home/home_model.dart';
import 'package:shop_app/shared/constants/constant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ShowProduct extends StatelessWidget {
  ShowProduct({
    super.key,
    required this.productsModel,
  });

  ProductsModel productsModel;
  var controllerProductView = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Container(
                        height: heightProduct,
                        child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              buildProductView(productsModel.images[index]),
                          itemCount: productsModel.images.length,
                          controller: controllerProductView,
                        ),
                      ),
                      SmoothPageIndicator(
                        controller: controllerProductView,
                        count: productsModel.images.length,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                    },
                    icon: Icon(
                      (productsModel.in_favorites)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      productsModel.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    productsModel.price.round().toString(),
                    style: const TextStyle(
                      color: AppColors.fourthColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                productsModel.description,
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.secondaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              child: const Text('Add to Cart'),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Buy Now'),
            ),
          ),
        ]),
      ),
    );
  }

  buildProductView(String image) {
    return Image.network(image,
        fit: BoxFit.fitHeight,
        width: double.infinity,
        height: 250, errorBuilder: (context, error, stackTrace) {
      return const Text('');
    });
  }
}