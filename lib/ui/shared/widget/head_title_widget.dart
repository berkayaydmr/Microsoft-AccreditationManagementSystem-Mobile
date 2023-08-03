import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class HeadTitleWidget extends StatelessWidget {
  const HeadTitleWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.05,
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
          Text(title, style: context.textTheme.titleLarge!.copyWith(color: Colors.white),),
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
