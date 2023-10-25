import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_color.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icons_and_text_widgets.dart';
import 'package:food_delivery/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currenPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Slider Section
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        //Dots indicatores
        DotsIndicator(
          dotsCount: 5,
          position: _currenPageValue.round(),
          decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: Size.square(9.0),
              activeSize: Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0))),
        ),
        //Popular Text
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10),
              Container(
                  margin: EdgeInsets.only(bottom: 2),
                  child: BigText(text: ".", color: Colors.black26)),
              SizedBox(width: Dimensions.width10),
              Container(
                child: SmallText(text: "Food pairing"),
              )
            ],
          ),
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                  left: Dimensions.width20,
                  bottom: Dimensions.width10,
                  right: Dimensions.width20),
              child: Row(
                children: [
                  //Image section
                  Container(
                    height: Dimensions.listViewImgSize,
                    width: Dimensions.listViewImgSize,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radious20),
                        color: Colors.white38,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/image/food1.jpg"))),

                  ),
                  //TextSection
                  Expanded(
                    child: Container(
                      height: Dimensions.listViewTextConSize,

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radious20),
                              bottomRight:
                                  Radius.circular(Dimensions.radious20)),
                          ),
                    child: Padding(padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [
                          BigText(text: "Nutrient food with meal"),
                          SmallText(text: "With special ingridents"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconsAndText(
                                  icon: Icons.circle_sharp,
                                  text: "Normal",
                                  iconColor: AppColors.iconColor1),
                              IconsAndText(
                                  icon: Icons.location_on,
                                  text: "17.2km",
                                  iconColor: AppColors.mainColor),
                              IconsAndText(
                                  icon: Icons.access_time_rounded,
                                  text: "32min",
                                  iconColor: AppColors.iconColor2)
                            ],
                          ),


                        ],
                      ),

                    ),
                    ),

                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currenPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currenPageValue.floor()) {
      var currScale = 1 - (_currenPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currenPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currenPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currenPageValue.floor() - 1) {
      var currScale = 1 - (_currenPageValue - index) * (1 - _scaleFactor);

      var currTrans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor / 2), 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radious30),
                color: Colors.blue,
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/image/food6.jpg")),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radious20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0))
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15, left: 15, right: 15),
                child: AppColumn(text: "Indian Food"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
