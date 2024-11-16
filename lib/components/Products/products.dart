import 'package:almohamady/components/Home_page/home_model/home_model.dart';
import 'package:almohamady/service/Cubit/Shop_cubit/shop_cubit.dart';
import 'package:almohamady/service/Cubit/Shop_cubit/shop_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Products_Screen extends StatelessWidget {
  const Products_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        ShopCubit cubit = ShopCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.homeModel != null,
          builder: (context) => BuildProduct(cubit.homeModel, size, context),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget BuildProduct(HomeModel? model, Size size, context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: model?.data?.banners.map((e) {
              print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
              return Image(
                image: NetworkImage(
                  e.image,
                ),
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return Center(child: Text('Error loading image'));
                },
              );
            }).toList(),
            options: CarouselOptions(
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'New Products',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 7.0,
            crossAxisSpacing: 7.0,
            childAspectRatio: 1 / 1.5,
            children: List.generate(
              model!.data!.products.length,
              (index) => Build_Generate_Product(
                  model.data!.products[index], size, context),
            ),
          )
        ],
      ),
    );
  }

  Widget Build_Generate_Product(Products Model, Size size, context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image(
                  image: NetworkImage(Model.image),
                  width: double.infinity,
                  height: size.height * 0.2,
                  // fit: BoxFit.cover,
                ),
              ),
              if (Model.discount != 0)
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(8.0),
                      // topRight: Radius.circular(5.0),
                    ),
                    color: Colors.red,
                  ),
                  child: Text('DISCOUNT',
                      style: Theme.of(context).textTheme.bodySmall),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 8.0,
              top: 8.0,
            ),
            child: Text(
              Model.name,
              style: const TextStyle(
                color: Colors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 8.0),
                child: Text(
                  '${Model.price}\$',
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
              if (Model.discount != 0)
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 5.0),
                  child: Text(
                    '${Model.old_price}',
                    style: const TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  ShopCubit.get(context).changeFavourite(Model.id!);
                  print(
                      'Id : ${Model.id} and Isfavourit : ${Model.in_favorites}');
                },
                icon: Icon(
                  ShopCubit.get(context).Favourits[Model.id]!
                      ? Icons.favorite_sharp
                      : Icons.favorite_border_outlined,
                  color: ShopCubit.get(context).Favourits[Model.id]!
                      ? Colors.red
                      : Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
