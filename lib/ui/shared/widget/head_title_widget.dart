import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class HeadTitleWidget extends StatelessWidget {
  const HeadTitleWidget({super.key, required this.titles, this.hideButtons = false});
  final List<String> titles;
  final bool hideButtons;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.08,
      padding: EdgeInsets.only(left: context.normalValue),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFBA1A1A), Color(0xFF00A4EF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              for (var title in titles)
                if (title != titles.last)
                  Row(
                    children: [
                      Text(title, style: context.textTheme.titleLarge!.copyWith(color: Colors.white),),
                      const Icon(Icons.navigate_next, color: Colors.white,),
                    ],
                  )
                else
                Text(title, style: context.textTheme.titleLarge!.copyWith(color: Colors.white),),
            ],
          ),
          if(!hideButtons)
            Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.add, color: Colors.white,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.filter_alt_outlined, color: Colors.white))
              ],
            )
        ],
      ),
    );
  }
}
