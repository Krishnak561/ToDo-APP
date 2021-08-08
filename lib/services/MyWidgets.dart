import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Padding MyTodoTask(BuildContext context, String Task) {
  return Padding(
    padding: EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
    child: ListTileTheme(
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: ListTile(
          leading: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.check_circle_outline_rounded,
              size: 30,
              color: Colors.black,
            ),
          ),
          title: Text(Task),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(HeroDialogRoute(builder: (context) {
                    return _AddTodoPopupCard();
                  }));
                },
                child: Hero(
                  tag: 'toEdit',
                  child: Icon(
                    CupertinoIcons.create,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                CupertinoIcons.delete,
                size: 30,
                color: Colors.black,
              )
            ],
          )),
    ),
  );
}

class _AddTodoPopupCard extends StatelessWidget {
  const _AddTodoPopupCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Hero(
          tag: 'toEdit',
          child: Material(
            //color: AppColors.accentColor,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Edit',
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.black,
                    ),
                    Divider(
                      color: Colors.black54,
                      thickness: 0.2,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Write a note',
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.black54,
                      maxLines: 6,
                    ),
                    Divider(
                      color: Colors.black54,
                      thickness: 0.2,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Add'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeroDialogRoute<T> extends PageRoute<T> {
  HeroDialogRoute({
    @required WidgetBuilder builder,
    RouteSettings settings,
    bool fullscreenDialog = false,
  })  : _builder = builder,
        super(settings: settings, fullscreenDialog: fullscreenDialog);

  final WidgetBuilder _builder;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return _builder(context);
  }

  @override
  String get barrierLabel => 'Popup dialog open';
}
