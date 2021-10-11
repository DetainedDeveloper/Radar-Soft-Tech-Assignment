import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radar_soft_tech/features/users/controller/users_controller.dart';

class ListGridSwitch extends StatelessWidget {
  const ListGridSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UsersController _controller = Provider.of<UsersController>(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.article_outlined),
        Switch(
          activeColor: const Color(0xFFFFC107),
          value: _controller.showGrid,
          onChanged: (newValue) => _controller.setGrid(newValue),
        ),
        const Icon(Icons.grid_on_outlined),
      ],
    );
  }
}
