import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NothingToShowWidget extends StatelessWidget {
  const NothingToShowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            CupertinoIcons.exclamationmark_circle,
            size: 100,
            color: Colors.orange,
          ),
          Text(
            "Nothing to show",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 20,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
