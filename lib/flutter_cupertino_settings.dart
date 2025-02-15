library flutter_cupertino_settings;

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    show Divider, Icons, ListTile, Material, Theme;
import 'package:flutter/services.dart';

part 'widgets/button.dart';
part 'widgets/control.dart';
part 'widgets/description.dart';
part 'widgets/header.dart';
part 'widgets/link.dart';
part 'widgets/secret.dart';
part 'widgets/selection.dart';
part 'widgets/spacer.dart';
part 'widgets/widget.dart';

const double CS_ITEM_HEIGHT = 50.0;
const EdgeInsets CS_ITEM_PADDING =
    EdgeInsets.symmetric(horizontal: 10, vertical: 1);
const double CS_TITLE_FONT_SIZE = 16.0;
const double CS_SUBTITLE_FONT_SIZE = 11.0;
const double CS_HEADER_FONT_SIZE = 14.0;
const double CS_DESCRIPTION_FONT_SIZE = 13.0;
const double CS_ITEM_NAME_SIZE = 15.0;
const EdgeInsets CS_ICON_PADDING = EdgeInsets.only(
  right: 10.0,
  left: 4.0,
);
const CSWidgetStyle CS_DEFAULT_STYLE = CSWidgetStyle();
const double CS_CHECK_SIZE = 20.0;
const double CS_CHEVRON_SIZE = 20.0;

/// Event for [CSSelection]
typedef void SelectionCallback(int selected);

TextStyle basicTextStyle(BuildContext context) =>
    (kIsWeb
        ? Theme.of(context).textTheme.subtitle2
        : Platform.isIOS
            ? CupertinoTheme.of(context).textTheme.textStyle
            : Theme.of(context).textTheme.subtitle2) ??
    TextStyle();

class CupertinoSettings extends StatelessWidget {
  final List<Widget> items;
  final bool shrinkWrap;
  final ScrollController? scrollController;
  final Color? backgroundColor;

  const CupertinoSettings({
    required this.items,
    this.scrollController,
    this.shrinkWrap = false,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ??
          CupertinoColors.systemGroupedBackground.resolveFrom(context),
      child: SafeArea(
        bottom: false,
        child: shrinkWrap
            ? ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: CupertinoColors.opaqueSeparator.resolveFrom(context),
                  height: 1.0,
                ),
                shrinkWrap: shrinkWrap,
                itemCount: items.length,
                controller: scrollController,
                itemBuilder: (BuildContext context, int index) => items[index],
              )
            : Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: CupertinoColors.opaqueSeparator
                            .resolveFrom(context),
                        height: 1.0,
                      ),
                      shrinkWrap: shrinkWrap,
                      itemCount: items.length,
                      controller: scrollController,
                      itemBuilder: (BuildContext context, int index) =>
                          items[index],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
