import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/questionnaire_template_model.dart';
import '../controllers/questionnaire_controller.dart';

class DynamicQuestionWidget extends StatefulWidget {
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
  State<DynamicQuestionWidget> createState() => _DynamicQuestionWidgetState();
}

class _DynamicQuestionWidgetState extends State<DynamicQuestionWidget> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.answer?.toString() ?? '');
  }

  // @override
  // void didUpdateWidget(DynamicQuestionWidget oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   // Update controller text if answer changed from outside
  //   if (oldWidget.answer != widget.answer) {
  //     _textController.text = widget.answer?.toString() ?? '';
  //   }
  // }


  @override
void didUpdateWidget(DynamicQuestionWidget oldWidget) {
  super.didUpdateWidget(oldWidget);

  // Only update controller when value REALLY changed from outside
  if (oldWidget.answer != widget.answer &&
      _textController.text != widget.answer?.toString()) {
    _textController.text = widget.answer?.toString() ?? '';
    _textController.selection = TextSelection.fromPosition(
      TextPosition(offset: _textController.text.length),
    );
  }
}


  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

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
                widget.question.text + (widget.question.isMandatory ? ' *' : ''),
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.visible,
                maxLines: 3,
              ),
            ),
            if (widget.question.isMandatory)
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
        
        if (widget.question.helpText != null) ...[
          const SizedBox(height: 4),
          Text(
            widget.question.helpText!,
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
    try {
      final questionType = widget.question.type.toLowerCase();
      print('Building question input for type: ${widget.question.type}'); // Debug log
      
      // Handle any possible question type dynamically
      switch (questionType) {
        case 'text':
        case 'textarea':
        case 'textfield':
        case 'input':
          return _buildTextInput();
        case 'number':
        case 'numeric':
        case 'integer':
        case 'decimal':
          return _buildNumberInput();
        case 'dropdown':
        case 'select':
        case 'choice':
          return _buildDropdown();
        case 'mcq':
        case 'radio':
        case 'radiobutton':
        case 'singlechoice':
          return _buildMCQ();
        case 'checkbox':
        case 'multiselect':
        case 'multicheckbox':
        case 'multiplechoice':
          return _buildCheckbox();
        case 'date':
        case 'datetime':
        case 'datepicker':
          return _buildDateInput();
        case 'email':
        case 'emailaddress':
          return _buildEmailInput();
        case 'tel':
        case 'phone':
        case 'telephone':
        case 'phonenumber':
          return _buildPhoneInput();
        case 'url':
        case 'website':
        case 'link':
          return _buildUrlInput();
        case 'password':
        case 'pass':
          return _buildPasswordInput();
        case 'range':
        case 'slider':
          return _buildRangeInput();
        case 'file':
        case 'upload':
        case 'attachment':
          return _buildFileInput();
        case 'time':
        case 'timepicker':
          return _buildTimeInput();
        case 'rating':
        case 'stars':
          return _buildRatingInput();
        default:
          // For unknown types, try to determine best input based on question text or options
          print('Unknown question type: ${widget.question.type}, analyzing to determine best input');
          return _buildDynamicFallback();
      }
    } catch (e) {
      print('Error building question input for type ${widget.question.type}: $e');
      // Return a simple text input as ultimate fallback
      return _buildTextInput();
    }
  }

  Widget _buildTextInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        child: TextField(
          controller: _textController,
          maxLines: widget.question.type.toLowerCase() == 'textarea' ? 4 : 1,
          decoration: InputDecoration(
            hintText: 'Enter ${widget.question.text.toLowerCase()}',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: widget.primaryColor),
            ),
          ),
          onChanged: (value) => widget.onAnswerChanged(value),
        ),
      ),
    );
  }

  Widget _buildNumberInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        child: TextField(
          controller: _textController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Enter number',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: widget.primaryColor),
            ),
          ),
          onChanged: (value) {
            final numValue = int.tryParse(value) ?? 0;
            widget.onAnswerChanged(numValue);
          },
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    if (widget.question.options == null || widget.question.options!.isEmpty) {
      return TextField(
        controller: _textController,
        decoration: InputDecoration(
          hintText: 'Enter ${widget.question.text.toLowerCase()}',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: widget.primaryColor),
          ),
        ),
        onChanged: (value) => widget.onAnswerChanged(value),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        child: DropdownButtonFormField<String>(
          value: widget.answer?.toString().isNotEmpty == true ? widget.answer.toString() : null,
          items: widget.question.options!.map((option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          onChanged: (value) => widget.onAnswerChanged(value),
          decoration: InputDecoration(
            hintText: 'Select an option',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: widget.primaryColor),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMCQ() {
    if (widget.question.options == null || widget.question.options!.isEmpty) {
      return TextField(
        controller: _textController,
        decoration: InputDecoration(
          hintText: 'Enter ${widget.question.text.toLowerCase()}',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: widget.primaryColor),
          ),
        ),
        onChanged: (value) => widget.onAnswerChanged(value),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.question.text,
                style: GoogleFonts.poppins(
                    fontSize: 15, fontWeight: FontWeight.w500)),
            if (widget.question.helpText != null)
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                child: Text(widget.question.helpText!,
                    style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[600])),
              ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFE0E0E0)),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                children: widget.question.options!.map((option) {
                  final isSelected = widget.answer?.toString() == option;
                  return InkWell(
                    onTap: () => widget.onAnswerChanged(option),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Radio<String>(
                            value: option,
                            groupValue: widget.answer?.toString(),
                            activeColor: widget.primaryColor,
                            onChanged: (value) => widget.onAnswerChanged(value),
                          ),
                          Flexible(
                            child: Text(
                              option,
                              style: GoogleFonts.poppins(
                                color: isSelected ? widget.primaryColor : Colors.black,
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckbox() {
    if (widget.question.options == null || widget.question.options!.isEmpty) {
      return TextField(
        controller: _textController,
        decoration: InputDecoration(
          hintText: 'Enter ${widget.question.text.toLowerCase()}',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: widget.primaryColor),
          ),
        ),
        onChanged: (value) => widget.onAnswerChanged(value),
      );
    }

    final selectedOptions = widget.answer is List ? List<String>.from(widget.answer) : <String>[];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE0E0E0)),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            children: widget.question.options!.map((option) {
              final isSelected = selectedOptions.contains(option);
              return InkWell(
                onTap: () {
                  final newSelectedOptions = List<String>.from(selectedOptions);
                  if (isSelected) {
                    newSelectedOptions.remove(option);
                  } else {
                    newSelectedOptions.add(option);
                  }
                  widget.onAnswerChanged(newSelectedOptions);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Checkbox(
                        value: isSelected,
                        activeColor: widget.primaryColor,
                        onChanged: (value) {
                          final newSelectedOptions = List<String>.from(selectedOptions);
                          if (value == true) {
                            if (!newSelectedOptions.contains(option)) {
                              newSelectedOptions.add(option);
                            }
                          } else {
                            newSelectedOptions.remove(option);
                          }
                          widget.onAnswerChanged(newSelectedOptions);
                        },
                      ),
                      Flexible(
                        child: Text(
                          option,
                          style: GoogleFonts.poppins(
                            color: isSelected ? widget.primaryColor : Colors.black,
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
        ),
      ),
    );
  }

  Widget _buildDateInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        child: TextField(
          controller: TextEditingController(text: widget.answer?.toString() ?? ''),
          readOnly: true,
          decoration: InputDecoration(
            hintText: 'Select date',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: widget.primaryColor),
            ),
            suffixIcon: Icon(Icons.calendar_today, color: widget.primaryColor),
          ),
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: widget.widgetContext,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
            if (picked != null) {
              widget.onAnswerChanged(picked.toIso8601String().split('T')[0]);
            }
          },
        ),
      ),
    );
  }

  Widget _buildEmailInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        child: TextField(
          controller: _textController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Enter email address',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: widget.primaryColor),
            ),
          ),
          onChanged: (value) => widget.onAnswerChanged(value),
        ),
      ),
    );
  }

  Widget _buildPhoneInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        child: TextField(
          controller: _textController,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            hintText: 'Enter phone number',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: widget.primaryColor),
            ),
          ),
          onChanged: (value) => widget.onAnswerChanged(value),
        ),
      ),
    );
  }

  Widget _buildUrlInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        child: TextField(
          controller: _textController,
          keyboardType: TextInputType.url,
          decoration: InputDecoration(
            hintText: 'Enter website URL',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: widget.primaryColor),
            ),
          ),
          onChanged: (value) => widget.onAnswerChanged(value),
        ),
      ),
    );
  }

  Widget _buildPasswordInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        child: TextField(
          controller: _textController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Enter password',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: widget.primaryColor),
            ),
          ),
          onChanged: (value) => widget.onAnswerChanged(value),
        ),
      ),
    );
  }

  Widget _buildRangeInput() {
    double currentValue = double.tryParse(widget.answer?.toString() ?? '0') ?? 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Value: ${currentValue.toInt()}'),
        Slider(
          value: currentValue,
          min: 0,
          max: 100,
          divisions: 20,
          activeColor: widget.primaryColor,
          onChanged: (value) => widget.onAnswerChanged(value.toInt()),
        ),
      ],
    );
  }

  Widget _buildFileInput() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Icon(Icons.upload_file, color: widget.primaryColor),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              widget.answer?.toString().isNotEmpty == true ? widget.answer.toString() : 'Tap to select file',
              style: TextStyle(
                color: widget.answer?.toString().isNotEmpty == true ? Colors.black : Colors.grey,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.browse_gallery),
            onPressed: () {
              // File picker functionality would go here
              widget.onAnswerChanged('file_selected_${DateTime.now().millisecondsSinceEpoch}');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTimeInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        child: TextField(
          controller: TextEditingController(text: widget.answer?.toString() ?? ''),
          readOnly: true,
          decoration: InputDecoration(
            hintText: 'Select time',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: widget.primaryColor),
            ),
            suffixIcon: Icon(Icons.access_time, color: widget.primaryColor),
          ),
          onTap: () async {
            final TimeOfDay? picked = await showTimePicker(
              context: widget.widgetContext,
              initialTime: TimeOfDay.now(),
            );
            if (picked != null) {
              widget.onAnswerChanged('${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}');
            }
          },
        ),
      ),
    );
  }

  Widget _buildRatingInput() {
    int rating = int.tryParse(widget.answer?.toString() ?? '0') ?? 0;
    return Row(
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
          ),
          onPressed: () => widget.onAnswerChanged(index + 1),
        );
      }),
    );
  }

  Widget _buildDynamicFallback() {
    // Analyze question text and options to determine best input type
    final questionText = widget.question.text.toLowerCase();
    
    // Check if it has options - if yes, use dropdown or MCQ
    if (widget.question.options != null && widget.question.options!.isNotEmpty) {
      if (widget.question.options!.length <= 5) {
        return _buildMCQ(); // Use radio buttons for few options
      } else {
        return _buildDropdown(); // Use dropdown for many options
      }
    }
    
    // Check question text for hints about input type
    if (questionText.contains('email') || questionText.contains('@')) {
      return _buildEmailInput();
    } else if (questionText.contains('phone') || questionText.contains('mobile') || questionText.contains('tel')) {
      return _buildPhoneInput();
    } else if (questionText.contains('date') || questionText.contains('birthday') || questionText.contains('born')) {
      return _buildDateInput();
    } else if (questionText.contains('password') || questionText.contains('pass') || questionText.contains('secret')) {
      return _buildPasswordInput();
    } else if (questionText.contains('url') || questionText.contains('website') || questionText.contains('link')) {
      return _buildUrlInput();
    } else if (questionText.contains('number') || questionText.contains('age') || questionText.contains('count')) {
      return _buildNumberInput();
    } else if (questionText.contains('describe') || questionText.contains('details') || questionText.contains('comment')) {
      return TextField(
        controller: _textController,
        maxLines: 4,
        decoration: InputDecoration(
          hintText: 'Enter details here...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: widget.primaryColor),
          ),
        ),
        onChanged: (value) => widget.onAnswerChanged(value),
      );
    }
    
    // Default fallback - text input
    return _buildTextInput();
  }
}
