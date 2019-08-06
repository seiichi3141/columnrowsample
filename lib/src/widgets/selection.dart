import 'package:flutter_web/material.dart';

class Selection extends StatefulWidget {
  final String title;
  final List<dynamic> selections;
  final int initSelection;
  final ValueChanged<int> onSelectChanged;

  Selection(
      {this.title, this.selections, this.initSelection, this.onSelectChanged});

  SelectionState createState() => SelectionState();
}

class SelectionState extends State<Selection> {
  int _page = 0;
  PageController _controller;

  void initState() {
    super.initState();
    _page = widget.initSelection;
    _controller = PageController(initialPage: widget.initSelection);
  }

  Widget build(context) {
    final textStyle = Theme.of(context).textTheme.subtitle.copyWith(
          color: Colors.white,
        );

    final children = widget.selections.map((sel) {
      final text =
          sel.toString().replaceFirst(sel.toString().split('.')[0] + ".", "");
      return Center(
        child: Text(text, style: textStyle),
      );
    }).toList();

    return Row(
      children: [
        Expanded(
          child: Text(
            widget.title,
            style: textStyle,
            softWrap: false,
          ),
        ),
        GestureDetector(
          onTap: _page <= 0
              ? null
              : () {
                  setState(() {
                    _page--;
                    _controller.animateToPage(
                      _page,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  });
                },
          child: Icon(Icons.arrow_left,
              color: _page <= 0 ? Colors.grey : Colors.white),
        ),
        SizedBox(
          width: 100.0,
          height: 20.0,
          child: PageView(
            controller: _controller,
            children: children,
            onPageChanged: (page) {
              setState(() {
                _page = page;
              });
              widget.onSelectChanged(_page);
            },
          ),
        ),
        GestureDetector(
          onTap: _page >= widget.selections.length - 1
              ? null
              : () {
                  setState(() {
                    _page++;
                    _controller.animateToPage(
                      _page,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  });
                },
          child: Icon(Icons.arrow_right,
              color: _page >= widget.selections.length - 1
                  ? Colors.grey
                  : Colors.white),
        )
      ],
    );
  }
}
