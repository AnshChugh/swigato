import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swigato/colors.dart';
import 'package:swigato/dimensions.dart';
import 'package:swigato/pages/food/popular_food_detail.dart';
import 'package:swigato/pages/food/recommended_food_detail.dart';
import 'package:swigato/widgets/app_column.dart';
import 'package:swigato/widgets/big_text.dart';
import 'package:swigato/widgets/icon_and_text_widget.dart';
import 'package:swigato/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  int _currPageIndex = 0;
  final double _scaleFactor = 0.80;
  final double _height = Dimensions.pageViewContainer;

  //
  final PageController _pageController = PageController(viewportFraction: 0.85);

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageIndex.floor()) {
      var currScale = 1 - (_currPageIndex - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageIndex.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageIndex - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageIndex.floor() - 1) {
      var currScale = 1 - (_currPageIndex - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }

    return Transform(
      transform: matrix,
      child: GestureDetector(
        onTap: () {
          Get.to(() => PopularFoodDetail());
        },
        child: Stack(
          children: [
            Container(
                height: _height,
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/image${index % 2}.jpg')),
                )),
            // bottom  rectangle
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width30,
                    right: Dimensions.width30,
                    bottom: Dimensions.height30),
                height: Dimensions.pageViewTextContainer,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // Shadow color
                        offset: Offset(0, 5), // Horizontal and vertical offset
                        blurRadius: 10, // Softness of the shadow
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15, left: 15, right: 15, bottom: 10),
                  child: AppColumn(
                    text: "Chinese Side",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Container(
          padding: const EdgeInsets.only(left: 10),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(text: "India", color: AppColors.mainColor),
              Row(
                children: [
                  SmallText(
                    text: " Mumbai",
                    color: Colors.black54,
                  ),
                  Icon(Icons.arrow_drop_down)
                ],
              )
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.white,
                  )))
        ],
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 320,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currPageIndex = index;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return _buildPageItem(index);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        width: _currPageIndex == index ? 20.0 : 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          color: _currPageIndex == index
                              ? Colors.blue
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      );
                    }),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      BigText(
                        text: "Popular    ",
                      ),
                      SmallText(
                        text: "Food pairing",
                        color: AppColors.paraColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return GestureDetector(
                    onTap: () {
                      Get.to(() => RecommendedFoodDetail(price: 12.88,));
                    },
                    child: _buildListItem(index));
              },
              childCount: 5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              "assets/images/image${index % 2}.jpg",
              width: 150,
              height: 150,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: "Nutritious fruit meal is the healthiest",
                    color: Colors.black,
                  ),
                  SmallText(
                    text: "with chinese characteristics",
                    color: AppColors.paraColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndTextWidget(
                          icon: Icons.circle,
                          text: "Normal",
                          color: Colors.yellow.shade700),
                      IconAndTextWidget(
                          icon: Icons.location_on,
                          text: "17km",
                          color: Colors.cyan),
                      IconAndTextWidget(
                          icon: Icons.access_time_rounded,
                          text: "32min",
                          color: Colors.red),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
