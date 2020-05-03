import 'package:flutter/material.dart';
import 'package:umit/src/global/text_style.dart';
import 'package:umit/ui/pages/navigation/courses_page/course_description.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _subjects = [
      "Англ.яз",
      "Матем",
      "Физика",
      "Физра",
      "Химия",
      "ИЗО",
      "Ардуино",
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Назад", style: appBarTextStyle),
          titleSpacing: 0,
        ),
        body: ListView.separated(
          itemCount: 11,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return ExpansionTile(
              title: Text(
                "${1 + index} класс",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  shrinkWrap: true,
                  itemCount: _subjects.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return FlatButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CourseDescriptionPage(),
                          ),
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.redAccent,
                          ),
                          padding: const EdgeInsets.all(2.5),
                          child: Icon(
                            Icons.functions,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        title: Text(
                          _subjects[index],
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(thickness: 1, color: Colors.black12);
                  },
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(thickness: 1, color: Colors.black12);
          },
        ),
      ),
    );
  }
}
