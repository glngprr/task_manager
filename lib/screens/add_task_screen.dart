import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../widgets/custom_primary_button.dart';
import '../widgets/custom_text_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  void _saveTask() {
    if (_titleController.text.trim().isEmpty) return;

    Navigator.pop(context, {
      'title': _titleController.text.trim(),
      'category': _categoryController.text.trim().isEmpty
          ? 'General'
          : _categoryController.text.trim(),
      'isCompleted': false,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.textPrimary,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('New Task', style: AppTypography.headingMedium),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CustomTextField 1
              CustomTextField(
                label: 'Task Title',
                hintText: 'e.g., Selesaikan laporan praktikum',
                controller: _titleController,
              ),
              const SizedBox(height: 20),
              // CustomTextField 2
              CustomTextField(
                label: 'Category',
                hintText: 'e.g., Kuliah / Personal / Work',
                controller: _categoryController,
              ),
              const Spacer(),
              // CustomPrimaryButton untuk submit
              CustomPrimaryButton(text: 'Save Task', onPressed: _saveTask),
            ],
          ),
        ),
      ),
    );
  }
}
