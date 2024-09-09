// comando para correr programa en Terminal: dart run dart-course.dart
void main() {

  // Tipos de datos
  // bool - boleanos
  bool isSunny = true;

  // int - numeros enteros y double para numeros decimales
  int edad = 14;
  double phi= 3.1416;

  // String para cadenas de texto
  String name= "Olivia";

  // Colecciones - diferentes datos del mismo tipo en la misma variable
  List <String> amigos = ["Emiliana", "Tomas", "Goss", "Naru"];

  // Uso de var - programa infiere el valor
  var nombre= "Ana"; // Infiere el tipo String para la variable
  nombre= "Emilia";
  print(nombre);//Emilia valor reasignado
  //nombre = 18; // error: no puede ser asignado un numero a una variable tipo String

  //const y final - no se les puede reasignar un valor (como en el caso de var)
  const age = 13;

  //dynamic - infiere el tipo de dato y puede cambiar su tipo en cualquier momento

  // conversion de tipos
  // String a numero - numero como texto al que necesitamos aplicarle operaciones matematicas
  // numeros enteros int.parse(); // numeros decimales  double.parse();
  String texto = "18";
  int numero = int.parse(texto);
  print(numero);

  // numero a String - toString();
  int numero1 = 34;
  String texto1 = numero1.toString();
  print(texto1);





  // Ejercicio
  Set<Map<String, dynamic>> restaurantes = {
    {
      "nombre": "El novillo alegre",
      "tipo": "Argentina",
      "calificaciones": [4, 5, 2, 1, 2]
    },
    {
      "nombre": "Baires Grill",
      "tipo": "Argentina",
      "calificaciones": [3, 1, 3, 5, 5, 2, 3]
    },
    {
      "nombre": "Mario Brothers",
      "tipo": "Italiana",
      "calificaciones": [4, 3, 2, 1, 1]
    },
    {
      "nombre": "Molto bene",
      "tipo": "Italiana",
      "calificaciones": [4, 3, 1, 1, 5]
    }
  };

  // Mapa para acumular las calificaciones por tipo
  Map<String, List<int>> calificacionesPorTipo = {};

  // Iterar sobre el conjunto de mapas
  for (var restaurante in restaurantes) {
    String tipo = restaurante["tipo"];
    List<int> calificaciones = restaurante["calificaciones"];

    // Inicializar la lista de calificaciones para el tipo si no existe
    if (!calificacionesPorTipo.containsKey(tipo)) {
      calificacionesPorTipo[tipo] = [];
    }

    // Agregar calificaciones a la lista correspondiente
    calificacionesPorTipo[tipo]!.addAll(calificaciones);
  }

  // Mapa para almacenar el promedio de calificaciones por tipo
  Map<String, double> rating = {};

  // Calcular el promedio de calificaciones por tipo
  for (var entry in calificacionesPorTipo.entries) {
    String tipo = entry.key;
    List<int> calificaciones = entry.value;
    double promedio = calificaciones.reduce((a, b) => a + b) / calificaciones.length;
    rating[tipo] = promedio;
  }

  // Calcular el promedio general de todas las calificaciones
  List<int> todasCalificaciones = calificacionesPorTipo.values.expand((x) => x).toList();
  double promedioGeneral = todasCalificaciones.reduce((a, b) => a + b) / todasCalificaciones.length;

  // Añadir el promedio general al mapa
  rating["Todos"] = promedioGeneral;

  // Mostrar resultados
  print("Map rating = $rating");
}


