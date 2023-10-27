import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:myapp/controllers/itembag_controller.dart';
import 'package:myapp/controllers/product_controller.dart';
import 'package:myapp/model/product_model.dart';

import '../constants/themes.dart';

class ProductCardWidget extends ConsumerWidget {
  const ProductCardWidget({
    super.key,
    required this.productIndex,
  });

  final int productIndex;

  get favoriteProducts => null;

  get products => null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(proudctNotifierProvider);
    return Container(
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.all(0),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        children: [
          Container(
            width: 130,
            margin: const EdgeInsets.all(12),
            child: Image.asset(
              product[productIndex].imgUrl,
              height: 90,
              width: 90,
            ),
          ),
          const Gap(4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                product[productIndex].title,
                style: AppTheme.kCardTitle,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                product[productIndex].shortDescription,
                style: AppTheme.kBodyText,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\₹${product[productIndex].price}',
                    style: AppTheme.kCardTitle,
                  ),
                  IconButton(
                      onPressed: () {
                        ref.read(proudctNotifierProvider.notifier).isSelectItem(
                            product[productIndex].pid, productIndex);

                        // Itemka ayuu ku darayaa baga
                        if (product[productIndex].isSelected == false) {
                          ref.read(itemBagProvider.notifier).addNewItemBag(
                                ProductModel(
                                    pid: product[productIndex].pid,
                                    imgUrl: product[productIndex].imgUrl,
                                    title: product[productIndex].title,
                                    price: product[productIndex].price,
                                    shortDescription:
                                        product[productIndex].shortDescription,
                                    longDescription:
                                        product[productIndex].longDescription,
                                    review: product[productIndex].review,
                                    rating: product[productIndex].rating),
                              );
                        } else {
                          ref
                              .read(itemBagProvider.notifier)
                              .removeItem(product[productIndex].pid);
                        }
                      },
                      icon: Icon(
                        product[productIndex].isSelected
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        size: 30,
                        color: Colors.red,
                      ))
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
