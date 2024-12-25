import 'package:flutter/material.dart';
import 'package:swigato/colors.dart';
import 'package:swigato/dimensions.dart';

class PriceCounter extends StatefulWidget {
  final double price;
  final VoidCallback onSubmit;
  const PriceCounter({super.key, required this.price, required this.onSubmit});

  @override
  State<PriceCounter> createState() => _PriceCounterState();
}

class _PriceCounterState extends State<PriceCounter> {
  int _quantity = 0;

  void _increment() {
    setState(() {
      _quantity++;
    });
  }

  void _decrement() {
    if (_quantity == 0) return;
    setState(() {
      _quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.screenHeight / 6,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(Dimensions.radius20)),
          color: Color.fromARGB(255, 235, 235, 231)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white),
            height: Dimensions.screenHeight / 12,
            width: Dimensions.screenWidth / 3.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: _decrement,
                  icon: Icon(
                    Icons.remove,
                    size: Dimensions.font26,
                  ),
                ),
                Text(
                  "$_quantity",
                  style: TextStyle(fontSize: Dimensions.font26),
                ),
                IconButton(
                  onPressed: _increment,
                  icon: Icon(
                    Icons.add,
                    size: Dimensions.font26,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: widget.onSubmit,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.mainColor),
              height: Dimensions.screenHeight / 12,
              width: Dimensions.screenWidth / 2.3,
              child: Center(
                child: Text(
                  "\$${widget.price * _quantity} Add to cart",
                  style: TextStyle(
                      fontSize: Dimensions.font20, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
