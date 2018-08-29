import 'package:flutter/material.dart';
import 'package:schedule/logic/Day.dart';

class ReorderButton extends StatefulWidget
{
  UpOrDown direction;
  int index;
  bool enabled;
  VoidCallback reload;

  ReorderButton(this.direction, this.index, this.reload)
  {
    enabled = true;

    if(index == 0 && direction == UpOrDown.Up)
    {
      enabled = false;
    }
    if(index == Days.days[Days.selectedDay].items.length - 1 && direction == UpOrDown.Down)
    {
      enabled = false;
    }
  }

  @override
  State<StatefulWidget> createState() {
    return new ReorderButtonState();
  }
}

class ReorderButtonState extends State <ReorderButton>
{
  @override
  Widget build(BuildContext context) {
    return new IconButton(
      icon: Icon( (widget.direction == UpOrDown.Up) ? Icons.arrow_upward : Icons.arrow_downward),

      onPressed: widget.enabled ?
          () {
            Days.switchItems(direction: widget.direction, itemIndex: widget.index);
            widget.reload();
            setState(() {
            });
          }
          : null,
    );
  }

}

enum UpOrDown
{
  Up, Down
}