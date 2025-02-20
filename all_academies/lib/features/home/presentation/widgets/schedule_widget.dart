import 'package:flutter/material.dart';

class ScheduleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildDateItem("Sun", "02"),
        _buildDateItem("Mon", "03", isSelected: true),
        _buildDateItem("Tue", "04"),
        _buildDateItem("Wed", "05"),
        _buildDateItem("Thu", "06"),
      ],
    );
  }

  Widget _buildDateItem(String day, String date, {bool isSelected = false}) {
    return Column(
      children: [
        Text(day, style: TextStyle(color: Colors.grey)),
        SizedBox(height: 5),
        CircleAvatar(
          radius: 18,
          backgroundColor: isSelected ? Colors.black : Colors.grey[200],
          child: Text(date,
              style:
                  TextStyle(color: isSelected ? Colors.white : Colors.black)),
        ),
      ],
    );
  }
}
