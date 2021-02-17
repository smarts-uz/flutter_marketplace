import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marketplace/config/colors.dart';
import 'package:flutter_marketplace/widgets/product_card_widget.dart';

import 'package:flutter_marketplace_service/service/product/cubit/product_cubit.dart';
import 'package:flutter_marketplace_service/service/product/product_repository.dart';
import 'package:shimmer/shimmer.dart';

class ProductCardsWidget extends StatefulWidget {
  ProductCardsWidget({
    Key key,
    @required this.title,
    this.named = true,
    this.vertical = false,
    this.perCol = 3,
    @required this.type,
  }) : super(key: key);

  final String title;
  final bool named;
  final bool vertical;
  final double perCol;
  final String type;

  @override
  _ProductCardsWidgetState createState() => _ProductCardsWidgetState();
}

class _ProductCardsWidgetState extends State<ProductCardsWidget> {
  final productRepository = ProductRepository();

  @override
  Widget build(BuildContext context) {
    bool isBestSaller = widget.type == 'getOfBestSeller';

    return Column(children: [
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 16,
            color: MyColors.mirage,
          ),
        ),
      ),
      BlocProvider<ProductCubit>(
        create: (context) => _initType(),
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductInitial || state is ProductLoadingState) {
              return widget.vertical
                  ? _getVerticalViewShimmer(isBestSaller)
                  : _getHorizontalViewShimmer(isBestSaller);
            } else if (state is ProductLoadedState) {
              return widget.vertical
                  ? _getVerticalView(state, isBestSaller)
                  : _getHorizontalView(state, isBestSaller);
            } else {
              return Container();
            }
          },
        ),
      ),
    ]);
  }

  Widget _getVerticalViewShimmer(bool isBestSaller) {
    return Container(
      height: 335,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            width: 180,
            child: Shimmer.fromColors(
              baseColor: MyColors.shimmerBaseColor,
              highlightColor: MyColors.shimmerHighlightColor,
              child: Container(height: double.infinity, color: Colors.white),
            ),
          );
        },
      ),
    );
  }

  Widget _getHorizontalViewShimmer(bool isBestSaller) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      children: List.generate(
        3,
        (index) => Container(
          width: MediaQuery.of(context).size.width / widget.perCol,
          padding: EdgeInsets.symmetric(vertical: 9, horizontal: 10),
          child: Shimmer.fromColors(
            baseColor: MyColors.shimmerBaseColor,
            highlightColor: MyColors.shimmerHighlightColor,
            child: Container(height: 180, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _getVerticalView(ProductLoadedState state, bool isBestSaller) {
    return Container(
      height: 335,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: state.list.data.length,
        itemBuilder: (context, index) {
          return Container(
            width: 180,
            child: ProductCardWidget(
              named: widget.named,
              product: state.list.data[index],
              isBestSaller: isBestSaller,
            ),
          );
        },
      ),
    );
  }

  Widget _getHorizontalView(ProductLoadedState state, bool isBestSaller) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      children: List.generate(
        state.list.data.length,
        (index) => Container(
          width: MediaQuery.of(context).size.width / widget.perCol,
          child: ProductCardWidget(
            named: widget.named,
            product: state.list.data[index],
            isBestSaller: isBestSaller,
          ),
        ),
      ),
    );
  }

  ProductCubit _initType() {
    switch (widget.type) {
      case 'getOfTodaysDeal':
        return ProductCubit(productRepository)..getOfTodaysDeal();
      case 'getOfFeatured':
        return ProductCubit(productRepository)..getOfFeatured();
      case 'getOfBestSeller':
        return ProductCubit(productRepository)..getOfBestSeller();
      default:
        return ProductCubit(productRepository);
    }
  }
}
