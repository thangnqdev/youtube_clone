import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(child: Padding(
      padding: EdgeInsets.fromLTRB(0,9,9,9),
      child: Text('Recent'),
    ));
  }
}