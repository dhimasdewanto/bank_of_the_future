import 'package:flutter/material.dart';

class IconAnimation extends StatefulWidget {
  const IconAnimation({
    Key? key,
  }) : super(key: key);

  @override
  _IconAnimationState createState() => _IconAnimationState();
}

class _IconAnimationState extends State<IconAnimation> {
  static const _maxSize = 60.0;
  static const _minSize = 40.0;
  var _size = _maxSize;

  @override
  void initState() {
    super.initState();
    // Run after build
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _changeSize();
    });
  }

  void _changeSize() {
    setState(() {
      _size = _size == _maxSize ? _minSize : _maxSize;
    });
  }

  @override
  Widget build(BuildContext context) {
    final canvasColor = Theme.of(context).canvasColor;
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      height: _maxSize,
      width: _maxSize,
      child: Stack(
        children: [
          Center(
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              decoration: BoxDecoration(
                color: canvasColor,
                borderRadius: BorderRadius.circular(50),
              ),
              onEnd: _changeSize,
              height: _size,
              width: _size,
              child: Icon(
                Icons.today,
                color: primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
