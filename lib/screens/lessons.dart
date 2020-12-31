import 'package:flutter/material.dart';
import 'package:hashcode/custom/custom_colors.dart';
import 'package:hashcode/custom/page_transitions/slide_left_route.dart';
import 'package:hashcode/screens/about_topic.dart';

class Lessons extends StatelessWidget {
  final course;

  Lessons({this.course});

  @override
  Widget build(BuildContext context) {
    var courseContent = course[1];

    final body = CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          floating: true,
          pinned: false,
          centerTitle: true,
          title: Text('Lessons'),
          elevation: 1.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, SlideLeftRoute(page: AboutTopic(lesson: courseContent[index])));
                },
                child: Card(
                  // color: customLightBlack,
                  elevation: 8.0,
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            width: 1.0,
                            // color: Colors.white24
                          ),
                        ),
                      ),
                      child: Text(
                        (index + 1).toString(),
                        style: TextStyle( fontSize: 18.0),
                      ),
                    ),
                    title: Text(
                      courseContent[index][0],
                      style: TextStyle(
                        // color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.linear_scale, color: customPink),
                        Text(
                          " Intermediate",
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            childCount: course[1].length,
          ),
        ),
      ],
    );

    return Scaffold(
      body: body
    );
  }
}
