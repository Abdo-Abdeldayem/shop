import 'package:almohamady/components/Search/search_screen.dart';
import 'package:almohamady/core/custom_widgets/custom.dart';
import 'package:almohamady/service/Cubit/Shop_cubit/shop_cubit.dart';
import 'package:almohamady/service/Cubit/Shop_cubit/shop_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home_Page extends StatelessWidget {
  Home_Page({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        ShopCubit cubit = ShopCubit.get(context);
        return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            appBar: AppBar(
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              elevation: 0.0,
              title: Text(
                'ElMohmady',
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
              actions: [
                IconButton(
                    onPressed: () =>
                        Custom_Nav_push(context: context, page: SearchScreen()),
                    icon: Icon(
                      Icons.search,
                      color: Theme.of(context).appBarTheme.iconTheme!.color,
                    )),
              ],
            ),
            body: cubit.screen[cubit.current],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).colorScheme.surface,
              elevation: 0.0,
              selectedItemColor: Theme.of(context).colorScheme.onSurface,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.category_outlined,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  label: 'Categories',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  label: 'Favourites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  label: 'Settings',
                ),
              ],
              currentIndex: cubit.current,
              onTap: (index) {
                cubit.change_current(index);
              },
            ));
      },
    );
  }
}
