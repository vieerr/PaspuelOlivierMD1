import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../atoms/custom_text_field.dart';
import '../atoms/custom_button.dart';

/// Molécula: Formulario de ingreso de número
class NumberInputForm extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onAnalyze;
  final String? errorText;
  final bool isLoading;

  const NumberInputForm({
    super.key,
    required this.controller,
    required this.onAnalyze,
    this.errorText,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomTextField(
          controller: controller,
          label: 'Número Entero Positivo',
          hint: 'Ingrese un número (ej: 12)',
          errorText: errorText,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        const SizedBox(height: 20),
        CustomButton(
          text: 'Verificar si es Abundante',
          onPressed: onAnalyze,
          isLoading: isLoading,
        ),
      ],
    );
  }
}
