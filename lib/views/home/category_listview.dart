import 'package:aceshop/models/constraints/catrgories_temp.dart';
import 'package:aceshop/models/constraints/constraints.dart';
import 'package:flutter/widgets.dart';

class CatrgoryListView extends StatelessWidget {
  const CatrgoryListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Category ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'See all',
                style: TextStyle(color: primary, fontWeight: FontWeight.w300),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.13,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: categoryTemp.length,
                itemBuilder: ((context, index) {
                  return SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.only(
                              top: 8, bottom: 8, left: 0, right: 8),
                          decoration: BoxDecoration(
                              color: colorList[index].withOpacity(0.3),
                              borderRadius: BorderRadius.circular(8)),
                          child: Icon(
                            categoryTemp.values.elementAt(index),
                            color: colorList[index],
                          ),
                        ),
                        Text(categoryTemp.keys.elementAt(index) + '  ')
                      ],
                    ),
                  );
                })),
          ),
        ),
      ],
    );
  }
}
