import 'package:flutter/material.dart';
import 'package:paspuel_olivier_test/widgets/atoms/result_detail_row.dart';
import '../models/abundant_number_model.dart';
import '../widgets/molecules/result_card.dart';
import '../widgets/atoms/custom_button.dart';

class ResultScreen extends StatelessWidget {
  final AbundantNumberModel result;

  const ResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
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
              title: result.isAbundant ? '¡Es Abundante!' : 'No es Abundante',
              content: result.getResultMessage(),
              isAbundant: result.isAbundant,
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
                      value: result.number.toString(),
                    ),
                    DetailRow(
                      label: 'Cantidad de divisores:',
                      value: result.properDivisors.length.toString(),
                    ),
                    DetailRow(
                      label: 'Divisores propios:',
                      value: result.getDivisorsString(),
                    ),
                    DetailRow(
                      label: 'Suma de divisores:',
                      value: result.sumOfDivisors.toString(),
                    ),
                    DetailRow(
                      label: 'Diferencia:',
                      value: '${result.sumOfDivisors - result.number}',
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
