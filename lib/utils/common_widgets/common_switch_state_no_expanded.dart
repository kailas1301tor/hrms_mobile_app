import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/utils/helpers/extensions.dart';

import '../../res/enums/enums.dart';
import '../../res/styles/color_palette.dart';
import '../../res/styles/fonts/inter_font_palette.dart';


class CommonSwitchStateNoExpanded extends StatefulWidget {
  final LoaderState loaderState;
  final void Function()? reload;
  final void Function()? customButtonFunction;
  final Widget child;
  final Widget? loader;
  final String? errorTitle;
  final String? errorMessage;
  final String? buttonText;
  final Widget? noData;
  final Widget? noSearchData;
  final Widget? errorWidget;
  final double? topMargin;
  final ScrollPhysics? scrollPhysics;
  final MainAxisAlignment? emptyMainAxisAlignment;
  final String? emptyScreenTitle;
  final String? emptyScreenDescription;
  final TextStyle? titleTextStyle;
  final TextStyle? errorMessageTextStyle;

  const CommonSwitchStateNoExpanded({
    super.key,
    required this.loaderState,
    this.reload,
    required this.child,
    this.noData,
    this.loader,
    this.errorTitle,
    this.errorMessage,
    this.buttonText,
    this.errorWidget,
    this.noSearchData,
    this.emptyMainAxisAlignment,
    this.emptyScreenDescription,
    this.emptyScreenTitle,
    this.scrollPhysics,
    this.topMargin,
    this.customButtonFunction,
    this.titleTextStyle,
    this.errorMessageTextStyle,
  });

  @override
  State<CommonSwitchStateNoExpanded> createState() =>
      _CommonSwitchStateNoExpandedState();
}

class _CommonSwitchStateNoExpandedState
    extends State<CommonSwitchStateNoExpanded> {
  //<=========Error state widget========>/
  Widget get error =>
      widget.errorWidget ??
      _CommonErrorOrNoDataWidget(
        errorMessage: widget.errorMessage,
        title: widget.errorTitle,
        buttonText: widget.buttonText,
        customButtonFunction: widget.customButtonFunction,
        scrollPhysics: widget.scrollPhysics,
        topMargin: widget.topMargin,
        emptyMainAxisAlignment: widget.emptyMainAxisAlignment,
        reload: () => widget.reload?.call(),
        errorMessageTextStyle: widget.errorMessageTextStyle,
        titleTextStyle: widget.titleTextStyle,
      );

  //<=========Server Error state widget========>/
  Widget get serverError => _CommonErrorOrNoDataWidget(
    reload: widget.reload,
    isServerError: true,
    title: "Server error",
    errorMessage: "Oops, something went wrong..",
    buttonText: widget.buttonText ?? "Refresh",
    customButtonFunction: widget.customButtonFunction,
    scrollPhysics: widget.scrollPhysics,
    topMargin: widget.topMargin,
    emptyMainAxisAlignment: widget.emptyMainAxisAlignment,
    titleTextStyle: widget.titleTextStyle,
    errorMessageTextStyle: widget.errorMessageTextStyle,
  );

  //<=========NetWorkError state widget========>/
  Widget get networkError => _CommonErrorOrNoDataWidget(
    reload: widget.reload,
    title: "Oops! No Connection.",
    errorMessage: "Check your connection and\\ntry again.",
    buttonText: "Refresh",
    customButtonFunction: widget.customButtonFunction,
    scrollPhysics: widget.scrollPhysics,
    topMargin: widget.topMargin,
    emptyMainAxisAlignment: widget.emptyMainAxisAlignment,
    titleTextStyle: widget.titleTextStyle,
    errorMessageTextStyle: widget.errorMessageTextStyle,
  );

  //<=========loader state widget========>/
  Widget get loader =>
      widget.loader ??
      const Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );

  //<=========NoData state widget========>/
  Widget get noData =>
      widget.noData ??
      _CommonErrorOrNoDataWidget(
        reload: widget.reload,
        title: widget.emptyScreenTitle ?? "No Data Here Yet",
        errorMessage:
            widget.emptyScreenDescription ??
            "There's nothing to show in this\\nsection right now.",
        buttonText: widget.buttonText ?? "Refresh",
        customButtonFunction: widget.customButtonFunction,
        scrollPhysics: widget.scrollPhysics,
        topMargin: widget.topMargin,
        emptyMainAxisAlignment: widget.emptyMainAxisAlignment,
        titleTextStyle: widget.titleTextStyle,
        errorMessageTextStyle: widget.errorMessageTextStyle,
      );

  //<=========No search data state widget========>/
  Widget get noSearchData =>
      widget.noSearchData ??
      _CommonErrorOrNoDataWidget(
        reload: widget.reload,
        title: widget.emptyScreenTitle ?? "Sorry, no results found!",
        errorMessage:
            widget.emptyScreenDescription ??
            "Please try refining your search\\nor using different keywords.",
        buttonText: widget.buttonText,
        customButtonFunction: widget.customButtonFunction,
        scrollPhysics: widget.scrollPhysics,
        topMargin: widget.topMargin,
        emptyMainAxisAlignment: widget.emptyMainAxisAlignment,
        titleTextStyle: widget.titleTextStyle,
        errorMessageTextStyle: widget.errorMessageTextStyle,
      );

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 100),
      child: switch (widget.loaderState) {
        LoaderState.error => error,
        LoaderState.serverError => serverError,
        LoaderState.loading => loader,
        LoaderState.loaded => widget.child,
        LoaderState.networkError => networkError,
        LoaderState.noData => noData,
        LoaderState.noSearchData => noSearchData,
      },
    );
  }
}

