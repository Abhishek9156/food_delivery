import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_color.dart';
import 'package:food_delivery/utils/app_icon.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';

import '../../widgets/expandable_text_widgets.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcons(icon: Icons.clear),
                AppIcons(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(
                    child: BigText(
                  size: Dimensions.font26,
                  text: "Silver app bar",
                )),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radious20),
                        topLeft: Radius.circular(Dimensions.radious20))),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.mainColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food4.jpg",
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                child: ExpandableTextWidget(
                    text:
                        "Food is any substance consumed by an organism for nutritional support. Food is usually of pFood is any substance consumed by an organism for nutritional support. Food is usually of pFood is any substance consumed by an organism for nutritional support. Food is usually of pFood is any substance consumed by an organism for nutritional support. Food is usually of pFood is any substance consumed by an organism for nutritionalFood is any substance consumed by an organism for nutritional support. Food is usually of pFood is any substance consumed by an organism for nutritional support. Food is usually of pFood is any substance consumed by an organism for nutritional support. Food is usually of pFood is any substance consumed by an organism for nutritional support. Food is usually of pFood is any substance consumed by an organism for nutritional support. Food is usually of pFood is any substance consumed by an organism for nutritional support. Food is usually of pFood is any substance consumed by an organism for nutritional support. Food is usually of pFood is any substance consumed by an organism for nutritional support. Food is usually of pFood is any substance consumed by an organism for nutritional support. Food is usually of pFood is any substance consumed by an organism for nutritional support. Food is usually of p support. Food is usually of plant, animal, or fungal origin and contains essential nutrients such as carbohydrates, fats, proteins, vitamins, or minerals. The substance is ingested by an organism and assimilated by the organism's cells to provide energy, maintain life, or stimulate growth. Different species of animals have different feeding behaviours that satisfy the needs of their metabolisms and have evolved to fill a specific ecological niche within specific geographical contexts.Food is any substance consumed by an organism for nutritional support. Food is usually of plant, animal, or fungal origin and contains essential nutrients such as carbohydrates, fats, proteins, vitamins, or minerals. The substance is ingested by an organism and assimilated by the organism's cells to provide energy, maintain life, or stimulate growth. Different species of animals have different feeding behaviours that satisfy the needs of their metabolisms and have evolved to fill a specific ecological niche within specific geographical contexts."),
                margin: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
              ),
            ],
          ))
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(left: Dimensions.width20*2.5,
            right: Dimensions.width20*2.5,
            top: Dimensions.height10,
            bottom: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcons(iconSize: Dimensions.iconSize24,iconColor: Colors.white,backgroundColor: AppColors.mainColor,icon: Icons.remove),
                BigText(text: "\$12.88 "+" X "+" 0 ",color: AppColors.mainBlackColor,size: Dimensions.font26),
                AppIcons(iconSize: Dimensions.iconSize24,iconColor: Colors.white,backgroundColor: AppColors.mainColor,icon: Icons.add),

              ],
            ),
          ),
          Container(
            height: Dimensions.bottomHeighBar,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                color: AppColors.buttonBackGroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radious20 * 2),
                    topRight: Radius.circular(Dimensions.radious20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radious20),
                      color: Colors.white),
                  child:
                      Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                      ),


                ),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  child: BigText(text: "\$10 | Add to cart", color: Colors.white),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radious20),
                      color: AppColors.mainColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
