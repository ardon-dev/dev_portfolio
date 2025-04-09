import 'package:dev_portfolio/data/model/link.dart';
import 'package:dev_portfolio/main.dart';
import 'package:dev_portfolio/view/components/link_button.dart';
import 'package:flutter/material.dart';

class LinkHeader extends StatelessWidget {
  final List<Link> links;

  const LinkHeader({super.key, required this.links});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [_title(context), SizedBox(height: 16.0), _buttons()],
        ),
      ),
    );
  }

  Text _title(BuildContext context) {
    return Text(
      'Contacto',
      style: context.textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  GridView _buttons() => GridView.extent(
    maxCrossAxisExtent: 300,
    shrinkWrap: true,
    childAspectRatio: 5,
    mainAxisSpacing: 16.0,
    crossAxisSpacing: 16.0,
    children:
        links.map((item) {
          return SizedBox(child: LinkButton(link: item, onClick: () {}));
        }).toList(),
  );
}
