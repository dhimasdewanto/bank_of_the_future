import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IOSDateTimeContainer extends StatelessWidget {
  const IOSDateTimeContainer({
    Key? key,
    required this.pickerWidget,
    required this.onDone,
    required this.onCancel,
  }) : super(key: key);

  final Widget pickerWidget;
  final void Function() onDone;
  final void Function() onCancel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CupertinoButton(
                onPressed: onCancel,
                child: const Text('Cancel'),
              ),
              CupertinoButton(
                onPressed: onDone,
                child: const Text('Done'),
              ),
            ],
          ),
          const Divider(
            height: 0,
            thickness: 1,
          ),
          Expanded(
            child: pickerWidget,
          ),
        ],
      ),
    );
  }
}
