import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/text_theme.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text("Product Page",style: MyTextTheme.bodyHead.copyWith(fontSize: 22)),
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.arrow_back_ios),
        )
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(CupertinoIcons.doc_text_search,size: 80,color: Color.fromARGB(255, 71, 71, 71)),
            const SizedBox(height: 5,),
            Text("It's Empty",style: MyTextTheme.bodyHead.copyWith(fontSize: 18)),
            const SizedBox(height: 5,),
            Text("Tap on + button to add products",style: MyTextTheme.bodyText.copyWith(fontSize: 16,color: const Color.fromARGB(255, 128, 128, 128))),

          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
        ),
          onPressed: (){},
          child: const Icon(Icons.add)
        ),
    );
  }
}