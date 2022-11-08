import 'package:flutter/material.dart';

class NameThisLater2 extends StatelessWidget {
  const NameThisLater2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 81),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: const [
              Icon(
                Icons.star,
                size: 64,
              ),
              Text(
                "Slow Moving",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                "\$000B",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                "0%",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          Column(
            children: const [
              Icon(
                Icons.star,
                size: 64,
              ),
              Text(
                "Non Moving",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                "\$000B",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                "0%",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
