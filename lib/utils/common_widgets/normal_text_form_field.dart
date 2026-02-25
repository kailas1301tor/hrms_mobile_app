import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../res/styles/color_palette.dart';
import '../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';

class CommonTextFormField extends StatefulWidget {
  const CommonTextFormField({
    super.key,
    required this.controller,
    this.onFocusLost,
    this.onErrorReset,
    this.hintText = "",
    this.validator,
    this.errorText,
    this.keyboardType,
    this.label,
    this.isSuffixEnable = true,
    this.enableFloatingPlaceholder = true,
    this.haveTextAlready,
    this.onChanged,
    this.inputFormatters,
    this.maxLength,
    this.hasInitialFocus = false,
    this.textCapitalization,
    this.isObscure = false,
    this.height,
    this.borderRadius,
    this.filledColor,
    this.showErrorText = true,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    this.suffix,
    this.prefix,
    this.maxLines = 1,
    this.textAlignVertical,
    this.scrollPadding = const EdgeInsets.all(20.0),
  });

  final TextEditingController controller;
  final VoidCallback? onFocusLost;
  final VoidCallback? onErrorReset;
  final Function(String?)? onChanged;
  final String hintText;
  final String? Function(String?)? validator;
  final String? errorText;
  final TextInputType? keyboardType;
  final String? label;
  final bool isSuffixEnable;
  final bool enableFloatingPlaceholder;
  final String? haveTextAlready;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final bool hasInitialFocus;
  final TextCapitalization? textCapitalization;
  final bool isObscure;
  final double? height;
  final double? borderRadius;
  final Color? filledColor;
  final bool showErrorText;
  final bool enabled;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? suffix;
  final Widget? prefix;
  final int? maxLines;
  final TextAlignVertical? textAlignVertical;
  final EdgeInsets scrollPadding;

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  final FocusNode _focusNode = FocusNode();
  final ValueNotifier<bool> _isFocused = ValueNotifier(false);
  final ValueNotifier<bool> _hasText = ValueNotifier(false);
  final ValueNotifier<String?> _errorText = ValueNotifier(null);
  final ValueNotifier<bool> _obscureText = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _errorText.value = widget.errorText;
    _initializeState();
    _setupListeners();
  }

  void _initializeState() {
    _hasText.value = widget.controller.text.isNotEmpty;

    if (widget.hasInitialFocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
      });
    }
  }

  void _setupListeners() {
    widget.controller.addListener(_updateTextState);
    _focusNode.addListener(_updateFocusState);
  }

  void _updateTextState() {
    _hasText.value = widget.controller.text.isNotEmpty;
  }

  void _updateFocusState() {
    _isFocused.value = _focusNode.hasFocus;
  }

  @override
  void didUpdateWidget(CommonTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.errorText != oldWidget.errorText) {
      _errorText.value = widget.errorText;
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateTextState);
    _focusNode.dispose();
    _isFocused.dispose();
    _hasText.dispose();
    _errorText.dispose();
    _obscureText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: _errorText,
      builder: (context, errorText, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextFieldContainer(errorText),
            if (widget.showErrorText && errorText != null)
              _buildErrorMessage(errorText),
          ],
        );
      },
    );
  }

  Widget _buildTextFieldContainer(String? errorText) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isFocused,
      builder: (context, isFocused, _) {
        return ValueListenableBuilder<bool>(
          valueListenable: _hasText,
          builder: (context, hasText, _) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: widget.height ?? 60.h,
              decoration: ShapeDecoration(
                color: !widget.enabled
                    ? Colors.grey.shade100
                    : widget.filledColor ?? ColorPalette.white,
                shape: SmoothRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10.r),
                  side: BorderSide(
                    color: errorText != null
                        ? ColorPalette.fE53B40
                        : isFocused
                        ? ColorPalette.black
                        : Color(0XFFCCCCCC),
                    width: 1.w,
                    strokeAlign: BorderSide.strokeAlignInside,
                  ),
                ),
              ),
              alignment: widget.textAlignVertical == TextAlignVertical.top
                  ? Alignment.topCenter
                  : Alignment.center,
              child: _buildTextField(isFocused, hasText),
            );
          },
        );
      },
    );
  }

  Widget _buildTextField(bool isFocused, bool hasText) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureText,
      builder: (context, obscureValue, _) {
        return TextFormField(
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          controller: widget.controller,
          focusNode: _focusNode,

          obscureText: widget.isObscure ? obscureValue : false,
          obscuringCharacter: '⁕',
          keyboardType: widget.keyboardType ?? TextInputType.text,
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.none,
          inputFormatters: widget.inputFormatters,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          buildCounter:
              (
                context, {
                required currentLength,
                required isFocused,
                required maxLength,
              }) => null,
          style: PlusJakartaSansFontPalette.fBlack_12_400,
          cursorColor: ColorPalette.black,
          cursorWidth: 1.w,
          textAlign: TextAlign.start,
          textAlignVertical:
              widget.textAlignVertical ?? TextAlignVertical.center,
          scrollPadding: widget.scrollPadding,
          onTap: widget.onTap,
          onTapOutside: (event) {
            if (!mounted) return;
            if (!_isTapOnClearButton(event)) {
              _focusNode.unfocus();
              widget.onFocusLost?.call();
            }
          },
          decoration: InputDecoration(
            prefixIcon: widget.prefix,

            errorText: null,
            border: OutlineInputBorder(borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
            errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
            focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide.none),
            errorStyle: const TextStyle(height: -1, fontSize: 0),
            contentPadding: widget.textAlignVertical == TextAlignVertical.top
                ? EdgeInsets.only(
                    left: 10.w,
                    right: 10.w,
                    top: 12.h,
                    bottom: 20.h,
                  )
                : EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            hintText: hasText || isFocused ? '' : widget.hintText,
            hintStyle: PlusJakartaSansFontPalette.f767676_12_400,
            isDense: true,
            filled: false,
            suffixIcon: widget.isObscure
                ? _buildObscureButton()
                : widget.suffix,
          ),

          validator: widget.validator,
          onChanged: (value) {
            _hasText.value = value.isNotEmpty;
            widget.onErrorReset?.call();
            widget.onChanged?.call(value);
          },
        );
      },
    );
  }

  Widget _buildObscureButton() {
    return InkWell(
      onTap: () {
        _obscureText.value = !_obscureText.value;
      },
      child: SizedBox(
        width: 50.w,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(6.w),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(100),
                  child: SizedBox(
                    width: 16.w,
                    height: 16.w,
                    child: Icon(
                      _obscureText.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Color(0XFFACB5BB),
                      size: 16.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorMessage(String errorText) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h, left: 12.w),
      child: Text(
        errorText,
        maxLines: 2,
        style: PlusJakartaSansFontPalette.base400(
          12,
          color: ColorPalette.fE53B40,
        ),
      ),
    );
  }

  bool _isTapOnClearButton(PointerDownEvent event) {
    if (!mounted) return false;

    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null || !renderBox.attached) return false;

    final size = renderBox.size;
    final tapPosition = renderBox.globalToLocal(event.position);
    const clearButtonRight = 50.0;
    return tapPosition.dx > size.width - clearButtonRight &&
        tapPosition.dx < size.width &&
        tapPosition.dy > size.height / 2 - 20 &&
        tapPosition.dy < size.height / 2 + 20;
  }
}
