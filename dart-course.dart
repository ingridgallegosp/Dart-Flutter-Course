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

  // Incremento y decremento de variables
  // +, -, -expr, *, /, ~/ y %
  int valor1 = 7;
  int valor2 = 3;

  int resultado = valor1 + valor2;
  print("$valor1 + $valor2 = $resultado");

  resultado = valor1 - valor2;
  print("$valor1 - $valor2 = $resultado");

  // Operaciones Relacionales
  // ==, =!, =>, >, < y <=
  String valor4 = "Hola";
  String valor5 = "Adiós";

  var resultado2 = valor4 == valor5;
  print("$valor4 == $valor5 = $resultado2");


  // Operaciones Lógicas
  // ||, &&, ! y ?
  bool llueve = true;
  bool haceFrio = false;

  bool llevoAbrigo = llueve || haceFrio;
  print("$llueve || $haceFrio == $llevoAbrigo");

  llevoAbrigo = llueve && haceFrio;
  print("$llueve && $haceFrio == $llevoAbrigo");

  // Condicionales
  int mascotas = 5;

  if(mascotas == 0){
    print("No tienes mascotas");
  } else {
    if (mascotas == 1) {
      print("Solo tienes una mascota");
    } else {
      print ("Tienes $mascotas mascotas");
    }
  }

  // Collecion - grupo de valores dentro de una misma var

  // List - secuencia ordenada de valores de un tipo especifico y tamaño variable
  //Propiedades: first, isEmpty, inNotEmpty, lenght, last, reversed
  //funciones: add, insert, removeAt, clear

  List<String> friends = [];
  amigos.insert(1, "Damian");

  // Set - similar a List pero NO puede tener variables duplicadas
  //Propiedades: first, isEmpty, inNotEmpty, lenght, last, reversed
  //funciones: add, remove, clear

  // Set de paises
  Set<String> paises = {};

  paises = {"Argentina", "Brasil", "Colombia"};
  print(paises);
  paises.add("Argentina");
  print(paises);

  for(int i = 0; i < paises.length; i++) {
    print(paises.elementAt(i));
  }

  // Map
  //Propiedades: keys, values, isEmpty, isNotEmpty, lenght
  //funciones: addAll, remove, clear
  // tipo String para las llaves y dynamic para los datos(que pueden ser String o numero)
  Map <String, dynamic>persona={
    "nombre": "Ana",
    "edad": 12,
    "pais": "Colombia",
    "altura": 1.54
  };
  print(persona.keys);
  print(persona.values);

  print(persona["nombre"]);

  if(persona["pais"] == null) {
    print("La persona no tiene pais");
  }
  else {
    print(persona["pais"]);
  }

  // Coleccion de colecciones

  Map restaurante = {
    "nombre": "Pollos del monte",
    "estrellas": [5, 4, 3, 4, 2]
  };

  print(restaurante);

  if(restaurante['estrellas'] == null) {
    print("El restaurante no tiene estrellas");
  } else {
    List<int> estrellas = restaurante["estrellas"];
    int suma = 0;
    for(int i = 0; i < estrellas.length; i++) {
      suma += estrellas[i];
    }
    double promedio = suma / estrellas.length;
    restaurante.addAll({"promedio": promedio});
  }
  print(restaurante);




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


