import 'package:flutter/material.dart';
import 'package:swigato/colors.dart';
import 'package:swigato/dimensions.dart';
import 'package:swigato/widgets/app_icon.dart';
import 'package:swigato/widgets/big_text.dart';
import 'package:swigato/widgets/paragraph.dart';
import 'package:swigato/widgets/price_counter.dart';

final String boilerText =
    "Chicken marinated in a spiced yoghurt is placed in a large pot,then layered with fried onions(cheeky easy sub below!), fresh coriander/cilantre, then par boiled Indian basmati rice. The pot is then sealed with a tight fitting lid (or dough) and cooked on a low heat. This allows the chicken to cook in its own steam, the rice to cook in the chicken steam and the spices to infuse the rice. The result is a dish that is so fragrant and delicious, you’ll want to eat it straight out of the pot! This is a simplified version of the traditional method which involves marinating the chicken overnight and cooking the rice separately. This is a simplified version of the traditional method which involves marinating the chicken overnight and cooking the rice separately. This is a simplified version of the traditional method which involves marinating the chicken overnight and cooking the rice separately. This is a simplified version of the traditional method which involves marinating the chicken overnight and cooking the rice separately. This is a simplified version of the traditional method which involves marinating the chicken overnight and cooking the rice separately. This is a simplified version of the traditional method which involves marinating the chicken overnight and cooking the rice separately."
    "This is a simplified version of the traditional method which involves marinating the chicken overnight and cooking the rice separately. This is a simplified version of the traditional method which involves marinating the chicken overnight and cooking the rice separately. This is a simplified version of the traditional method which involves marinating the chicken overnight and cooking the rice separately. This is a simplified version of the traditional method which involves marinating the chicken overnight and cooking the rice separately. This is a simplified version of the traditional method which involves marinating the chicken overnight and cooking the rice separately. This is a simplified version of the traditional method which involves marinating the chicken overnight and cooking the rice separately. This is a simplified version of the traditional method which involves marinating the chicken overnight and cooking the rice separately. This is a simplified version of the traditional method which involves marinating the chicken overnight and cooking the rice separately. This is a simplified version of the traditional method which involves marinating the chicken overnight and cooking the rice separately. ";

class RecommendedFoodDetail extends StatefulWidget {
  final double price;
  const RecommendedFoodDetail({super.key, required this.price});

  @override
  State<RecommendedFoodDetail> createState() => _RecommendedFoodDetailState();
}

class _RecommendedFoodDetailState extends State<RecommendedFoodDetail> {
  int _quantity = 0;

  void _decrement() {
    if (_quantity == 0) return;
    setState(() {
      _quantity--;
    });
  }

  void _increment() {
    setState(() {
      _quantity++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3))
                    ]),
                child: Center(
                    child: BigText(
                  text: "Chinese Side",
                  size: Dimensions.font26,
                )),
              ),
            ),
            backgroundColor: AppColors.yellowColor,
            pinned: true,
            expandedHeight: 200,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/image0.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  child: Paragraph(
                    text: boilerText,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: _decrement,
                icon: AppIcon(
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize26,
                ),
              ),
              BigText(
                  text: "\$${widget.price.toStringAsFixed(2)} X $_quantity"),
              IconButton(
                onPressed: _increment,
                icon: AppIcon(
                  icon: Icons.add,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize26,
                ),
              )
            ],
          ),
          Container(
            height: Dimensions.screenHeight / 6,
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(Dimensions.radius20)),
                color: Color.fromARGB(255, 235, 235, 231)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white),
                  height: Dimensions.screenHeight / 16,
                  width: Dimensions.screenWidth / 7,
                  child: AppIcon(
                    backgroundColor: Colors.white,
                    icon: Icons.favorite,
                    size: Dimensions.font26,
                    iconColor: AppColors.mainColor,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.mainColor),
                    height: Dimensions.screenHeight / 12,
                    width: Dimensions.screenWidth / 2.3,
                    child: Center(
                      child: Text(
                        "\$${(widget.price * _quantity).toStringAsFixed(2)} Add to cart",
                        style: TextStyle(
                            fontSize: Dimensions.font20, color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
