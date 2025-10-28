import 'package:flutter_test/flutter_test.dart';
import 'package:paspuel_olivier_test/models/abundant_number_model.dart';

void main() {
  group('Pruebas de Números Abundantes', () {
    test('12 debe ser abundante', () {
      final result = AbundantNumberModel.analyze(12);

      expect(result.isAbundant, true);
      expect(result.properDivisors, [1, 2, 3, 4, 6]);
      expect(result.sumOfDivisors, 16);
    });

    test('18 debe ser abundante', () {
      final result = AbundantNumberModel.analyze(18);

      expect(result.isAbundant, true);
      expect(result.properDivisors, [1, 2, 3, 6, 9]);
      expect(result.sumOfDivisors, 21);
    });

    test('20 debe ser abundante', () {
      final result = AbundantNumberModel.analyze(20);

      expect(result.isAbundant, true);
      expect(result.properDivisors, [1, 2, 4, 5, 10]);
      expect(result.sumOfDivisors, 22);
    });

    test('24 debe ser abundante', () {
      final result = AbundantNumberModel.analyze(24);

      expect(result.isAbundant, true);
      expect(result.sumOfDivisors, 36);
    });

    test('10 NO debe ser abundante', () {
      final result = AbundantNumberModel.analyze(10);

      expect(result.isAbundant, false);
      expect(result.properDivisors, [1, 2, 5]);
      expect(result.sumOfDivisors, 8);
    });

    test('8 NO debe ser abundante', () {
      final result = AbundantNumberModel.analyze(8);

      expect(result.isAbundant, false);
      expect(result.properDivisors, [1, 2, 4]);
      expect(result.sumOfDivisors, 7);
    });

    test('15 NO debe ser abundante', () {
      final result = AbundantNumberModel.analyze(15);

      expect(result.isAbundant, false);
      expect(result.properDivisors, [1, 3, 5]);
      expect(result.sumOfDivisors, 9);
    });

    test('1 NO debe ser abundante (caso especial)', () {
      final result = AbundantNumberModel.analyze(1);

      expect(result.isAbundant, false);
      expect(result.properDivisors, []);
      expect(result.sumOfDivisors, 0);
    });

    test('Debe lanzar error con número negativo', () {
      expect(() => AbundantNumberModel.analyze(-5), throwsArgumentError);
    });

    test('Debe lanzar error con número cero', () {
      expect(() => AbundantNumberModel.analyze(0), throwsArgumentError);
    });
  });

  group('Pruebas de Mensajes', () {
    test('Debe generar mensaje correcto para número abundante', () {
      final result = AbundantNumberModel.analyze(12);
      final message = result.getResultMessage();

      expect(message, contains('ES ABUNDANTE'));
      expect(message, contains('1, 2, 3, 4, 6'));
      expect(message, contains('16 > 12'));
    });

    test('Debe generar mensaje correcto para número no abundante', () {
      final result = AbundantNumberModel.analyze(10);
      final message = result.getResultMessage();

      expect(message, contains('NO ES ABUNDANTE'));
      expect(message, contains('1, 2, 5'));
      expect(message, contains('8 ≤ 10'));
    });
  });

  group('Pruebas de Divisores', () {
    test('Debe retornar divisores como string correctamente', () {
      final result = AbundantNumberModel.analyze(12);

      expect(result.getDivisorsString(), '1, 2, 3, 4, 6');
    });

    test('Número primo debe tener solo 1 como divisor', () {
      final result = AbundantNumberModel.analyze(7);

      expect(result.properDivisors, [1]);
      expect(result.sumOfDivisors, 1);
      expect(result.isAbundant, false);
    });
  });
}
