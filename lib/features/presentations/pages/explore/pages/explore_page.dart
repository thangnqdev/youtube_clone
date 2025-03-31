import 'package:flutter/material.dart';
import 'package:youtube/features/domain/entities/item_explore.dart';
import 'package:youtube/features/presentations/pages/explore/widgets/items_explore.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Column(
            children: [
              Wrap(
                spacing: 2,
                runSpacing: 2,
                children: List.generate(items.length, (index) {
                  return itemLayout(items[index], context);
                }),
              ),
              SizedBox(height: 20),
              Align(alignment: Alignment.topLeft, child: Text(' Trending', style: TextStyle(fontSize: 20)))
            ],
          ),
        ],
      ),
    );
  }

  Widget itemLayout(ItemExplore item, BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.all(4.0),
      width: MediaQuery.of(context).size.width / 2.2,
      padding: EdgeInsets.only(left: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        gradient: item.bgItem,
      ),
      child: Row(
        children: [
          item.icon,
          SizedBox(width: 10),
          Text(
            item.title,
            style: TextStyle(color: Colors.white),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Spacer(),
          Expanded(child: item.image),
        ],
      ),
    );
  }
}
