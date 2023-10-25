import 'package:flutter/material.dart';
import 'package:news_app/product/enum/category_enum.dart';
import 'package:kartal/kartal.dart';

class NewsCategoryList extends StatelessWidget {
  const NewsCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.sized.dynamicHeight(0.1),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: CategoryEnum.values.length,
        itemBuilder: (BuildContext context, int index) {
          final category = CategoryEnum.values[index];
          return InkWell(
            onTap: () {},
            child: SizedBox(
              height: 100,
              width: 100,
              child: Card(
                child: Padding(
                  padding: context.padding.low,
                  child: Text(
                    category.toString().split('.').last,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}



/*
InkWell(
            onTap: () {},
            child: SizedBox(
              height: 200,
              width: 100,
              child: Card(
                child: Padding(
                  padding: context.padding.low,
                  child: Text(
                    category.toString().split('.').last,
                  ),
                ),
              ),
            ),
          )
*/