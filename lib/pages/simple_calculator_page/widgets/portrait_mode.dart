import 'package:flutter/material.dart';
import 'package:start/pages/simple_calculator_page/widgets/input_container.dart';
import 'package:start/widgets/row_btns.dart';

class PortraitMode extends StatelessWidget {
  const PortraitMode({
    super.key,
    required this.expressionLists,
  });

  final List<List<String>> expressionLists;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Expanded(
          flex: 35,
          child: InputContainer(),
        ),
        Expanded(
          flex: 65,
          child: Column(
            children: expressionLists
                .map(
                  (e) => Expanded(
                    child: RowBtns(context: context, btns: e),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
