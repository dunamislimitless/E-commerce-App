import 'package:e_commerce_app/app/utils/colors.dart';
import 'package:flutter/material.dart';

class ColorSelectorPage extends StatefulWidget {
  const ColorSelectorPage({super.key});

  @override
  _ColorSelectorPageState createState() => _ColorSelectorPageState();
}

class _ColorSelectorPageState extends State<ColorSelectorPage> {
  List<Color> colors = [
    AppColors.discountColor,
    AppColors.product1,
    AppColors.product2,
    AppColors.reviewColor
  ];

  Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: colors.map((color) {
          bool isSelected = color == selectedColor;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedColor = color;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: isSelected
                    ? Border.all(
                        color: Colors.black,
                        width: 2,
                        style: BorderStyle.solid,
                      )
                    : null,
              ),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: color,
                child: isSelected
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                      )
                    : null,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
