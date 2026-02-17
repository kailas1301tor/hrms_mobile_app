import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms_mobile/res/enums/enums.dart' show LoaderState;
import 'package:hrms_mobile/utils/helpers/extensions.dart';

import '../../res/styles/color_palette.dart';
import '../../res/styles/fonts/inter_font_palette.dart';
import 'shimmer_loaders.dart';



Widget buttonLoader({double? loadingRadius, Color? color}) =>
    CupertinoActivityIndicator(
      radius: loadingRadius ?? 18,
      color: color ?? ColorPalette.white,
    );

class CommonSwitchState extends StatefulWidget {
  final LoaderState loaderState;
  final void Function()? reload;
  final Widget child;
  final Widget? loader;
  final String? errorTitle;
  final String? errorMessage;
  final String? buttonText;
  final Widget? noData;
  final Widget? noSearchData;
  final Widget? errorWidget;
  final String? emptyScreenTitle;
  final String? emptyScreenDescription;
  final TextStyle? titleStyle;
  final TextStyle? errorMsgStyle;
  final ScrollPhysics? scrollPhysics;
  final double? topMargin;
  final void Function()? customButtonFunction;
  final MainAxisAlignment? emptyMainAxisAlignment;

  const CommonSwitchState({
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
    this.scrollPhysics,
    this.emptyScreenTitle,
    this.topMargin,
    this.emptyScreenDescription,
    this.emptyMainAxisAlignment,
    this.customButtonFunction,
    this.titleStyle,
    this.errorMsgStyle,
  });

  @override
  State<CommonSwitchState> createState() => _CommonSwitchStateState();
}

class _CommonSwitchStateState extends State<CommonSwitchState> {
  /*<=========Error state widget========>*/
  Widget get error =>
      widget.errorWidget ??
      CommonErrorOrNoDataWidget(
        title: widget.errorTitle,
        errorMessage: widget.errorMessage,
        scrollPhysics: widget.scrollPhysics,
        titleStyle: widget.titleStyle,
        errorMsgStyle: widget.errorMsgStyle,
        topMargin: widget.topMargin,
        emptyMainAxisAlignment: widget.emptyMainAxisAlignment,
        buttonText: "Refresh",
        reload: () => widget.reload?.call(),
      );

  /*<=========Server Error state widget========>*/
  Widget get serverError => CommonErrorOrNoDataWidget(
    reload: widget.reload,
    isServerError: true,
    title: "Server error",
    errorMessage: "Oops, something went wrong..",
    buttonText: widget.buttonText ?? "Refresh",
    customButtonFunction: widget.reload,
    scrollPhysics: widget.scrollPhysics,
    topMargin: widget.topMargin,
    emptyMainAxisAlignment: widget.emptyMainAxisAlignment,
    titleStyle: widget.titleStyle,
    errorMsgStyle: widget.errorMsgStyle,
  );

  /*<=========NetWorkError state widget========>*/
  Widget get networkError => CommonErrorOrNoDataWidget(
    reload: widget.reload,
    title: "Oops! No Connection.",
    errorMessage: "Check your connection and try again.",
    buttonText: "Refresh",
    customButtonFunction: widget.reload,
    scrollPhysics: widget.scrollPhysics,
    topMargin: widget.topMargin,
    emptyMainAxisAlignment: widget.emptyMainAxisAlignment,
    titleStyle: widget.titleStyle,
    errorMsgStyle: widget.errorMsgStyle,
  );

  /*<=========loader state widget========>*/
  Widget get loader => widget.loader ?? _DefaultShimmerLoader();

  /*<=========NoData state widget========>*/
  Widget get noData =>
      widget.noData ??
      CommonErrorOrNoDataWidget(
        title: widget.emptyScreenTitle ?? "No Data Here Yet",
        errorMessage:
            widget.emptyScreenDescription ??
            "There's nothing to show in this section right now.",
        buttonText: widget.buttonText ?? "Refresh",
        customButtonFunction: widget.customButtonFunction,
        scrollPhysics: widget.scrollPhysics,
        topMargin: widget.topMargin,
        emptyMainAxisAlignment: widget.emptyMainAxisAlignment,
        titleStyle: widget.titleStyle,
        errorMsgStyle: widget.errorMsgStyle,
      );

