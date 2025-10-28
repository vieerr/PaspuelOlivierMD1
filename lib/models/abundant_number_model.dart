/// Modelo para representar un número y su análisis de abundancia
class AbundantNumberModel {
  final int number;
  final List<int> properDivisors;
  final int sumOfDivisors;
  final bool isAbundant;

  AbundantNumberModel({
    required this.number,
    required this.properDivisors,
    required this.sumOfDivisors,
    required this.isAbundant,
  });

  /// Calcula si un número es abundante
  ///
  /// Algoritmo:
  /// 1. Validar que el número sea positivo
  /// 2. Encontrar todos los divisores propios (menores que el número)
  /// 3. Sumar los divisores propios
  /// 4. Comparar la suma con el número original
  static AbundantNumberModel analyze(int number) {
    if (number <= 0) {
      throw ArgumentError('El número debe ser positivo');
    }

    // Encontrar divisores propios
    List<int> divisors = [];
    for (int i = 1; i < number; i++) {
      if (number % i == 0) {
        divisors.add(i);
      }
    }
    divisors.add(1);

    // Calcular suma de divisores
    int sum = divisors.reduce((a, b) => a + b);

    // Verificar si es abundante
    bool abundant = sum > number;

    return AbundantNumberModel(
      number: number,
      properDivisors: divisors,
      sumOfDivisors: sum,
      isAbundant: abundant,
    );
  }

  String getDivisorsString() {
    return properDivisors.join(', ');
  }

  String getResultMessage() {
    if (isAbundant) {
      return 'El número $number ES ABUNDANTE\n'
          'Sus divisores propios son: ${getDivisorsString()}\n'
          'La suma de sus divisores es: $sumOfDivisors\n'
          '$sumOfDivisors > $number';
    } else {
      return 'El número $number NO ES ABUNDANTE\n'
          'Sus divisores propios son: ${getDivisorsString()}\n'
          'La suma de sus divisores es: $sumOfDivisors\n'
          '$sumOfDivisors < $number';
    }
  }
}
