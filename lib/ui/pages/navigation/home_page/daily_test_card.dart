import 'package:flutter/material.dart';
import 'dart:math';

class DailyTestCard extends StatelessWidget {
  const DailyTestCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 40, right: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Transform.rotate(
                angle: pi / 4,
                child: Container(
                  width: 7.5,
                  height: 7.5,
                  color: Theme.of(context).accentColor,
                ),
              ),
              SizedBox(width: 20),
              Text(
                "Ежедневные тесты",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          SizedBox(height: 20),
          FlatButton(
            onPressed: () {},
            color: Color(0xFFF6F6F6),
            padding: EdgeInsets.all(15),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black54,
                      fontFamily: "Gilroy",
                      fontSize: 18,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            "Тест по математике\n\n", //брать переменную с сервера
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text:
                            "Проверь свои знания!\n10 вопросов", //брать переменную с сервера
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.image,
                  size: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}