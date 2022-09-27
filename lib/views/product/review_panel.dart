import 'package:flutter/material.dart';
import 'package:aceshop/constraints/constraints.dart';

class ReviewPanel extends StatelessWidget {
  const ReviewPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defpad,
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,

            children: const [
              Text(
                'Reviews (89)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Spacer(),
              Icon(
                Icons.star_rounded,
                color: primaryOrange,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                '4.0',
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
          ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              bool descExp = false;
              return Container(
                margin: EdgeInsets.only(top: 8, bottom: 8),
                padding: defpad,
                color: labelGrn.withOpacity(0.5),
                // decoration: BoxDecoration(
                //   color: labelBlue,
                //   borderRadius: BorderRadius.circular(10),
                // ),
                // margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: const DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                NetworkImage('https://picsum.photos/200/300'),
                          ),
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Jon Doe',
                                      style: TextStyle(
                                          color: primaryBlk,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: List.generate(
                                        5,
                                        (index) => Icon(
                                          Icons.star_rounded,
                                          color: primaryOrange,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  '3 days ago',
                                  style: TextStyle(
                                      color: primaryBlk,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w100),
                                ),
                              ],
                            ),
                          ),
                          Wrap(children: [
                            Text(
                              loremIps,
                              maxLines: 5,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(

                                  // color: primaryBlk,
                                  // fontSize: 20,

                                  fontWeight: FontWeight.w500),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: defpad + EdgeInsets.all(5),
              margin: defpad,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: primaryBlk,
                  )),
              child: Center(
                child: Text('See All Reviews'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
