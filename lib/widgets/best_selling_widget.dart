import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marketplace/config/colors.dart';
import 'package:flutter_marketplace/widgets/best_selling_card_widget.dart';

import 'package:flutter_marketplace_service/service/product/cubit/product_cubit.dart';
import 'package:flutter_marketplace_service/service/product/product_repository.dart';

class BestSellingWidget extends StatefulWidget {
  BestSellingWidget({
    Key key,
    this.title,
    this.named,
    this.vertical,
    this.perCol,
    this.type,
  }) : super(key: key);

  final String title;
  final bool named;
  final bool vertical;
  final double perCol;
  final String type;

  @override
  _BestSellingWidgetState createState() => _BestSellingWidgetState();
}

class _BestSellingWidgetState extends State<BestSellingWidget> {
  final productRepository = ProductRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductCubit>(
      create: (context) => _initType(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductInitial || state is ProductLoadingState) {
            return Container();
          } else if (state is ProductLoadedState) {
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
              widget.vertical
                  ? _getVerticalView(state)
                  : _getHorizontalView(state)
            ]);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _getVerticalView(ProductLoadedState state) {
    return Container(
      height: 335,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            width: 180,
            child: BestSellingCardWidget(
                named: widget.named, product: state.list.data[index]),
          );
        },
      ),
    );
  }

  Widget _getHorizontalView(ProductLoadedState state) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      children: List.generate(
        state.list.data.length,
        (index) => Container(
          width: MediaQuery.of(context).size.width / widget.perCol,
          child: BestSellingCardWidget(
            named: widget.named,
            product: state.list.data[index],
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
