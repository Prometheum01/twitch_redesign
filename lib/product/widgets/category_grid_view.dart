import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:twitch_design/product/model/category_model.dart';
import 'package:twitch_design/product/widgets/category_button.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.5),
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: context.dynamicHeight(0.1),
        ),
        itemCount: CategoryModel.dummyList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CategoryButton(model: CategoryModel.dummyList[index]),
          );
        },
      ),
    );
  }
}
