import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start/controller/math_controller.dart';

class RowBtns extends StatelessWidget {
  const RowBtns({
    super.key,
    required this.context,
    required this.btns,
  });

  final BuildContext context;
  final List<String> btns;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: btns
          .map(
            (item) => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () => context.read<MathController>().onTap(item),
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: item == 'remove'
                      ? const Icon(
                          Icons.backspace,
                          size: 28,
                          color: Colors.red,
                        )
                      : Text(item),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
