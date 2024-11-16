import 'package:almohamady/components/Categories/model/cat_model.dart';
import 'package:almohamady/core/custom_widgets/custom.dart';
import 'package:almohamady/service/Cubit/Shop_cubit/shop_cubit.dart';
import 'package:almohamady/service/Cubit/Shop_cubit/shop_state.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Category_screen extends StatelessWidget {
  const Category_screen({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    ShopCubit cubit = ShopCubit.get(context);
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: cubit.catModel != null,
          builder: (context) => Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: ListView.separated(
                itemBuilder: (context, index) =>
                    BuildCat(context, cubit.catModel!.data.data[index]),
                separatorBuilder: (context, index) => Container(),
                itemCount: cubit.catModel!.data.data.length),
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget BuildCat(context, MainDataModel model) {
    return Container(
      margin: const EdgeInsetsDirectional.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image(
              image: NetworkImage(model.image!),
              width: 100.0,
              height: 100.0,
            ),
          ),
          custom_sized_box(Isvertical: false),
          Text(model.name!),
          const Spacer(),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
        ],
      ),
    );
  }
}
