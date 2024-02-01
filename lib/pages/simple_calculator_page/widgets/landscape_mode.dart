import 'package:flutter/material.dart';
import 'package:start/pages/simple_calculator_page/widgets/input_container.dart';
import 'package:start/widgets/row_btns.dart';

class LandscapeMode extends StatelessWidget {
  const LandscapeMode({
    super.key,
    required this.expressionLists,
  });

  final List<List<String>> expressionLists;

  @override
  Widget build(BuildContext context) {
    return Row(
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
