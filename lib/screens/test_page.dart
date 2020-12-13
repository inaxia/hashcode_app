import 'package:flutter/material.dart';
import 'package:hashcode/courses/courses.dart';
import 'package:hashcode/custom/custom_colors.dart';
import 'package:hashcode/custom/custom_gifs.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final body = CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          backgroundColor: customDarkBlack,
          elevation: 1.0,
          title: Text('Test page'),
          centerTitle: true,
          floating: true,
          pinned: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        SliverGrid.count(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          children: List.generate(
            courses.length, 
            (index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: customLightBlack,
                  image: DecorationImage(
                    image: AssetImage(customGifs[index]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    courses[index][0],
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            }
          ),
        ),

        // SliverFillRemaining(
        //   child: GridView.count(
        //     physics: BouncingScrollPhysics(),
        //     crossAxisSpacing: 4.0,
        //     mainAxisSpacing: 4.0,
        //     crossAxisCount: 2,
        //     children: List.generate(
        //       courses.length, 
        //       (index) {
        //         return Container(
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.all(Radius.circular(5.0)),
        //             color: customLightBlack,
        //             image: DecorationImage(
        //               image: AssetImage(customGifs[index]),
        //               fit: BoxFit.cover,
        //             ),
        //           ),
        //           child: Padding(
        //             padding: EdgeInsets.all(8.0),
        //             child: Text(
        //               courses[index][0],
        //               style: TextStyle(
        //                 fontSize: 25.0,
        //                 color: Colors.black,
        //               ),
        //             ),
        //           ),
        //         );
        //       }
        //     ),
        //   ),
        // )
      ],
    );

    return Scaffold(
      backgroundColor: customDarkBlack,
      body: body,
    );
  }
}
