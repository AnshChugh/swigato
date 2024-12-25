import 'package:flutter/material.dart';
import 'package:swigato/dimensions.dart';
import 'package:swigato/widgets/app_column.dart';
import 'package:swigato/widgets/app_icon.dart';
import 'package:swigato/widgets/big_text.dart';
import 'package:swigato/widgets/paragraph.dart';
import 'package:swigato/widgets/price_counter.dart';

final String boilerText =
    "Chicken marinated in a spiced yoghurt is placed in a large pot,then layered with fried onions(cheeky easy sub below!), fresh coriander/cilantre, then par boiled Indian basmati rice. The pot is then sealed with a tight fitting lid (or dough) and cooked on a low heat. This allows the chicken to cook in its own steam, the rice to cook in the chicken steam and the spices to infuse the rice. The result is a dish that is so fragrant and delicious, you’ll want to eat it straight out of the pot! This is a simplified version of the traditional method which involves marinating the chicken overnight and cooking the rice separately. This is a simplified version of the traditional method which involves marinating the chicken overnight and cooking the rice separately.";

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Dimensions.screenHeight,
        child: Stack(
          children: [
            Positioned(
                child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/image0.jpg'))),
            )),
            Positioned(
                top: Dimensions.height45,
                left: Dimensions.width20,
                right: Dimensions.width20,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppIcon(
                        icon: Icons.arrow_back_ios_new,
                      ),
                      AppIcon(
                        icon: Icons.shopping_cart_outlined,
                      ),
                    ])),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize - Dimensions.height30,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width30,
                    right: Dimensions.width30,
                    top: Dimensions.height10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: "Chinese Side"),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(text: "Introduce"),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Paragraph(
                          text: boilerText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: PriceCounter(price: 0.08, onSubmit: () {}),
    );
  }
}
