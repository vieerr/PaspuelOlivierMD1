# Algoritmo de Números Abundantes

## Definición
Un número abundante es todo número positivo que cumple que la suma de sus divisores propios es mayor que el propio número.

**Ejemplo:** 12 es abundante ya que sus divisores son 1, 2, 3, 4 y 6, y se cumple que:
```
1 + 2 + 3 + 4 + 6 = 16 > 12
```

---

## Pseudocódigo

```
ALGORITMO VerificarNumeroAbundante

INICIO
    // Declaración de variables
    ENTERO numero
    LISTA divisores
    ENTERO suma
    BOOLEANO esAbundante
    
    // Entrada de datos con validación
    ESCRIBIR "Ingrese un número entero positivo:"
    LEER numero
    
    // Validación 1: Verificar que no esté vacío
    SI numero ES NULO O numero ES VACIO ENTONCES
        ESCRIBIR "Error: Debe ingresar un número"
        RETORNAR
    FIN SI
    
    // Validación 2: Verificar que sea un número entero
    SI numero NO ES ENTERO ENTONCES
        ESCRIBIR "Error: Debe ingresar un número entero válido"
        RETORNAR
    FIN SI
    
    // Validación 3: Verificar que sea positivo
    SI numero <= 0 ENTONCES
        ESCRIBIR "Error: El número debe ser positivo (mayor a 0)"
        RETORNAR
    FIN SI
    
    // Inicializar variables
    divisores = LISTA_VACIA
    suma = 0
    
    // Encontrar divisores propios
    PARA i = 1 HASTA numero - 1 HACER
        SI numero % i == 0 ENTONCES
            AGREGAR i A divisores
            suma = suma + i
        FIN SI
    FIN PARA
    
    // Verificar si es abundante
    SI suma > numero ENTONCES
        esAbundante = VERDADERO
    SINO
        esAbundante = FALSO
    FIN SI
    
    // Mostrar resultados
    SI esAbundante ENTONCES
        ESCRIBIR "El número", numero, "ES ABUNDANTE"
        ESCRIBIR "Sus divisores propios son:", divisores
        ESCRIBIR "La suma de sus divisores es:", suma
        ESCRIBIR suma, ">", numero
    SINO
        ESCRIBIR "El número", numero, "NO ES ABUNDANTE"
        ESCRIBIR "Sus divisores propios son:", divisores
        ESCRIBIR "La suma de sus divisores es:", suma
        ESCRIBIR suma, "≤", numero
    FIN SI
    
FIN
```

---

## Diagrama de Flujo (DF)

```
                    [INICIO]
                        |
                        v
        ┌───────────────────────────────┐
        │  Solicitar número entero      │
        │  positivo al usuario          │
        └───────────────┬───────────────┘
                        |
                        v
        ┌───────────────────────────────┐
        │  LEER numero                  │
        └───────────────┬───────────────┘
                        |
                        v
        ┌───────────────────────────────┐
        │  ¿Input está vacío?           │<───────┐
        └───────┬───────────────┬───────┘        │
                |               |                 │
              SI|               |NO               │
                v               v                 │
        ┌───────────┐   ┌───────────────────┐   │
        │  Mostrar  │   │ ¿Es un número     │   │
        │  error:   │   │ entero válido?    │   │
        │  "Debe    │   └────┬──────────┬───┘   │
        │  ingresar │        |          |        │
        │  número"  │      NO|          |SI      │
        └─────┬─────┘        v          v        │
              |      ┌───────────┐ ┌────────────┐│
              |      │ Mostrar   │ │ ¿numero >  ││
              |      │ error:    │ │    0?      ││
              |      │ "Número   │ └──┬─────┬───┘│
              |      │ inválido" │    |     |     │
              |      └─────┬─────┘  NO|     |SI   │
              |            |           v     v     │
              └────────────┴───> [Mensaje  │     │
                                  Error]   │     │
                                     |      │     │
                                     └──────┘     │
                                        |         │
                                        v         v
                        ┌───────────────────────────────┐
                        │  Inicializar:                 │
                        │  divisores = []               │
                        │  suma = 0                     │
                        └───────────────┬───────────────┘
                                        |
                                        v
                        ┌───────────────────────────────┐
                        │  i = 1                        │
                        └───────────────┬───────────────┘
                                        |
                                        v
                        ┌───────────────────────────────┐
                        │  ¿i < numero?                 │
                        └───────┬───────────────┬───────┘
                                |               |
                              SI|               |NO
                                v               v
                ┌───────────────────────┐   ┌──────────────┐
                │  ¿numero % i == 0?    │   │  ¿suma >     │
                └────┬──────────┬───────┘   │   numero?    │
                     |          |            └──┬───────┬───┘
                   SI|          |NO             |       |
                     v          v             SI|       |NO
        ┌────────────────┐     |               v       v
        │ divisores.add(i)│     |      [Es Abundante] [No es
        │ suma = suma + i │     |                      Abundante]
        └────────┬─────────┘    |               |       |
                 |               |               v       v
                 └───────────────┘      ┌────────────────────┐
                         |              │ Mostrar resultado: │
                         v              │ - Número           │
                ┌────────────────┐      │ - Divisores        │
                │  i = i + 1     │      │ - Suma divisores   │
                └────────┬───────┘      │ - Comparación      │
                         |              └─────────┬──────────┘
                         └──────────────────┐     |
                                            |     v
                                            └─>[FIN]
```

---

## Arquitectura de la Aplicación

### Patrón MVC (Model-View-Controller)

#### **Model** (`abundant_number_model.dart`)
- Representa la lógica de negocio
- Calcula divisores propios
- Determina si un número es abundante
- Almacena resultados del análisis

#### **Controller** (`abundant_number_controller.dart`)
- Gestiona el estado de la aplicación usando Provider
- Valida la entrada del usuario
- Coordina entre Model y View
- Maneja errores

#### **View** 
- `input_screen.dart`: Pantalla de ingreso de datos
- `result_screen.dart`: Pantalla de visualización de resultados

### Rutas
- `/` → Pantalla de ingreso (InputScreen)
- `/result` → Pantalla de resultados (ResultScreen)

### Atomic Design

#### **Átomos** (Componentes básicos reutilizables)
- `custom_button.dart`: Botón personalizado
- `custom_text_field.dart`: Campo de texto personalizado

#### **Moléculas** (Combinación de átomos)
- `number_input_form.dart`: Formulario completo de entrada
- `result_card.dart`: Tarjeta de visualización de resultados

---

## Validaciones Implementadas

1. **Validación de entrada vacía**: Verifica que el usuario haya ingresado algo
2. **Validación de tipo**: Verifica que sea un número entero válido
3. **Validación de rango**: Verifica que el número sea positivo (mayor a 0)

---

## Ejemplos de Números

### Números Abundantes
- 12 → divisores: 1,2,3,4,6 → suma: 16 > 12 ✓
- 18 → divisores: 1,2,3,6,9 → suma: 21 > 18 ✓
- 20 → divisores: 1,2,4,5,10 → suma: 22 > 20 ✓
- 24 → divisores: 1,2,3,4,6,8,12 → suma: 36 > 24 ✓

### Números NO Abundantes
- 10 → divisores: 1,2,5 → suma: 8 < 10 ✗
- 8 → divisores: 1,2,4 → suma: 7 < 8 ✗
- 15 → divisores: 1,3,5 → suma: 9 < 15 ✗
