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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Create at $date'),
          Padding(
            padding: const EdgeInsets.only(
              left: 5,
            ),
            child: Text(fact),
          ),
          const Divider(
            color: Colors.grey,
            indent: 16,
            endIndent: 16,
            height: 1,
          ),
        ],
      ),
    );
  }
}
