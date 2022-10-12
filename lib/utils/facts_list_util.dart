import 'package:flutter/material.dart';

class FactsListUtil {
  const FactsListUtil._();

  static Widget buildFactsListItem(
    String date,
    String fact,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        16,
        4,
        16,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Create at: $date'),
          Padding(
            padding: const EdgeInsets.only(
              top: 6,
              bottom: 6,
            ),
            child: Text(fact),
          ),
          const Divider(
            color: Colors.grey,
            height: 1,
          ),
        ],
      ),
    );
  }
}
