import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/models/prodactAll.dart';
import 'package:orojct/fainalProjct/scriens/scrinssAdmins/addprodact.dart';
import 'package:orojct/fainalProjct/scriens/scrinssAdmins/apdatProdact.dart';
import 'package:orojct/fainalProjct/scriens/scrinssAdmins/deletProdact.dart';
import 'package:orojct/fainalProjct/widget/costomTextForm.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {



  @override






  @override
  Widget build(BuildContext context) {
   return  Center(
     child: GridView.count(
       crossAxisCount: 2,
       crossAxisSpacing: 12, // مسافة بين المربعات أفقياً
       mainAxisSpacing: 12,   // مسافة بين المربعات عمودياً
       shrinkWrap: true,
       physics: const NeverScrollableScrollPhysics(),
       padding: const EdgeInsets.all(16), // مسافة من الحواف
       childAspectRatio: 1, // نسبة عرض إلى ارتفاع 1:1 (مربع مثالي)
       children: [
         // مربع إضافة منتج - أزرق
         InkWell(
           onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Addprodact(),)),

           child: Container(
             decoration: BoxDecoration(
               color: Colors.blue,
               borderRadius: BorderRadius.circular(16), // زوايا ناعمة
             ),
             child: const Icon(
               Icons.add_shopping_cart,
               color: Colors.white,
               size: 48,
             ),
           ),
         ),
         // مربع حذف منتج - أبيض
         InkWell(
           onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>Deletprodact() ,)),

           child: Container(
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(16),
               boxShadow: [
                 BoxShadow(
                   color: Colors.black.withOpacity(0.05),
                   blurRadius: 8,
                   offset: Offset(0, 2),
                 ),
               ],
             ),
             child: const Icon(
               Icons.delete_outline,
               color: Colors.black,
               size: 48,
             ),
           ),
         ),

         Container(
           decoration: BoxDecoration(
             color: Colors.black,
             borderRadius: BorderRadius.circular(16),
           ),
           child: const Icon(
             Icons.account_circle_outlined,
             color: Colors.white,
             size: 48,
           ),
         ),

         InkWell(
           onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Apdatprodact(),)),
           
           child: Container(
             decoration: BoxDecoration(
               color: Colors.blue.shade100,
               borderRadius: BorderRadius.circular(16),
             ),
             child: const Icon(
               Icons.edit_outlined,
               color: Colors.blue,
               size: 48,
             ),
           ),
         ),
       ],
     ),
   );
  }





  


}