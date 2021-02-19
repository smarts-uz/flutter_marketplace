// import 'package:flutter/material.dart';
// import 'package:flutter_marketplace/utils/colors.dart';
// import 'package:flutter_marketplace/utils/debouncer.dart';
// import 'package:flutter_marketplace_service/models/search_response_model.dart';
// import 'package:flutter_marketplace_service/service/search/search_repository.dart';

// class SearchPage extends StatefulWidget {
//   SearchPage({Key key}) : super(key: key);

//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   final _debouncer = Debouncer(milliseconds: 500);
//   final TextEditingController _textController = new TextEditingController();
//   final searchRepository = new SearchRepository();

//   List<SearchedProduct> products = List<SearchedProduct>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: MyColors.white,
//       appBar: AppBar(
//         elevation: 5,
//         automaticallyImplyLeading: false,
//         titleSpacing: 0,
//         backgroundColor: MyColors.white,
//         title: Row(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(left: 5, right: 7),
//               child: InkWell(
//                 onTap: () => {Navigator.pop(context)},
//                 borderRadius: BorderRadius.circular(50),
//                 child: Padding(
//                   padding: EdgeInsets.all(10),
//                   child: Icon(Icons.arrow_back, color: Colors.black),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Material(
//                 borderRadius: BorderRadius.circular(5),
//                 child: SizedBox(
//                   height: 42,
//                   child: TextFormField(
//                     keyboardType: TextInputType.text,
//                     autofocus: true,
//                     controller: _textController,
//                     onChanged: onTextChange,
//                     decoration: InputDecoration(
//                       hintText: 'Искать...',
//                       isDense: true,
//                       contentPadding: EdgeInsets.only(top: 10),
//                       hintStyle: TextStyle(
//                         fontSize: 20,
//                         color: Colors.black45,
//                         fontWeight: FontWeight.w500,
//                       ),
//                       prefixIcon: Icon(
//                         Icons.search,
//                         size: 25,
//                         color: Colors.black45,
//                       ),
//                       prefixIconConstraints: BoxConstraints(
//                         minWidth: 50,
//                         minHeight: 10,
//                       ),
//                       suffixIcon: IconButton(
//                         onPressed: () => {_textController.clear()},
//                         icon: Icon(
//                           Icons.clear,
//                           color: Colors.black45,
//                         ),
//                       ),
//                       fillColor: Colors.white30,
//                       filled: true,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(width: 16)
//           ],
//         ),
//       ),
//       body: Container(
//         child: ListView.builder(
//           padding: EdgeInsets.only(top: 10),
//           physics: BouncingScrollPhysics(),
//           itemCount: products.length,
//           itemBuilder: (context, index) => InkWell(
//             onTap: () => {},
//             child: Container(
//               padding: EdgeInsets.only(top: 8),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         padding: EdgeInsets.symmetric(horizontal: 15),
//                         child: Icon(
//                           Icons.search,
//                           color: MyColors.regentGray,
//                           size: 28,
//                         ),
//                       ),
//                       Expanded(
//                         child: Text(
//                           "Пазл",
//                           style: TextStyle(color: MyColors.firefly),
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 1,
//                           softWrap: false,
//                         ),
//                       ),
//                       Container(
//                         padding: EdgeInsets.only(right: 10),
//                         child: Icon(
//                           Icons.chevron_right,
//                           color: MyColors.regentGray,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(left: 53, top: 8),
//                     child: Divider(height: 0, color: MyColors.alto),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   onTextChange(String text) {
//     if (text.isNotEmpty) {
//       _debouncer.run(() async {
//         SearchResponseModel res = await searchRepository.search(text);

//         if (res != null) {
//           products = res.products ?? List<SearchedProduct>();
//         }
//       });
//     } else {
//       products = List<SearchedProduct>();
//     }
//   }
// }
