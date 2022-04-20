part of flutter_cupertino_settings;

/// Provides a button for navigation
class CSLink extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? detail;
  final VoidCallback? onPressed;
  final double titleFontSize;
  final double subTitleFontSize;
  final CSWidgetStyle style;
  final bool addPaddingToBorder;
  final bool showTopBorder;
  final Widget? trailing;
  final CellType cellType;

  const CSLink({
    required this.title,
    this.onPressed,
    this.subtitle,
    this.detail,
    this.style = CS_DEFAULT_STYLE,
    this.titleFontSize = CS_TITLE_FONT_SIZE,
    this.subTitleFontSize = CS_SUBTITLE_FONT_SIZE,
    this.addPaddingToBorder = true,
    this.showTopBorder = false,
    this.trailing,
    this.cellType = CellType.defaultStyle,
  });

  @override
  Widget build(BuildContext context) {
    final showSubtitle = (cellType == CellType.subtitleDetailStyle ||
            cellType == CellType.subtitleStyle) &&
        subtitle != null &&
        subtitle!.isNotEmpty;

    // return CSWidget(
    return Material(
      child: ListTile(
        onTap: onPressed,
        title: Text(title),
        subtitle: showSubtitle
            ? Text(
                subtitle!,
                style: basicTextStyle(context).copyWith(
                  color: CupertinoColors.secondaryLabel.resolveFrom(context),
                  fontSize: subTitleFontSize,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 1,
                overflow: TextOverflow.clip,
              )
            : null,
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: CupertinoColors.secondaryLabel.resolveFrom(context),
          size: CS_CHEVRON_SIZE,
        ),
      ),
    );
    // style: style,
    // addPaddingToBorder: addPaddingToBorder,
    // showTopBorder: showTopBorder,
    // );
  }
}

enum CellType {
  /// Default Style with optional widget on left side and left-aligned title
  defaultStyle,

  /// Left-aligned title and left-aligned subtitle below
  subtitleStyle,

  /// Left-aligned title, left-aligned subtitle below and right-aligned detail
  subtitleDetailStyle,
}
