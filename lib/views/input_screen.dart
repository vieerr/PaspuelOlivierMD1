import 'package:flutter/material.dart';
import '../controllers/abundant_number_controller.dart';
import '../widgets/molecules/number_input_form.dart';

/// Vista: Pantalla de ingreso de número
class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController _controller = TextEditingController();
  final AbundantNumberController _abundantController =
      AbundantNumberController();

  void _analyzeNumber() {
    // Validación de longitud máxima
    if (_controller.text.trim().length > 10) {
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('El número es demasiado largo (máximo 10 dígitos)'),
        ),
      );
      return;
    }

    // Usar el controlador para analizar
    _abundantController.analyzeNumber(_controller.text);

    setState(() {});

    if (_abundantController.result != null) {
      Navigator.pushNamed(
        context,
        '/result',
        arguments: _abundantController.result,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Números Abundantes'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            // Título
            const Text(
              'Verificador de Números Abundantes',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            // Descripción
            Card(
              color: Colors.blue.shade50,
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Ejemplo: 12 es abundante porque:\n'
                  'Divisores: 1, 2, 3, 4, 6\n'
                  'Suma: 1+2+3+4+6 = 16 > 12',
                  style: TextStyle(fontSize: 14, height: 1.5),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Formulario de entrada
            NumberInputForm(
              controller: _controller,
              onAnalyze: _analyzeNumber,
              errorText: _abundantController.errorMessage,
              isLoading: _abundantController.isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
