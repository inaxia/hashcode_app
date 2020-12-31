import 'package:flutter/material.dart';
import 'package:hashcode/courses/courses.dart';
import 'package:hashcode/custom/custom_colors.dart';
import 'package:hashcode/custom/custom_gifs.dart';
import 'package:hashcode/custom/page_transitions/slide_left_route.dart';
import 'package:hashcode/screens/lessons.dart';
import 'package:hashcode/theme.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    final body = CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          floating: true,
          pinned: false,
          elevation: 1.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Dashboard'),
                         Switch(
                        value: _themeChanger.isLightTheme,
                        onChanged: (lightDark) {
                          if (lightDark)
                            _themeChanger.setTheme(ThemeData.light());
                          else
                            _themeChanger.setTheme(ThemeData.dark());
                        })
            ],
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, SlideLeftRoute(page: Lessons()));
              },
              child: CircleAvatar(
                backgroundColor: Colors.white70,
                backgroundImage: NetworkImage(
                  'https://i.pinimg.com/originals/da/51/c2/da51c26fe3398b0f8314fee17a98e0e7.jpg',
                ),
              ),
            ),
            SizedBox(width: 10.0),
          ],
        ),
        SliverGrid.count(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          children: List.generate(courses.length, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, SlideLeftRoute(page: Lessons(course: courses[index])));
              },
              child: Container(
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
              ),
            );
          }),
        ),
      ],
    );

    return Scaffold(
     
      body: body,
    );
  }
}