  /*<=========No search data state widget========>*/
  Widget get noSearchData =>
      widget.noSearchData ??
      CommonErrorOrNoDataWidget(
        title: widget.emptyScreenTitle ?? "Sorry, no results found!",
        errorMessage:
            widget.emptyScreenDescription ??
            "Please try refining your search\\nor using different keywords.",
        buttonText: widget.buttonText,
        customButtonFunction: widget.customButtonFunction,
        scrollPhysics: widget.scrollPhysics,
        topMargin: widget.topMargin,
        emptyMainAxisAlignment: widget.emptyMainAxisAlignment,
        titleStyle: widget.titleStyle,
        errorMsgStyle: widget.errorMsgStyle,
      );

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      key: ValueKey(widget.loaderState),
      transitionBuilder: (child, animation) =>
          FadeTransition(opacity: animation, child: child),
      duration: const Duration(milliseconds: 400),
      child: switch (widget.loaderState) {
        LoaderState.error => error,
        LoaderState.serverError => serverError,
        LoaderState.loading => loader,
        LoaderState.loaded => widget.child,
        LoaderState.networkError => networkError,
        LoaderState.noData => Center(child: noData),
        LoaderState.noSearchData => noSearchData,
      },
    );
  }
}

/// Default shimmer loader for CommonSwitchState
class _DefaultShimmerLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CardListShimmer(itemCount: 5);
  }
}

class CommonErrorOrNoDataWidget extends StatefulWidget {
  final String? title;
  final String? errorMessage;
  final String? buttonText;
  final bool isServerError;
  final ScrollPhysics? scrollPhysics;
  final double? topMargin;
  final void Function()? reload;
  final void Function()? customButtonFunction;
  final MainAxisAlignment? emptyMainAxisAlignment;
  final TextStyle? titleStyle;
  final TextStyle? errorMsgStyle;

  const CommonErrorOrNoDataWidget({
    super.key,
    this.title,
    this.errorMessage,
    this.isServerError = false,
    this.reload,
    this.customButtonFunction,
    this.topMargin,
    this.scrollPhysics,
    this.emptyMainAxisAlignment,
    this.buttonText,
    this.titleStyle,
    this.errorMsgStyle,
  });

  @override
  State<CommonErrorOrNoDataWidget> createState() =>
      _CommonTabErrorOrNoDataWidgetState();
}

class _CommonTabErrorOrNoDataWidgetState
    extends State<CommonErrorOrNoDataWidget> {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
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
                        : Icon(
                            Icons.error_outline,
                            size: 104,
                            color: ColorPalette.grey,
                          ),
                    SizedBox(height: widget.isServerError ? 5 : 16),
                    Text(
                      widget.title ?? "Error",
                      style:
                          widget.titleStyle ?? InterFontPalette.fBlack_16_600,
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: context.sw(size: 0.6053),
                      child: Text(
                        widget.errorMessage ?? "Something went wrong!",
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style:
                            widget.errorMsgStyle ??
                            InterFontPalette.fBlack_14_400,
                      ),
                    ),
                    if (widget.buttonText != null) const SizedBox(height: 24),
                    if (widget.buttonText != null)
                      ValueListenableBuilder(
                        valueListenable: isLoading,
                        builder: (_, loading, __) {
                          return ElevatedButton(
                            onPressed: () {
                              if (widget.customButtonFunction != null) {
                                widget.customButtonFunction?.call();
                              } else if (widget.reload != null) {
                                showLoader(widget.reload!);
                              }
                            },
                            child: Text(widget.buttonText ?? 'Refresh'),
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
