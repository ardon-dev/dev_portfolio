import 'package:dev_portfolio/data/model/link.dart';
import 'package:dev_portfolio/main.dart';
import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  final Link link;
  final Function() onClick;

  const LinkButton({super.key, required this.link, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: link.url,
      child: IconButton.filledTonal(
        onPressed: () => onClick(),
        icon: Image.network(
          link.iconUrl,
          width: 18,
          height: 18,
          color: context.colorScheme.primary,
        ),
      ),
    );
  }
}
