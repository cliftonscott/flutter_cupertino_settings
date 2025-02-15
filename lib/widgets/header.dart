part of flutter_cupertino_settings;

/// This widgets is used as a grouping separator.
/// The [title] attribute is optional.
class CSHeader extends StatelessWidget {
  final String title;
  final Color backgroundColor;

  const CSHeader(this.title, this.backgroundColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
      decoration: BoxDecoration(
        color: this.backgroundColor,
      ),
      child: Text(
        title.toUpperCase(),
        style: basicTextStyle(context).copyWith(
          color: CupertinoColors.secondaryLabel.resolveFrom(context),
          fontSize: CS_HEADER_FONT_SIZE,
        ),
      ),
    );
  }
}
