import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monarch_mart/view_model/simplehadler/checkVisibility_provider.dart';

import '../../../utils/widgets/all_product.dart';
import 'productcomponent/product_filter_sort.dart';
import 'productcomponent/search_card.dart';

class AndroidProductPage extends StatelessWidget {
  const AndroidProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Column(
            children: const [
              SearchaProduct(),
              ProductFilterSort(),
              Expanded(child: SingleChildScrollView(child: AllProducts()))
            ],
          ),
          Positioned(
              top: 82,
              right: 0,
              child: Consumer(
                builder: (context, ref, child) {
                  final checkVisible = ref.watch(checkvisibilityStateProvider);
                  return Visibility(
                    visible: checkVisible,
                    child: Container(
                      color: Colors.red,
                      width: 160,
                      height: 200,
                      child: Column(
                        children: [
                          ElevatedButton(onPressed: (){
                            
                          }, child: Text("prize sort"))
                        ],
                      ),
                    ),
                  );
                },
              ))
        ]),
      ),
    );
  }
}
