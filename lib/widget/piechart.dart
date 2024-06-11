import 'dart:ffi';

import 'package:econome/logic/logic.dart';
import 'package:econome/style/style.dart';
import 'package:econome/widget/indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<List<String>> Svgs = [
  [],
  [
    "assets/icon/food.svg",
    "assets/icon/fun.svg",
    "assets/icon/hospital.svg",
    "assets/icon/Utility.svg"
  ],
  [
    "assets/icon/money-recive.svg",
    "assets/icon/money-send.svg",
    "assets/icon/money-send.svg",
    "assets/icon/money-send.svg"
  ],
];

typedef MyCallback = void Function(int value);

class PieChartSample3 extends ConsumerStatefulWidget {
  final AsyncValue<Map<String, double>> balance;
  final int g;
  final int sad;
  MyCallback c;

  PieChartSample3({
    super.key,
    required this.balance,
    required this.g,
    required this.sad,
    required this.c,
  });

  @override
  ConsumerState<PieChartSample3> createState() => PieChartSample3State();
}

class PieChartSample3State extends ConsumerState<PieChartSample3> {
  int touchedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget mainContents = switch (widget.balance) {
      AsyncData(:final value) => Expanded(
            child: Column(children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(value.length, (i) {
                return Indicator(
                  color: colorArray[i],
                  text: value.keys.toList()[i],
                  isSquare: false,
                  size: touchedIndex == i ? 18 : 16,
                  textColor: touchedIndex == i
                      ? AppColors.mainTextColor1
                      : AppColors.mainTextColor3,
                );
              })),
          Expanded(
              child: AspectRatio(
            aspectRatio: 0.8,
            child: PieChart(PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                },
              ),
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 0,
              centerSpaceRadius: 0,
              sections: showingSections(value.values.toList()),
            )),
          ))
        ])),
      _ => Expanded(child: CircularProgressIndicator())
    };
    return SizedBox(
        width: 250,
        height: 350,
        child: Column(children: [
          mainContents,
          Align(
              alignment: Alignment.bottomCenter,
              child: SegmentedButton<int>(
                style: SegmentedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  selectedForegroundColor: Colors.white,
                  selectedBackgroundColor: Colors.black,
                ),
                segments: const <ButtonSegment<int>>[
                  ButtonSegment<int>(
                      value: 2,
                      label: Text('Balance'),
                      icon: Icon(Icons.calendar_view_week)),
                  ButtonSegment<int>(
                      value: 1,
                      label: Text('Tags'),
                      icon: Icon(Icons.calendar_view_week)),
                  ButtonSegment<int>(
                      value: 0,
                      label: Text('Wallets'),
                      icon: Icon(Icons.calendar_view_day)),
                ],
                selected: <int>{widget.g},
                onSelectionChanged: (Set<int> newSelection) {
                  widget.c(newSelection.first);
                },
              )),
        ]));
  }

  List<PieChartSectionData> showingSections(List<double> a) {
    return List.generate(a.length, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 55.0 : 40.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      return PieChartSectionData(
        color: colorArray[i],
        value: a[i].abs(),
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
          shadows: shadows,
        ),
        badgeWidget: _Badge(
          widget.sad == 0 ? "assets/icon/wallet.svg" : Svgs[widget.sad][i],
          size: widgetSize,
          borderColor: AppColors.contentColorBlack,
        ),
        badgePositionPercentageOffset: .98,
      );
    });
  }
}

class _Badge extends StatelessWidget {
  const _Badge(
    this.svgAsset, {
    required this.size,
    required this.borderColor,
  });
  final String svgAsset;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: SvgPicture.asset(
          svgAsset,
        ),
      ),
    );
  }
}
