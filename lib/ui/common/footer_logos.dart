import 'package:flutter/material.dart';

class FooterLogos extends StatelessWidget {
  final double width;
  FooterLogos(this.width);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(
            child: Tooltip(
                message: 'French Tech logo',
                child: Image.asset('assets/Logo_French_Tech.svg.png'))),
        Flexible(
            child: Tooltip(
                message: 'Normandy French Tech logo',
                child: Image.asset('assets/normandy_french_tech.jpg'))),
        Flexible(
            child: Tooltip(
                message: 'Flutter logo',
                child: FlutterLogo(
                  size: width / 3,
                ))),
      ],
    );
  }
}
