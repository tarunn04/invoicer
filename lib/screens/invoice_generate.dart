// import 'package:flutter/material.dart';
// import 'package:invoicer/widget/custom_form_field.dart';

// import '../constants/text_theme.dart';

// class InvoiceGenerate extends StatefulWidget {
//   const InvoiceGenerate({super.key});

//   @override
//   State<InvoiceGenerate> createState() => _InvoiceGenerateState();
// }

// class _InvoiceGenerateState extends State<InvoiceGenerate> {
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 2,
//         title: Text("Generate Invoice",style: MyTextTheme.bodyHead.copyWith(fontSize: 22)),
//         leading: IconButton(
//           onPressed: (){},
//           icon: const Icon(Icons.arrow_back_ios),
//         ),
//       ),
//       body: Form(
//         child: Padding(
//           padding: const EdgeInsets.all(14.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomFormField(width: width, height: height, textBody: "Enter Customer Name", textHead: "Customer Name",),
//               const SizedBox(height: 10,),
              
//               CustomFormField(width: width, height: height, textBody: "Enter Customer Email", textHead: "Customer Email (Optional)",),
//               const SizedBox(height: 10,),
              
//               CustomFormField(width: width, height: height, textBody: "Enter Product Name", textHead: "Product Name",),
//               const SizedBox(height: 10,),

//               CustomFormField(width: width, height: height, textBody: "Select Category", textHead: "Product Category",),
//               const SizedBox(height: 10,),

//               Row(
//                   children: [
//                     CustomFormField(width: width*0.3, height: height,textBody: "l",textHead: "Length",),
//                     SizedBox(width: width*0.05,),
//                     CustomFormField(width: width*0.3, height: height,textBody: "w",textHead: "Width",),
//                     SizedBox(width: width*0.05,),
//                     CustomFormField(width: width*0.3, height: height,textBody: "b",textHead: "Breadth",),
//                   ],
//                 ),
//               const SizedBox(height: 10,),
//               Row(
//                 children: [
//                   CustomFormField(width: width*0.4, height: height, textBody: "Product price", textHead: "Price",),
//                   const SizedBox(width: 15,),
//                   CustomFormField(width: width*0.4, height: height, textBody: "Product Quantity", textHead: "Quantity",),
//                 ],
//               ),

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }