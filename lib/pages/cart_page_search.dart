import 'package:flutter/material.dart';

class CartSearch extends StatefulWidget {
  @override
  _CartSearchState createState() => _CartSearchState();
}

class _CartSearchState extends State<CartSearch> {
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            IconButton(icon: Icon(Icons.arrow_back_outlined), onPressed: (){
              Navigator.pop(context);
            }),

            SizedBox(width: 20.0),
            Text("Населенний пунст", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),)
          ],

        ),
         Padding(
           padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
           child: ClipRRect(
             borderRadius: BorderRadius.circular(4.0),
             child: Container(
               height:50,
              color: Color.fromRGBO(242,243,245, 1),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: Center(
                    child: ListTile(
                      leading: Icon(Icons.search),
                      title: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                            hintText: 'Search', border: InputBorder.none),
                      ),
                      // trailing: new IconButton(icon: new Icon(Icons.cancel), onPressed: () {
                      //   controller.clear();
                      // },),
                    ),
                  ),

              ),
        ),
           ),
         ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child:ListView.separated(
             shrinkWrap: true,
             itemCount: 5,
            separatorBuilder: (BuildContext context, int index) =>
               Divider(height: 1.0,),
             itemBuilder: (context, index) => itemView(),
           ),

        ),
      ],
    );
  }

  Row itemView() => Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 4.0),
          Text("Москва"),
          Text("г. Москва, Россия"),
          SizedBox(height: 4.0,),
        ],
      )
    ],
  );
}


