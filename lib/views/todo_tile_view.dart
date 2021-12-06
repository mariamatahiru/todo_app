import 'package:flutter/material.dart';

import '../utils.dart';

class TodoTileView extends StatelessWidget {
  const TodoTileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors.pink,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Plan a trip to Finland',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: CostomBlue,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'to plan a trip to finland with friends and relatives' 'to plan a trip to finland with friends and relatives',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    )
                  ]),
            ),
            SizedBox(
              width: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.notifications,
                  color: Colors.pink,
                ),
                Text(
                  'yesterday',
                  style: TextStyle(color: Colors.pink),
                ),
                SizedBox(width: 10,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
