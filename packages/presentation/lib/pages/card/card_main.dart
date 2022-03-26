import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/core/ratio/sizer_ratio.dart';
import 'package:presentation/core/theme/theme_app.dart';

class CardMainPage extends StatelessWidget {
  const CardMainPage({Key? key}) : super(key: key);
  static const routeName = '/card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: const [
          _CardItem(
              countryName: 'Mexico',
              maintitlle: 'Money',
              flag: 'flags_mexico.svg',
              title: "man"),
          _CardItem(
              countryName: 'Mexico',
              maintitlle: 'plazo',
              flag: 'flags_mexico.svg'),
          _CardItem(
              countryName: 'Spain',
              maintitlle: 'Money',
              flag: 'flag_espanol.svg',
              title: "man",
              color: AppColors.accentOrange),
        ],
      ),
    ));
  }
}

class _CardItem extends StatelessWidget {
  const _CardItem({
    Key? key,
    required this.flag,
    required this.maintitlle,
    this.title,
    this.color,
    required this.countryName,
  }) : super(key: key);
  final String flag;
  final String maintitlle;
  final String? title;
  final Color? color;
  final String countryName;

  @override
  Widget build(BuildContext context) {
    final height = getHeightRatio(context);
    return Container(
      height: height * 80,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Colors.grey,
              spreadRadius: 0.2,
              blurRadius: 2,
              offset: Offset(1, 1)),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset("assets/svg/$flag"),
          const SizedBox(
            width: 15,
          ),
          _TitleHandler(
              countryName: countryName,
              maintitlle: maintitlle,
              color: color,
              title: title),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}

class _TitleHandler extends StatelessWidget {
  const _TitleHandler({
    Key? key,
    required this.maintitlle,
    this.title,
    this.color,
    required this.countryName,
  }) : super(key: key);
  final String maintitlle;
  final String? title;
  final Color? color;
  final String countryName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 47,
          height: 18,
          decoration: BoxDecoration(
            color: color ?? AppColors.accentGreen,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: Text(countryName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold))),
        ),
        Row(
          children: [
            Text(
              maintitlle,
              style: const TextStyle(
                  color: AppColors.accentGreen,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            Text(title ?? '',
                style: const TextStyle(
                    color: AppColors.textMain,
                    fontSize: 35,
                    fontWeight: FontWeight.bold)),
          ],
        )
      ],
    );
  }
}
