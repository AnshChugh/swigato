import 'package:flutter/material.dart';
import 'package:swigato/colors.dart';
import 'package:swigato/widgets/big_text.dart';
import 'package:swigato/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  int _currPageIndex = 0;

  //
  final PageController _pageController = PageController(viewportFraction: 0.8);

  Widget _buildPageItem(int index) {
    return Stack(
      children: [
        // Bottom rectangle
        Positioned(
          left: 20,
          right: 20,
          top: 40,
          child: Container(
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/image${index % 2}.jpg')),
              )),
        ),
        // bottom  rectangle
        Positioned(
          left: 40,
          right: 40,
          bottom: 10,
          child: Container(
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: "Chinese Side",
                    color: AppColors.mainBlackColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                            5,
                            (index) => Icon(
                                  Icons.star,
                                  color: AppColors.mainColor,
                                  size: 15,
                                )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(
                        text: "4.5",
                        color: AppColors.textColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(
                        text: "1287",
                        color: AppColors.textColor,
                      ),
                      SizedBox(width: 10),
                      SmallText(
                        text: "comments",
                        color: AppColors.textColor,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.yellow.shade700,
                      ),
                      SmallText(
                        text: "Normal",
                        color: AppColors.textColor,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.location_on,
                        color: Colors.cyan,
                      ),
                      SmallText(
                        text: "17km",
                        color: AppColors.textColor,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.access_time_rounded,
                        color: Colors.red,
                      ),
                      SmallText(
                        text: "32min",
                        color: AppColors.textColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
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
                return _buildListItem(index);
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
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.yellow.shade700,
                      ),
                      SmallText(
                        text: "Normal",
                        color: AppColors.textColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.location_on,
                        color: Colors.cyan,
                      ),
                      SmallText(
                        text: "17km",
                        color: AppColors.textColor,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.access_time_rounded,
                        color: Colors.red,
                      ),
                      SmallText(
                        text: "32min",
                        color: AppColors.textColor,
                      ),
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
