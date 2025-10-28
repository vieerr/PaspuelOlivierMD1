import '../models/abundant_number_model.dart';

/// Controlador para manejar la lógica de números abundantes
class AbundantNumberController {
  AbundantNumberModel? _result;
  String? _errorMessage;
  bool _isLoading = false;

  AbundantNumberModel? get result => _result;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  /// Analiza si un número es abundante
  void analyzeNumber(String input) {
    _isLoading = true;
    _errorMessage = null;
    _result = null;

    try {
      // Validación: verificar que el input no esté vacío
      if (input.trim().isEmpty) {
        throw const FormatException('Debe ingresar un número');
      }

      // Validación: convertir a entero
      final number = int.tryParse(input.trim());
      if (number == null) {
        throw const FormatException('Debe ingresar un número entero válido');
      }

      // Validación: verificar que sea positivo
      if (number <= 0) {
        throw const FormatException('El número debe ser positivo (mayor a 0)');
      }

      // Analizar el número
      _result = AbundantNumberModel.analyze(number);
    } on FormatException catch (e) {
      _errorMessage = e.message;
    } catch (e) {
      _errorMessage = 'Error: $e';
    } finally {
      _isLoading = false;
    }
  }

  /// Limpia el resultado y mensajes de error
  void clear() {
    _result = null;
    _errorMessage = null;
    _isLoading = false;
  }
}
