import 'package:flutter/material.dart';

import '../../../../core/app_settings.dart';

class TopPageNumbers extends StatelessWidget {
  const TopPageNumbers({
    Key? key,
    required this.index,
    this.total = 4,
  }) : super(key: key);

  final int index;
  final int total;

  static const _size = 50.0;
  static const _lineSize = 2.0;

  List<Widget> _getlistNumberWidgets(BuildContext context) {
    final bodyText1 = Theme.of(context).textTheme.bodyText1;
    final accentColor = Theme.of(context).accentColor;

    final _listWidgets = <Widget>[];
    for (var i = 0; i < total; i++) {
      _listWidgets.add(
        Container(
          width: _size,
          height: _size,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(50),
            color: i <= index ? accentColor : Colors.white,
          ),
          padding: const EdgeInsets.all(sizeM),
          child: Center(
            child: Text(
              "${i + 1}",
              style: bodyText1,
            ),
          ),
        ),
      );
    }
    return _listWidgets;
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyText1?.color;

    return Container(
      height: _size,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: _lineSize,
              width: double.infinity,
              color: textColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _getlistNumberWidgets(context),
          ),
        ],
      ),
    );
  }
}
