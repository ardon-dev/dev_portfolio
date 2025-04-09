import 'package:dev_portfolio/data/model/link.dart';
import 'package:dev_portfolio/view/components/link_button.dart';
import 'package:flutter/material.dart';

class LinkHeader extends StatelessWidget {
  const LinkHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TODO: Remove this example
            LinkButton(
              link: Link(
                title: 'LinkedIn',
                url: '',
                iconUrl:
                    'https://cdn-icons-png.flaticon.com/512/4926/4926635.png',
              ),
              onClick: () {},
            ),
            // TODO: Remove this example
          ],
        ),
      ),
    );
  }
}
