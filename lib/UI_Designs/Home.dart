import 'package:api_integration/UI_Designs/product_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../Controller/product_controller.dart';

void main(){
  runApp(MaterialApp(home: HomePage(),
  debugShowCheckedModeBanner: false,));
}
class HomePage extends StatelessWidget{

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.deepOrange,
       leading: Icon(Icons.arrow_back_ios_new_outlined),
       actions: [
         IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart))
       ],
     ),
     body: Column(
       children: [
         Padding(
           padding: const EdgeInsets.all(20.0),
           child: Row(
             children: [
               Expanded(child: Text("Shop Me",
                 style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),))
             ],
           ),
         ),
         Expanded(
           child: Obx(
                 () {
               if (productController.isLoading.value) {
                 return Center(child: CircularProgressIndicator());
               } else
                 return StaggeredGridView.countBuilder(
                   crossAxisCount: 2,
                   itemCount: productController.productList.length,
                   crossAxisSpacing: 8,
                   mainAxisSpacing: 8,
                   itemBuilder: (context, index) {
                     return ProductTile(productController.productList[index]);
                   },
                   staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                 );
             },
           ),
         ),
       ],
     ),
   );
  }

}

