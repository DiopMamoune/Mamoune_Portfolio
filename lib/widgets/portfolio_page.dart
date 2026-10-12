import 'package:flutter/material.dart';

class PortfolioPage extends StatelessWidget {
  final List<Widget> children;
  const PortfolioPage({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final inset = constraints.maxWidth > 800 ? 48.0 : 22.0;
        return SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1220),
              child: Padding(
                padding: EdgeInsets.fromLTRB(inset, 28, inset, 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
