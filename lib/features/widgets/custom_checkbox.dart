import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';

class CustomCheckBox extends StatefulWidget {
  final String name;
  final bool value;
  final Function(bool) onChanged;
  const CustomCheckBox(
      {super.key,
      required this.name,
      required this.value,
      required this.onChanged});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      activeColor: AppColors.blue,
      side: const BorderSide(color: AppColors.grey),
      title: Text(
        widget.name,
        style: AppFonts.s16w400.copyWith(color: AppColors.white),
      ),
      value: widget.value,
      onChanged: (newValue) {
        setState(() {
          isChecked = newValue!;
          widget.onChanged;
        });
      },
      controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
    );
  }
}
