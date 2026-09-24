import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../widgets/task_card.dart';
import 'add_task_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Dummy data sederhana
  final List<Map<String, dynamic>> _tasks = [
    {
      'title': 'Setup Flutter clean architecture',
      'category': 'Mobile Programming',
      'isCompleted': true,
    },
    {
      'title': 'Implement CustomPrimaryButton',
      'category': 'UI Component',
      'isCompleted': false,
    },
    {
      'title': 'Review tugas dengan dosen',
      'category': 'Academic',
      'isCompleted': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          'My Tasks',
          style: AppTypography.headingLarge.copyWith(fontSize: 20),
        ),
        centerTitle: false,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];
          // Menggunakan TaskCard custom widget
          return TaskCard(
            title: task['title'],
            category: task['category'],
            isCompleted: task['isCompleted'],
            onToggle: (val) {
              setState(() {
                task['isCompleted'] = val ?? false;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        elevation: 2,
        onPressed: () async {
          // Navigasi ke Add Task Screen
          final newTask = await Navigator.push<Map<String, dynamic>>(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskScreen()),
          );

          if (newTask != null) {
            setState(() {
              _tasks.add(newTask);
            });
          }
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
