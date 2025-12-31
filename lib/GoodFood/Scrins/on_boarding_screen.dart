import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';


class OnBoardingScreen extends StatefulWidget {

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

 PageController  pageController =PageController();
 @override
  Widget build(BuildContext context) {
    // TODO: implement build
   bool isLastPage=false;
    return Scaffold(

      body:Stack(
        children: [ PageView(
          onPageChanged: (newValue) {


setState(() {
  isLastPage=(newValue==2);
});


          },
          controller: pageController,

          children: [

        Container(color: Colors.red,),
            Container(color: Colors.amber,),
            Container(color: Colors.blue,),


          ],


        ),
          Container(

              alignment: Alignment(0, 0.5),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                  children: [


                InkWell(child: Text("Skip"),

                onTap: () {
                  pageController.jumpToPage(2);
                },
                ),
                    SmoothPageIndicator(controller: pageController, count: 3),

                   isLastPage?
   InkWell(
   onTap: () {
   pageController.nextPage(duration: Duration(microseconds: 300), curve: Curves.bounceIn);
   },

   child: Text("Done"))

                   :InkWell(
                        onTap: () {
                          pageController.nextPage(duration: Duration(microseconds: 300), curve: Curves.bounceIn);
                        },

                        child: Text("Next")),
                  ],
                ),
              ))
    ]
      ) ,

    );
  }
}
