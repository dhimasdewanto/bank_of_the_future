import 'package:flutter/material.dart';

import '../../../../core/app_settings.dart';

class InformationDropdown extends StatefulWidget {
  const InformationDropdown({
    Key? key,
    required this.helperText,
    required this.listItems,
    required this.onSelected,
    this.notSelectedText = "Choose Option",
  }) : super(key: key);
  
  final String notSelectedText;
  final String helperText;
  final List<String> listItems;
  final void Function(String value) onSelected;

  @override
  _InformationDropdownState createState() => _InformationDropdownState();
}

class _InformationDropdownState extends State<InformationDropdown> {
  String? _dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius,
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(sizeM),
      child: DropdownButton<String>(
        value: _dropdownValue,
        icon: const Icon(Icons.arrow_drop_down),
        isExpanded: true,
        underline: const Offstage(),
        hint: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.helperText,
              style: Theme.of(context).textTheme.caption,
            ),
            const SizedBox(height: sizeS),
            Text(widget.notSelectedText),
          ],
        ),
        onChanged: (newValue) {
          setState(() {
            _dropdownValue = newValue ?? '';
          });
          widget.onSelected(newValue ?? '');
        },
        selectedItemBuilder: (context) {
          return widget.listItems.map<Widget>((item) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.helperText,
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(height: sizeS),
                Text(item),
              ],
            );
          }).toList();
        },
        items: widget.listItems.map<DropdownMenuItem<String>>(
          (value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          },
        ).toList(),
      ),
    );
  }
}
