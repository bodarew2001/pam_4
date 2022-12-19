import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product.dart';

class BestSelling extends StatefulWidget {
  const BestSelling({super.key, required this.product});

  final Product product;

  @override
  State<BestSelling> createState() => _BestSellingState();
}

class _BestSellingState extends State<BestSelling> {
  Color _favIconColor = const Color(0xff000000);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(widget.product.cover),
                ),
                //color: Colors.red,
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              ),
            ),
            Positioned(
              top: -5,
              left: 150,
              //width: 30,
              // height: 30,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.transparent,
                      // backgroundColor:  Colors.transparent,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.star_border),
                      color: _favIconColor,
                      tooltip: 'Add to favorite',
                      onPressed: () {
                        setState(() {
                          if (_favIconColor == const Color(0xff000000)) {
                            _favIconColor = Colors.red;
                          } else {
                            _favIconColor = const Color(0xff000000);
                          }
                        });
                      },
                      splashRadius: 5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: 164,
          height: 24,
          child: Text(
            widget.product.title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'SF Pro Text',
              color: Color(0xff000000),
            ),
          ),
        ),
        SizedBox(
          width: 164,
          height: 16,
          child: Text(
            widget.product.subtitle,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: 'SF Pro Text',
              color: Color(0xff929292),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: SizedBox(
            width: 164,
            height: 24,
            child: Text(
              widget.product.finalprice,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: 'SF Pro Text',
                color: Color(0xff00C569),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
