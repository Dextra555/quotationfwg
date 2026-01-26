import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/questionnaire_template_model.dart';
import '../controllers/questionnaire_controller.dart';

class DynamicQuestionWidget extends StatelessWidget {
  final Question question;
  final dynamic answer;
  final Function(dynamic) onAnswerChanged;
  final Color primaryColor;
  final BuildContext widgetContext;

  const DynamicQuestionWidget({
    super.key,
    required this.question,
    required this.answer,
    required this.onAnswerChanged,
    this.primaryColor = const Color(0xFF8B0000),
    required this.widgetContext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Question text with mandatory indicator
        Row(
          children: [
            Flexible(
              child: Text(
                question.text + (question.isMandatory ? ' *' : ''),
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.visible,
                maxLines: 3,
              ),
            ),
            if (question.isMandatory)
              Text(
                '*',
                style: GoogleFonts.poppins(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
        
        if (question.helpText != null) ...[
          const SizedBox(height: 4),
          Text(
            question.helpText!,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
        
        const SizedBox(height: 8),
        
        // Question input based on type
        _buildQuestionInput(),
        
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildQuestionInput() {
    switch (question.type.toLowerCase()) {
      case 'text':
      case 'textarea':
        return _buildTextInput();
      case 'number':
        return _buildNumberInput();
      case 'dropdown':
        return _buildDropdown();
      case 'mcq':
        return _buildMCQ();
      case 'checkbox':
        return _buildCheckbox();
      case 'date':
        return _buildDateInput();
      default:
        return _buildTextInput();
    }
  }

  Widget _buildTextInput() {
    return TextField(
      controller: TextEditingController(text: answer?.toString() ?? ''),
      maxLines: question.type.toLowerCase() == 'textarea' ? 4 : 1,
      decoration: InputDecoration(
        hintText: 'Enter ${question.text.toLowerCase()}',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: primaryColor),
        ),
      ),
      onChanged: (value) => onAnswerChanged(value),
    );
  }

  Widget _buildNumberInput() {
    return TextField(
      controller: TextEditingController(text: answer?.toString() ?? ''),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Enter number',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: primaryColor),
        ),
      ),
      onChanged: (value) {
        final numValue = int.tryParse(value) ?? 0;
        onAnswerChanged(numValue);
      },
    );
  }

  Widget _buildDropdown() {
    if (question.options == null || question.options!.isEmpty) {
      return const Text('No options available');
    }

    return DropdownButtonFormField<String>(
      value: answer?.toString().isNotEmpty == true ? answer.toString() : null,
      items: question.options!.map((option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
      onChanged: (value) => onAnswerChanged(value),
      decoration: InputDecoration(
        hintText: 'Select an option',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: primaryColor),
        ),
      ),
    );
  }

  Widget _buildMCQ() {
    if (question.options == null || question.options!.isEmpty) {
      return const Text('No options available');
    }

    return Column(
      children: question.options!.map((option) {
        final isSelected = answer?.toString() == option;
        return InkWell(
          onTap: () => onAnswerChanged(option),
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? primaryColor : const Color(0xFFE0E0E0),
              ),
              borderRadius: BorderRadius.circular(6),
              color: isSelected ? primaryColor.withOpacity(0.1) : Colors.white,
            ),
            child: Row(
              children: [
                Radio<String>(
                  value: option,
                  groupValue: answer?.toString(),
                  activeColor: primaryColor,
                  onChanged: (value) => onAnswerChanged(value),
                ),
                Flexible(
                  child: Text(
                    option,
                    style: GoogleFonts.poppins(
                      color: isSelected ? primaryColor : Colors.black,
                      fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                    ),
                    overflow: TextOverflow.visible,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCheckbox() {
    if (question.options == null || question.options!.isEmpty) {
      return const Text('No options available');
    }

    final selectedOptions = answer is List ? List<String>.from(answer) : <String>[];

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: question.options!.map((option) {
          final isSelected = selectedOptions.contains(option);
          return InkWell(
            onTap: () {
              final newSelectedOptions = List<String>.from(selectedOptions);
              if (isSelected) {
                newSelectedOptions.remove(option);
              } else {
                newSelectedOptions.add(option);
              }
              onAnswerChanged(newSelectedOptions);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Checkbox(
                    value: isSelected,
                    activeColor: primaryColor,
                    onChanged: (value) {
                      final newSelectedOptions = List<String>.from(selectedOptions);
                      if (value == true) {
                        if (!newSelectedOptions.contains(option)) {
                          newSelectedOptions.add(option);
                        }
                      } else {
                        newSelectedOptions.remove(option);
                      }
                      onAnswerChanged(newSelectedOptions);
                    },
                  ),
                  Flexible(
                    child: Text(
                      option,
                      style: GoogleFonts.poppins(
                        color: isSelected ? primaryColor : Colors.black,
                        fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                      ),
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDateInput() {
    return TextField(
      controller: TextEditingController(text: answer?.toString() ?? ''),
      readOnly: true,
      decoration: InputDecoration(
        hintText: 'Select date',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: primaryColor),
        ),
        suffixIcon: Icon(Icons.calendar_today, color: primaryColor),
      ),
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: widgetContext,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (picked != null) {
          onAnswerChanged(picked.toIso8601String().split('T')[0]);
        }
      },
    );
  }
}
