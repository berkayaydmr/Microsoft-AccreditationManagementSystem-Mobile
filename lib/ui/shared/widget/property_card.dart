import 'package:accreditation_management_system/core/components/animation/tap_animation.dart';
import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({super.key, required this.title, required this.count, required this.cardColor, required this.onTap});
  
  final String title;
  final String count;
  final Color cardColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TapAnimation(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(left: context.normalValue, top: context.lowValue, bottom: context.lowValue, right: context.lowValue),
          margin: context.edgeLow,
          width: context.width,
          decoration: BoxDecoration(
            borderRadius: context.radiusAll,
            color: cardColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(count, style: context.textTheme.displaySmall!.copyWith(color: Colors.white,fontSize: 40),),
                  Text(title, style: context.textTheme.displayLarge!.copyWith(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w300),),
                ],
              ),
              Icon(Icons.navigate_next, size: 50, color: Colors.white,)
            ],
          ),
        ),
      ),
    );
  }
}
