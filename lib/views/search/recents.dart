import 'package:aceshop/models/constraints/constraints.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RecentSearch extends StatelessWidget {
  const RecentSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> rec_search = [
      'iPhone SE 128 Gb',
      'Phone under 40k',
      'Samsung Fold phone'
    ];
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
            rec_search.length,
            (index) => rec_search.isEmpty
                ? Container()
                : Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.clock,
                        color: secHalfGrey,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(rec_search[index]),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesomeIcons.xmark,
                            color: secDarkGrey,
                          ))
                    ],
                  )),
      ),
    );
  }
}