class _CommonErrorOrNoDataWidget extends StatefulWidget {
  final String? title;
  final String? errorMessage;
  final String? buttonText;
  final bool isServerError;
  final MainAxisAlignment? emptyMainAxisAlignment;
  final void Function()? reload;
  final ScrollPhysics? scrollPhysics;
  final double? topMargin;
  final void Function()? customButtonFunction;
  final TextStyle? titleTextStyle;
  final TextStyle? errorMessageTextStyle;

  const _CommonErrorOrNoDataWidget({
    this.title,
    this.errorMessage,
    this.isServerError = false,
    this.reload,
    this.buttonText,
    this.customButtonFunction,
    this.topMargin,
    this.scrollPhysics,
    this.emptyMainAxisAlignment,
    this.titleTextStyle,
    this.errorMessageTextStyle,
  });

  @override
  State<_CommonErrorOrNoDataWidget> createState() =>
      _CommonTabErrorOrNoDataWidgetState();
}

class _CommonTabErrorOrNoDataWidgetState
    extends State<_CommonErrorOrNoDataWidget> {
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  @override
  void dispose() {
    isLoading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SingleChildScrollView(
              physics:
                  widget.scrollPhysics ?? const NeverScrollableScrollPhysics(),
              child: SizedBox(
                width: context.sw(),
                child: Column(
                  mainAxisAlignment:
                      widget.emptyMainAxisAlignment ?? MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    (widget.emptyMainAxisAlignment != null)
                        ? const SizedBox.shrink()
                        : SizedBox(height: widget.topMargin ?? 43),
                    widget.isServerError
                        ? Text("500", style: InterFontPalette.fBlack_32_600)
                        : SizedBox.square(
                            dimension: 104.w,
                            child: Center(
                              child: Icon(
                                Icons.error_outline,
                                size: 104,
                                color: ColorPalette.grey,
                              ),
                            ),
                          ),
                    SizedBox(height: widget.isServerError ? 5 : 16),
                    Text(
                      widget.title ?? "Error",
                      style:
                          widget.titleTextStyle ??
                          InterFontPalette.fBlack_16_600,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.errorMessage ?? "Something went wrong!",
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style:
                          widget.errorMessageTextStyle ??
                          InterFontPalette.fBlack_14_400,
                    ),
                    if (widget.buttonText != null) const SizedBox(height: 24),
                    if (widget.buttonText != null)
                      ValueListenableBuilder(
                        valueListenable: isLoading,
                        builder: (_, loading, __) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorPalette.primaryColor,
                            ),
                            onPressed: () {
                              if (widget.customButtonFunction != null) {
                                widget.customButtonFunction?.call();
                              } else if (widget.reload != null) {
                                showLoader(widget.reload!);
                              }
                            },
                            child: Text(
                              widget.buttonText ?? 'Refresh',
                              style: InterFontPalette.fWhite_14_600,
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showLoader(Function callback) {
    isLoading.value = true;
    Future.delayed(const Duration(milliseconds: 200), () {
      callback.call();
      isLoading.value = false;
    });
  }
}
