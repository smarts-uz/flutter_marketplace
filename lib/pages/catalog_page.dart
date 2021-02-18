import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marketplace/utils/colors.dart';
import 'package:flutter_marketplace/widgets/cache_image_widget.dart';
import 'package:flutter_marketplace_service/service/category/category_api_provider.dart';
import 'package:flutter_marketplace_service/service/category/cubit/category_cubit.dart';
import 'package:shimmer/shimmer.dart';

class CatalogPage extends StatefulWidget {
  CatalogPage({Key key}) : super(key: key);

  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final categoryRepository = CategoryRepository();

  double kDefaultPaddin = 10;

  @override
  Widget build(BuildContext context) {
    return _getCategory();
  }

  Widget _getCategory() {
    return BlocProvider<CategoryCubit>(
      create: (context) => CategoryCubit(categoryRepository)..getAll(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryInitial || state is CategoryLoadingState) {
            return Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: List.generate(
                3,
                (index) => Container(
                  width: MediaQuery.of(context).size.width / 3,
                  padding: EdgeInsets.symmetric(vertical: 9, horizontal: 10),
                  child: Shimmer.fromColors(
                    baseColor: MyColors.shimmerBaseColor,
                    highlightColor: MyColors.shimmerHighlightColor,
                    child: Container(height: 80, color: Colors.white),
                  ),
                ),
              ),
            );
          } else if (state is CategoryLoadedState) {
            return Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: List.generate(
                state.list.data.length,
                (index) => Container(
                  width: MediaQuery.of(context).size.width / 3,
                  padding: EdgeInsets.symmetric(vertical: 9, horizontal: 10),
                  child: itemView(context, state, index),
                ),
              ),
            );
          } else {
            //      if (state is CategoryErrorState) {
            //   return Container();
            //   // final error = state.;
            //   // String message = '${error.message}\nTap to Retry.';
            //   // return Text(message);
            // } else
            return Container();
          }
        },
      ),
    );
  }

  Container itemView(BuildContext context, CategoryLoadedState state, index) {
    final category = state.list.data[index];

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 6),
            height: 80,
            width: double.infinity,
            child: InkWell(
              child: CacheImageWidget(
                url: category.icon,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2),
            width: double.infinity,
            child: Text(
              category.name ?? "",
              style: TextStyle(fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
