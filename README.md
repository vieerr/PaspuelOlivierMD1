# Verificador de Números Abundantes

Aplicación Flutter que verifica si un número entero positivo es abundante.

## ¿Qué es un Número Abundante?

Un número abundante es todo número positivo cuya suma de divisores propios es mayor que el número mismo.

**Ejemplo:** El número 12 es abundante porque:
- Divisores propios: 1, 2, 3, 4, 6
- Suma: 1 + 2 + 3 + 4 + 6 = 16
- Como 16 > 12, entonces 12 es abundante

## Arquitectura

Esta aplicación está desarrollada utilizando:

### 📐 Patrón MVC (Model-View-Controller)
- **Model**: Lógica de negocio para calcular números abundantes
- **View**: Dos pantallas (ingreso y resultados)
- **Controller**: Gestión de estado con Provider

### 🧬 Atomic Design
- **Átomos**: Componentes básicos (`CustomButton`, `CustomTextField`)
- **Moléculas**: Componentes compuestos (`NumberInputForm`, `ResultCard`)

### 🛣️ Sistema de Rutas
- `/` - Pantalla de ingreso de datos
- `/result` - Pantalla de resultados

## Estructura del Proyecto

```
lib/
├── main.dart                          # Punto de entrada
├── models/
│   └── abundant_number_model.dart     # Modelo de datos
├── controllers/
│   └── abundant_number_controller.dart # Controlador con Provider
├── views/
│   ├── input_screen.dart              # Pantalla de ingreso
│   └── result_screen.dart             # Pantalla de resultados
└── widgets/
    ├── atoms/
    │   ├── custom_button.dart         # Botón reutilizable
    │   └── custom_text_field.dart     # Campo de texto reutilizable
    └── molecules/
        ├── number_input_form.dart     # Formulario de entrada
        └── result_card.dart           # Tarjeta de resultado
```

## Características

✅ Validación completa de entrada de datos  
✅ Interfaz intuitiva y moderna  
✅ Navegación entre pantallas con rutas  
✅ Cálculo eficiente de divisores  
✅ Visualización detallada de resultados  
✅ Arquitectura escalable y mantenible  

## Instalación

1. Clonar el repositorio
2. Ejecutar:
```bash
flutter pub get
```

3. Ejecutar la aplicación:
```bash
flutter run
```

## Uso

1. Ingresar un número entero positivo en la pantalla principal
2. Presionar "Verificar si es Abundante"
3. Ver los resultados detallados en la siguiente pantalla

## Validaciones

La aplicación incluye las siguientes validaciones:
- ✓ Campo no vacío
- ✓ Número entero válido
- ✓ Número positivo (mayor a 0)

## Documentación

Ver [DOCUMENTACION.md](DOCUMENTACION.md) para:
- Pseudocódigo detallado
- Diagrama de flujo
- Explicación del algoritmo
- Ejemplos de números abundantes

## Tecnologías

- Flutter 3.9.0+
- Dart
- Provider (gestión de estado)

## Autor

Paspuel Olivier

# PaspuelOlivierMD1
