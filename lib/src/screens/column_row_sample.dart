import 'package:flutter_web/material.dart';
import '../widgets/selection.dart';
import '../widgets/item.dart';

class ColumnRowSample extends StatefulWidget {
  ColumnRowSampleState createState() => ColumnRowSampleState();
}

class ColumnRowSampleState extends State<ColumnRowSample> {
  int _selWidget = 0;
  int _selMainAlignments = 0;
  int _selMainSizes = 1;
  int _selCrossAlignments = 2;

  final _widgets = [
    "Column",
    "Row",
  ];

  final _mainAlignments = [
    MainAxisAlignment.start,
    MainAxisAlignment.end,
    MainAxisAlignment.center,
    MainAxisAlignment.spaceBetween,
    MainAxisAlignment.spaceAround,
    MainAxisAlignment.spaceEvenly,
  ];

  final _mainSizes = [
    MainAxisSize.min,
    MainAxisSize.max,
  ];

  final _crossAlignments = [
    CrossAxisAlignment.start,
    CrossAxisAlignment.end,
    CrossAxisAlignment.center,
    CrossAxisAlignment.stretch,
    CrossAxisAlignment.baseline,
  ];

  Widget build(context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
      bottomNavigationBar: BottomAppBar(child: _buildPanel()),
    );
  }

  Widget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(48.0),
      child: AppBar(
        leading: Icon(Icons.view_list),
        title: Text(
          'Column Row Sample',
          style: Theme.of(context).textTheme.subhead.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.blue[300],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Selection(
            title: 'Widget',
            selections: _widgets,
            initSelection: _selWidget,
            onSelectChanged: (i) {
              setState(() {
                _selWidget = i;
              });
            },
          ),
          Divider(),
          Selection(
            title: 'MainAxisAlignment',
            selections: _mainAlignments,
            initSelection: _selMainAlignments,
            onSelectChanged: (i) {
              setState(() {
                _selMainAlignments = i;
              });
            },
          ),
          Divider(),
          Selection(
            title: 'MainAxisSize',
            selections: _mainSizes,
            initSelection: _selMainSizes,
            onSelectChanged: (i) {
              setState(() {
                _selMainSizes = i;
              });
            },
          ),
          Divider(),
          Selection(
            title: 'CrossAxisAlignment',
            selections: _crossAlignments,
            initSelection: _selCrossAlignments,
            onSelectChanged: (i) {
              setState(() {
                _selCrossAlignments = i;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBody(context) {
    final children = [
      Item(
        color: Colors.primaries[0],
        size: Size(70, 70),
        text: '@',
        textStyle: Theme.of(context).textTheme.caption.copyWith(color: Colors.white),
      ),
      Item(
        color: Colors.primaries[4],
        size: Size(70, 70),
        text: '@',
        textStyle: Theme.of(context).textTheme.display2.copyWith(color: Colors.white),
      ),
      Item(
        color: Colors.primaries[8],
        size: Size(70, 70),
        text: '@',
        textStyle: Theme.of(context).textTheme.caption.copyWith(color: Colors.white),
      ),
    ];

    final widget = _widgets[_selWidget] == "Column"
        ? Column(
            mainAxisAlignment: _mainAlignments[_selMainAlignments],
            mainAxisSize: _mainSizes[_selMainSizes],
            crossAxisAlignment: _crossAlignments[_selCrossAlignments],
            textBaseline: TextBaseline.alphabetic,
            children: children,
          )
        : Row(
            mainAxisAlignment: _mainAlignments[_selMainAlignments],
            mainAxisSize: _mainSizes[_selMainSizes],
            crossAxisAlignment: _crossAlignments[_selCrossAlignments],
            textBaseline: TextBaseline.alphabetic,
            children: children,
          );

    return Container(
      color: Colors.grey[300],
      child: widget,
    );
  }
}
