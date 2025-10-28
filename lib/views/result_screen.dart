import 'package:flutter/material.dart';
import 'package:paspuel_olivier_test/widgets/atoms/result_detail_row.dart';
import '../models/abundant_number_model.dart';
import '../widgets/molecules/result_card.dart';
import '../widgets/atoms/custom_button.dart';

class ResultScreen extends StatelessWidget {
  final AbundantNumberModel? result;

  const ResultScreen({super.key, this.result});

  @override
  Widget build(BuildContext context) {
    // Get result from arguments if not passed directly
    final screenResult =
        result ??
        ModalRoute.of(context)!.settings.arguments as AbundantNumberModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            // Tarjeta de resultado principal
            ResultCard(
              title: screenResult.isAbundant
                  ? '¡Es Abundante!'
                  : 'No es Abundante',
              content: screenResult.getResultMessage(),
              isAbundant: screenResult.isAbundant,
            ),
            const SizedBox(height: 20),
            // Detalles adicionales
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Detalles del Análisis',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(height: 20),
                    DetailRow(
                      label: 'Número analizado:',
                      value: screenResult.number.toString(),
                    ),
                    DetailRow(
                      label: 'Cantidad de divisores:',
                      value: screenResult.properDivisors.length.toString(),
                    ),
                    DetailRow(
                      label: 'Divisores propios:',
                      value: screenResult.getDivisorsString(),
                    ),
                    DetailRow(
                      label: 'Suma de divisores:',
                      value: screenResult.sumOfDivisors.toString(),
                    ),
                    DetailRow(
                      label: 'Diferencia:',
                      value:
                          '${screenResult.sumOfDivisors - screenResult.number}',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Botón para volver
            CustomButton(
              text: 'Verificar Otro Número',
              onPressed: () => Navigator.pop(context),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
