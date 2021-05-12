import 'package:flutter/material.dart';
import 'package:schedule/logic/Day.dart';

class ReorderButton extends StatefulWidget {
  final UpOrDown direction;
  final int index;
  final bool enabled;
  final VoidCallback reload;

  const ReorderButton._internal(Key key, this.direction, this.index, this.enabled, this.reload) : super(key: key);

  factory ReorderButton(UpOrDown direction, int index, VoidCallback reload, {Key key}) {
    bool enabled = true;

    if (index == 0 && direction == UpOrDown.Up) {
      enabled = false;
    }
    if (index == Days.days[Days.selectedDay].items.length - 1 && direction == UpOrDown.Down) {
      enabled = false;
    }

    return ReorderButton._internal(key, direction, index, enabled, reload);
  }

  @override
  State<StatefulWidget> createState() {
    return new ReorderButtonState();
  }
}

class ReorderButtonState extends State<ReorderButton> {
  @override
  Widget build(BuildContext context) {
    return new IconButton(
      icon: Icon((widget.direction == UpOrDown.Up) ? Icons.arrow_upward : Icons.arrow_downward),
      onPressed: widget.enabled
          ? () {
              Days.switchItems(direction: widget.direction, itemIndex: widget.index);
              widget.reload();
              setState(() {});
            }
          : null,
    );
  }
}

enum UpOrDown { Up, Down }
