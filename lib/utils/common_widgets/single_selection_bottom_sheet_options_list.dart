// Single Select Options List
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../res/styles/color_palette.dart';
import '../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';

class SingleSelectOptionsList extends StatelessWidget {
  final List<String> options;
  final ValueNotifier<String?> selectedOptionNotifier;
  final Function(String) onOptionSelected;

  const SingleSelectOptionsList({
    super.key,
    required this.options,
    required this.selectedOptionNotifier,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: selectedOptionNotifier,
      builder: (context, selectedOption, child) {
        return Column(
          children:
              options.map((option) {
                final isSelected = selectedOption == option;
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        selectedOptionNotifier.value = option;
                        onOptionSelected(option);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: ColorPalette.transparent,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(option, style: PlusJakartaSansFontPalette.fBlack_16_500),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: 21.w,
                              height: 21.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color:
                                      isSelected
                                          ? ColorPalette.secondaryColor
                                          : const Color(0xFFD1D1D1),
                                  width: 1,
                                ),
                              ),
                              child: Container(
                                margin: EdgeInsets.all(4.h),
                                height: 13.h,
                                width: 13.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      isSelected
                                          ? ColorPalette.secondaryColor
                                          : Colors.transparent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (option != options.last)
                      const Divider(color: ColorPalette.fF1F1F1, height: 1),
                  ],
                );
              }).toList(),
        );
      },
    );
  }
}
