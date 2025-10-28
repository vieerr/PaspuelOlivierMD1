import '../models/abundant_number_model.dart';

class AbundantNumberController {
  AbundantNumberModel? _result;
  String? _errorMessage;
  bool _isLoading = false;

  AbundantNumberModel? get result => _result;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  void analyzeNumber(String input) {
    _isLoading = true;
    _errorMessage = null;
    _result = null;

    try {
      // validación: verificar que el input no esté vacío
      if (input.trim().isEmpty) {
        throw const FormatException('Debe ingresar un número');
      }

      // validación: convertir a entero
      final number = int.tryParse(input.trim());
      if (number == null) {
        throw const FormatException('Debe ingresar un número entero válido');
      }

      // validación: verificar que sea positivo
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
