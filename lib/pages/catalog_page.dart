import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marketplace/widgets/loading.dart';
import 'package:flutter_marketplace_service/config.dart';
import 'package:flutter_marketplace_service/service/category/category_api_provider.dart';
import 'package:flutter_marketplace_service/service/category/bloc/category_bloc.dart';

class CatalogPage extends StatefulWidget {
  CatalogPage({Key key}) : super(key: key);

  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final categoryRepository = CategoryProvider();

  double kDefaultPaddin = 10;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCategories();
  }

  _loadCategories() async {
    BlocProvider.of<CategoryBloc>(context).add(CategoryEvent.fetchCategory);
  }

  @override
  Widget build(BuildContext context) {
    return _getCategory();
  }

  Widget _getCategory() {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryError) {
          final error = state.error;
          String message = '${error.message}\nTap to Retry.';
          return Text(message);
        }
        if (state is CategoryLoading) {
          return Loading();
        }
        if (state is CategoryLoaded) {
          return GridView.count(
            mainAxisSpacing: kDefaultPaddin,
            crossAxisSpacing: kDefaultPaddin,
            crossAxisCount: 3,
            children: List.generate(state.data.length, (index) {
              return itemView(context, state, index);
            }),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Container itemView(BuildContext context, CategoryLoaded state, index) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 6),
            height: 80,
            width: double.infinity,
            child: InkWell(
              child: state.data[index].icon != null
                  ? CachedNetworkImage(
                      imageUrl: "${Config.filesUrl}/${state.data[index].icon}",
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          'assets/carousel.jpg',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    )
                  : SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        'assets/catalog.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2),
            width: double.infinity,
            child: state.data[index].name != null
                ? Text(
                    state.data[index].name,
                    style: TextStyle(
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  )
                : Text(
                    "null",
                    style: TextStyle(
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
          ),
        ],
      ),
    );
  }
}
