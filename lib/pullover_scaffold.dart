import 'package:flutter/material.dart';
import 'styles.dart';

class SidebarItem extends StatelessWidget {
  final String text;

  const SidebarItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        this.text,
        style: sidebarItemTextStyle,
      ),
    );
  }
}

class _PulloverScaffoldState extends State<PulloverScaffold>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  bool isExpanded;

  @override
  void initState() {
    super.initState();

    isExpanded = false;

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 350),
    );

    _animation = Tween<double>(begin: -1, end: 0).animate(
      CurvedAnimation(
        curve: Curves.easeInOutCubic,
        parent: _animationController,
      ),
    );
  }

  _buildSidebarItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SidebarItem("Visitors"),
        SidebarItem("Packages"),
        SidebarItem("Marketplace"),
        SidebarItem("Amenities"),
        SidebarItem("Security"),
        SidebarItem("Green Building"),
        SidebarItem("Offers"),
        SidebarItem("Fire Safety"),
      ],
    );
  }

  _buildSidebarHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Hey, Zane!',
            style: ih1TextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Where to?',
            style: ih3TextStyle,
          ),
          SizedBox(
            height: 60,
          ),
          _buildSidebarItems(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          widget.child,
          AnimatedBuilder(
            animation: _animationController,
            builder: (ctx, widget) {
              return Transform(
                transform:
                    Matrix4.translationValues(_animation.value * 350, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withAlpha((100 * (1 + _animation.value)).toInt()),
                        blurRadius: 50,
                        offset: Offset(6, 0),
                      ),
                    ],
                  ),
                  width: 350,
                  height: double.infinity,
                  child: Transform.translate(
                    child: _buildSidebarHeader(),
                    offset: Offset(0, 100),
                  ),
                ),
              );
            },
          ),
          Positioned(
            left: 0,
            top: 64,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: GestureDetector(
                  onTap: () {
                    if (isExpanded) {
                      _animationController.reverse();
                      isExpanded = false;
                    } else {
                      _animationController.forward();
                      isExpanded = true;
                    }
                  },
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (ctx, child) {
                      return Icon(
                        isExpanded ? Icons.close : Icons.menu,
                        color: isExpanded ? Colors.white : primaryColor,
                      );
                    },
                  )),
            ),
          ),
          AnimatedBuilder(
            animation: _animationController,
            builder: (ctx, child) {
            return Positioned(
              bottom: 40,
              left: 32,
              child: Transform(
                transform: Matrix4.translationValues(_animation.value * 350, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("SETTINGS", style: ih6TextStyle,),
                    SizedBox(height: 12,),
                    Text("HELP", style: ih6TextStyle,),
                  ],
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}

class PulloverScaffold extends StatefulWidget {
  final Widget child;

  const PulloverScaffold({this.child});

  @override
  State<StatefulWidget> createState() => _PulloverScaffoldState();
}
