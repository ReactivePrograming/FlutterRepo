import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' as timeDilation;

void main() => runApp(MaterialApp(home: RadialExpansionDemo()));


class Photo extends StatelessWidget {

  const Photo({Key key, this.photo, this.color, this.onTap}) : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Theme.of(context).primaryColor.withOpacity(0.25),
      child: InkWell(
        onTap: onTap,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints size) {
            return Image.network(
              photo,
              fit: BoxFit.contain,
            );
          },
        ),
      ),
    );
  }
}

class RadialExpansion extends StatelessWidget {

  RadialExpansion({Key key, this.maxRadius, this.child}) : clipRectSize = 2.0 * (maxRadius / math.sqrt2), super(key: key);

  final double maxRadius;
  final clipRectSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRect(
            child: child,
          ),
        ),
      ),
    );
  }

}

class RadialExpansionDemo extends StatelessWidget {
  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 128.0;
  static const opacityCurve = const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  static RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }

  static Widget _buildPage(BuildContext context, String imageName, String description) {

    return Container(
      color: Theme.of(context).canvasColor,
      child: Center(
        child: Card(
          elevation: 8.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: kMaxRadius * 2,
                height: kMaxRadius * 2,
                child: Hero(
                  createRectTween: _createRectTween,
                  tag: imageName,
                  child: RadialExpansion(
                    maxRadius: kMaxRadius,
                    child: Photo(
                      photo: imageName,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ),
              Text(
                description,
                style: TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 3.0,
              ),
              const SizedBox(height: 16.0,)
            ],
          ),
        ),
      ),
    );
  }


  static Widget _buildHero(BuildContext context, String imageName, String description) {

    return Container(
      width: kMinRadius * 2,
      height: kMinRadius * 2,
      child: Hero(
        createRectTween: _createRectTween,
        tag: imageName,
        child: RadialExpansion(
          maxRadius: kMaxRadius,
          child: Photo(
            photo: imageName,
            onTap: () {
              Navigator.of(context).push(
                  PageRouteBuilder<void>(
                    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondAnimation) {
                      return AnimatedBuilder(
                        animation: animation,
                        builder: (BuildContext context, Widget child) {
                          return Opacity(opacity: opacityCurve.transform(animation.value),
                            child: _buildPage(context, imageName, description),
                          );
                        },
                      );
                    }
                  ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    timeDilation.timeDilation = 5.0;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text('Basic ani'),),
        body: Container(
          padding: EdgeInsets.all(32),
          alignment: FractionalOffset.bottomLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildHero(context, 'https://tse4-mm.cn.bing.net/th?id=OIP.hQ-Ie_qt0vJiI7JgCED3YQHaHa&w=187&h=187&c=7&o=5&dpr=2&pid=1.7', 'textOne'),
              _buildHero(context, 'https://tse2-mm.cn.bing.net/th?id=OIP.iD0aSoSffGeRjcEZaajYVwHaJQ&w=217&h=271&c=8&o=5&pid=1.7', 'textTwo'),
              _buildHero(context, 'https://tse4-mm.cn.bing.net/th?id=OIP.TKG_ip8GVw4ervVAMSMGPgHaJQ&w=217&h=271&c=8&o=5&pid=1.7', 'textThree'),
            ],
          ),
        )
    );
  }
}

