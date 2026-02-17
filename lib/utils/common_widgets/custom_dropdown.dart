import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/utils/common_widgets/normal_text_form_field.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '../../res/styles/color_palette.dart';
import '../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import 'common_loader.dart';
import 'custom_checkbox.dart';

class CustomDropdownButton<T> extends StatefulWidget {
  const CustomDropdownButton({
    super.key,
    required this.items,
    this.value,
    required this.itemBuilder,
    required this.onChanged,
    this.props,
    this.hint,
    this.selectedLabel,
    this.errorText,
    this.hasErr,
    this.isEnabled = true,
    this.hideArrow = false,
    this.isLoading,
    this.enableSearch = false,
    this.searchMatchFn,
  });

  final List<T> items;
  final T? value;
  final Function(T) onChanged;
  final Widget Function(T) itemBuilder;
  final CustomDropdownProps? props;
  final String? hint;
  final String? selectedLabel;
  final String? errorText;
  final bool? hasErr;
  final bool isEnabled;
  final bool hideArrow;
  final bool? isLoading;
  final bool enableSearch;
  final bool Function(T item, String query)? searchMatchFn;

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState<T>();
}

class _CustomDropdownButtonState<T> extends State<CustomDropdownButton<T>> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.props?.padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: widget.isEnabled
                ? () {
                    showModalBottomSheet(
                      shape: SmoothRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.r),
                          topRight: Radius.circular(24.r),
                        ),
                        smoothness: 1,
                      ),
                      isDismissible: true,
                      isScrollControlled: true,
                      clipBehavior: Clip.hardEdge,
                      context: context,
                      builder: (context) => _buildBottomSheet(widget.isLoading),
                    );
                  }
                : null,
            child: Container(
              width: widget.props?.width ?? 1.sw,
              height: widget.props?.height ?? 55.h,
              decoration: ShapeDecoration(
                color: widget.isEnabled
                    ? widget.props?.fillColor ?? Colors.white
                    : Colors.grey.shade100, // HexColor("#f5f5f5")
                shape: SmoothRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    widget.props?.radius ?? 12.r,
                  ),
                  smoothness: 1,
                  side:
                      widget.props?.borderSide ??
                      BorderSide(
                        width: 1.r,
                        color: widget.errorText != null
                            ? ColorPalette
                                  .fE53B40 // HexColor("#E53B40")
                            : Color(0XFFCCCCCC),
                      ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 250),
                      style:
                          widget.value != null && widget.selectedLabel != null
                          ? PlusJakartaSansFontPalette.fBlack_10_500
                          : PlusJakartaSansFontPalette.f767676_12_400,
                      child: AnimatedPositioned(
                        duration: const Duration(milliseconds: 250),
                        top:
                            widget.value != null && widget.selectedLabel != null
                            ? 10.h
                            : null,
                        child: Text(widget.hint ?? 'Select'),
                      ),
                    ),
                    if (!widget.hideArrow)
                      Positioned(
                        right: 0,
                        child: SizedBox(
                          width: 20.r,
                          height: 20.r,
                          child: const Center(
                            child: Icon(
                              Icons.keyboard_arrow_down_rounded,
                            ), // Assets.svgArrowDown replacement
                          ),
                        ),
                      ),
                    if (widget.selectedLabel != null)
                      Positioned(
                        bottom: 10.h,
                        child: SizedBox(
                          width: 280.w,
                          height: 21.h,
                          child: Text(
                            widget.selectedLabel ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: PlusJakartaSansFontPalette.fBlack_12_400,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          if (widget.errorText != null) ...[
            8.verticalSpace,
            Row(
              children: [
                12.horizontalSpace,
                Text(
                  widget.errorText ?? "",
                  style: PlusJakartaSansFontPalette.base400(
                    12,
                    color: ColorPalette.fE53B40,
                  ), // InterFontPalette.fE53B40_12_400 replacement
                ),
                8.horizontalSpace,
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBottomSheet(bool? isLoading) {
    List<T> filteredItems = widget.items;
    final TextEditingController searchController = TextEditingController();

    return isLoading == true
        ? Container(
            color: Colors.white,
            width: 1.sw,
            height: 400.h,
            child: const Center(child: CupertinoActivityIndicator()),
          )
        : widget.items.isEmpty
        ? Container(
            color: Colors.white,
            width: 1.sw,
            height: 400.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.info_outline, size: 50), // Assets.svgNoData
                8.verticalSpace,
                SizedBox(
                  width: 1.sw,
                  child: Text(
                    "No Data Found", // Strings.noDataErr
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff191B1E),
                      height: 0,
                    ),
                  ),
                ),
                12.verticalSpace,
                Text(
                  "There is no data to show", // Strings.noDataErrMsg
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xff374151),
                    height: 0,
                  ),
                ),
              ],
            ),
          )
        : StatefulBuilder(
            builder: (context, setState) {
              return Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 10,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                      width: 1.sw,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 40.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              color: const Color(0xffBCC4CC),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: Text(
                              widget.hint ?? 'Select',
                              textAlign: TextAlign.center,
                              style: PlusJakartaSansFontPalette.fBlack_18_600,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(Icons.close),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (widget.enableSearch) ...[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: CommonTextFormField(
                          controller: searchController,
                          hintText: 'Search...',
                          onChanged: (value) {
                            setState(() {
                              if (value == null || value.isEmpty) {
                                filteredItems = widget.items;
                              } else {
                                filteredItems = widget.items.where((item) {
                                  if (widget.searchMatchFn != null) {
                                    return widget.searchMatchFn!(item, value);
                                  }
                                  return item.toString().toLowerCase().contains(
                                    value.toLowerCase(),
                                  );
                                }).toList();
                              }
                            });
                          },
                          prefix: Padding(
                            padding: EdgeInsets.all(12.w),
                            child: Icon(
                              Icons.search,
                              size: 20.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      10.verticalSpace,
                    ],
                    if (filteredItems.isEmpty) ...[
                      Container(
                        color: Colors.white,
                        width: 1.sw,
                        height: 300.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.info_outline, size: 50),
                            8.verticalSpace,
                            SizedBox(
                              width: 1.sw,
                              child: Text(
                                "No Data Found",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff191B1E),
                                  height: 0,
                                ),
                              ),
                            ),
                            12.verticalSpace,
                            Text(
                              "There is no data to show",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xff374151),
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ] else ...[
                      Container(
                        color: Colors.white,
                        constraints: BoxConstraints(
                          maxHeight: 1.sh * 0.7,
                          minHeight: 1.sh * 0.2,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ...List.generate(filteredItems.length, (index) {
                                final item = filteredItems[index];
                                return InkWell(
                                  onTap: () async {
                                    widget.onChanged(item);
                                    setState(() {});
                                    await Future.delayed(
                                      const Duration(milliseconds: 250),
                                    );
                                    if (context.mounted) {
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: widget.itemBuilder(item),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    ],
                    20.verticalSpace,
                  ],
                ),
              );
            },
          );
  }
}

class CustomDropdownButtonMultiSelection<T> extends StatefulWidget {
  const CustomDropdownButtonMultiSelection({
    super.key,
    required this.items,
    this.value,
    required this.itemBuilder,
    required this.onChanged,
    this.props,
    this.hint,
    this.selectedLabel,
    this.noDataWidget,
    this.onClear,
    this.isEnabled = true,
    this.isError = false,
  });

  final List<T> items;
  final List<T>? value;
  final Function(T) onChanged;
  final Widget Function(T) itemBuilder;
  final CustomDropdownProps? props;
  final String? hint;
  final String? selectedLabel;
  final Widget? noDataWidget;
  final Function()? onClear;
  final bool isEnabled;
  final bool isError;

  @override
  State<CustomDropdownButtonMultiSelection> createState() =>
      _CustomDropdownButtonMultiSelectionState<T>();
}

class _CustomDropdownButtonMultiSelectionState<T>
    extends State<CustomDropdownButtonMultiSelection<T>> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.props?.padding ?? EdgeInsets.zero,
      child: InkWell(
        onTap: widget.isEnabled
            ? () {
                showModalBottomSheet(
                  shape: SmoothRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r),
                      topRight: Radius.circular(24.r),
                    ),
                    smoothness: 1,
                  ),
                  isDismissible: true,
                  isScrollControlled: true,
                  clipBehavior: Clip.hardEdge,
                  context: context,
                  builder: (context) => _buildBottomSheet(),
                );
              }
            : null,
        child: Container(
          width: widget.props?.width ?? 1.sw,
          height: widget.props?.height ?? 60.h,
          decoration: ShapeDecoration(
            color: widget.isEnabled
                ? widget.props?.fillColor ?? Colors.white
                : Colors.grey.shade100,
            shape: SmoothRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(
                widget.props?.radius ?? 12.r,
              ),
              side:
                  widget.props?.borderSide ??
                  BorderSide(
                    width: 1.r,
                    color: widget.isError
                        ? ColorPalette.fE53B40
                        : Color(0XFFCCCCCC),
                  ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 250),
                  style: (widget.value ?? []).isNotEmpty
                      ? PlusJakartaSansFontPalette.f6A7282_12_400
                      : PlusJakartaSansFontPalette.f767676_12_400,
                  child: AnimatedPositioned(
                    duration: const Duration(milliseconds: 250),
                    top: (widget.value ?? []).isNotEmpty ? 10.h : null,
                    child: Text(widget.hint ?? 'Select'),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: SizedBox(
                    width: 20.r,
                    height: 20.r,
                    child: const Center(
                      child: Icon(Icons.keyboard_arrow_down_rounded),
                    ),
                  ),
                ),
                if (widget.selectedLabel != null)
                  Positioned(
                    bottom: 10.h,
                    child: SizedBox(
                      width: 280.w,
                      height: 21.h,
                      child: Text(
                        widget.selectedLabel ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: PlusJakartaSansFontPalette.fBlack_12_400,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSheet() {
    return widget.items.isEmpty
        ? Container(
            color: Colors.white,
            width: 1.sw,
            height: 400.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                20.verticalSpace,
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Text(
                          widget.hint ?? 'Select',
                          textAlign: TextAlign.center,
                          style: PlusJakartaSansFontPalette.fBlack_18_600,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.info_outline, size: 50),
                      8.verticalSpace,
                      SizedBox(
                        width: 1.sw,
                        child: Text(
                          "No Data Found",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff191B1E),
                            height: 0,
                          ),
                        ),
                      ),
                      12.verticalSpace,
                      Text(
                        "There is no data to show",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xff374151),
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : StatefulBuilder(
            builder: (_, rebuild) {
              return Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                      width: 1.sw,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 40.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              color: const Color(0xffBCC4CC),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        20.horizontalSpace,
                        Text(
                          widget.hint ?? 'Select',
                          style: PlusJakartaSansFontPalette.fBlack_18_600,
                        ),
                        const Expanded(child: SizedBox()),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: (widget.value ?? []).length >= 2 ? 1 : 0,
                          child: TextButton(
                            onPressed: () async {
                              widget.onClear?.call();
                              await Future.delayed(
                                const Duration(milliseconds: 100),
                              );
                              rebuild(() {});
                            },
                            child: const Text('Clear'),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close),
                        ),
                        8.horizontalSpace,
                      ],
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: 1.sh * 0.62,
                        minHeight: 1.sh * 0.2,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListView.builder(
                              itemCount: widget.items.length,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                final item = widget.items[index];
                                return InkWell(
                                  onTap: () async {
                                    widget.onChanged(item);
                                    await Future.delayed(
                                      const Duration(milliseconds: 100),
                                    );
                                    rebuild(() {});
                                  },
                                  child: widget.itemBuilder(item),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    40.verticalSpace,
                  ],
                ),
              );
            },
          );
  }
}

class CustomDropdownItem extends StatefulWidget {
  const CustomDropdownItem({super.key, required this.label, this.isSelected});

  final String label;

  final bool? isSelected;

  @override
  State<CustomDropdownItem> createState() => _CustomDropdownItemState();
}

class _CustomDropdownItemState extends State<CustomDropdownItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: SmoothRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        smoothness: 1,
      ),
      color: Colors.transparent,
      child: SizedBox(
        width: 1.sw,
        height: 50.h,
        child: Row(
          children: [
            20.horizontalSpace,
            Expanded(
              child: Text(
                widget.label,
                overflow: TextOverflow.ellipsis,
                style: PlusJakartaSansFontPalette.fBlack_16_600.copyWith(
                  // fBlack_14_600 replacement
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            8.horizontalSpace,
            Padding(
              padding: EdgeInsets.all(5.r),
              child: CustomCheckbox(
                value: widget.isSelected ?? false,
                borderRadius: 100, // Circular checkbox
                size: 21.w,
                activeColor: Colors.black,
              ),
            ),
            20.horizontalSpace,
          ],
        ),
      ),
    );
  }
}

class CustomDropdownProps {
  final double? width;
  final double? height;
  final BorderSide? borderSide;
  final EdgeInsets? padding;
  final Color? fillColor;
  final double? radius;

  CustomDropdownProps({
    this.width,
    this.height,
    this.borderSide,
    this.padding,
    this.fillColor,
    this.radius,
  });
}
