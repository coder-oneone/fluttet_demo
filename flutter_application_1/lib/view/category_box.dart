import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/color.dart';
import 'package:flutter_svg/svg.dart';

class CategoryBox extends StatelessWidget {
  final data;
  final Color selectedColor;
  final bool isSelected;
  final GestureTapCallback? onTap;

  const CategoryBox(
      {Key? key,
      required this.data,
      this.isSelected = false,
      this.onTap,
      this.selectedColor = actionColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: isSelected ? red : Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: shadowColor.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(1, 1))
                ],
                shape: BoxShape.circle),
            child: SvgPicture.asset(
              data["icon"],
              color: isSelected ? selectedColor : textColor,
              width: 30,
              height: 30,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(data["name"],
              maxLines: 1,
              overflow: TextOverflow.fade,
              style: const TextStyle(
                  color: textColor, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
