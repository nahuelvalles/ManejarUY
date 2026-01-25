class PreguntaExamen {
  final String pregunta;
  final List<String> opciones;
  final int respuestaCorrecta;

  final String? imagenAsset;

  const PreguntaExamen({
    required this.pregunta,
    required this.opciones,
    required this.respuestaCorrecta,
    this.imagenAsset,
  });
}

const List<PreguntaExamen> preguntasExamen = [
  PreguntaExamen(
    pregunta:
        '¿En condiciones de tránsito comunes, un vehículo puede ser conducido marcha atrás solo?',
    opciones: [
      '50 metros.',
      '35 metros.',
      'En caso de necesidad para estacionar.',
      'Ninguna de las anteriores es correcta.',
    ],
    respuestaCorrecta: 2,
  ),
  PreguntaExamen(
    pregunta: '¿Ante la proximidad de vehículos de emergencia?',
    opciones: [
      'Debe detener su vehículo.',
      'Debe avisar con las luces al vehículo que le antecede.',
      'Debe aumentar la velocidad.',
      'Debe despejar rápidamente la calle, deteniendo su vehículo donde no moleste.',
    ],
    respuestaCorrecta: 3,
  ),
  PreguntaExamen(
    pregunta:
        '¿Los inspectores de la Intendencia y/o la Policía de Tránsito están facultados para retirar la documentación del conductor y/o del vehículo?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿Antes de empezar a pasar al vehículo que va adelante, usted tiene que?',
    opciones: [
      'Mirar el espejo retrovisor y prender el señalero',
      'Tocar la bocina',
      'Hacer cambio de luces',
      'Ninguna de las anteriores es correcta',
      'Todas las anteriores son correctas',
    ],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿Si usted está cruzando una calle, la luz amarilla de un semáforo indica?',
    opciones: [
      'Atención, obligación de despejar el cruce',
      'Derecho de paso',
      'Detenerse',
      'Despacio, escuela',
    ],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta: '¿En un repecho se puede adelantar a otro vehículo?',
    opciones: [
      'Sí',
      'No',
      'Sí, si el vehículo cede el paso',
      'Sí, siempre que haga cambio de luces',
    ],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿Solo se puede adelantar a otro vehículo por la derecha si este está girando o se dispone a girar a la izquierda?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿Los funcionarios del cuerpo de inspectores de tránsito están facultados para modificar las preferencias establecidas cuando las circunstancias lo requieran?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿Cuando los neumáticos tienen poca presión de aire, se ahorra combustible?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿El uso del cinturón de seguridad es tan importante en la ciudad como en la carretera?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿Es necesario duplicar la distancia entre su vehículo y el que lo antecede en?',
    opciones: [
      'Amanecer',
      'Atardecer',
      'Pavimento resbaloso',
      'Todas las anteriores son correctas',
    ],
    respuestaCorrecta: 3,
  ),
  PreguntaExamen(
    pregunta:
        '¿Para señalizar con el brazo un giro a la derecha, el brazo debe ir?',
    opciones: [
      'Extendido horizontalmente',
      'En ángulo hacia arriba',
      'Hacia abajo',
      'Ninguna de las anteriores es correcta',
    ],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿En los días de lluvia se tiene que disminuir la velocidad aunque las condiciones del vehículo sean óptimas?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta: '¿Un disgusto (alteraciones, discusiones, depresión) afecta?',
    opciones: [
      'La visión lateral',
      'La audición',
      'El tiempo de reacción',
      'Ninguna de las anteriores es correcta',
    ],
    respuestaCorrecta: 2,
  ),
  PreguntaExamen(
    pregunta:
        '¿En una bajada pronunciada, para mayor seguridad, poner el vehículo en punto muerto?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿La calle es el tramo de la vía pública destinado preferentemente a?',
    opciones: [
      'La circulación de cualquier tipo de vehículos automotores',
      'Solamente la circulación de peatones',
      'Solamente a la circulación de vehículos livianos',
    ],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿Con el coche cargado las distancias para detenerse serán menores?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿Cuando se maneja por períodos de más de cuatro horas, se tiene que descansar por lo menos?',
    opciones: ['10 minutos', '20 minutos', '50 minutos', '60 minutos'],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿La distancia prudencial entre dos vehículos que circulan en la misma dirección es aquella que permite al conductor ver las ruedas traseras del vehículo que va delante?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta: '¿El tiempo de reacción del conductor se ve afectado por?',
    opciones: [
      'El estado de la ruta',
      'La velocidad a la cual conduce',
      'El cansancio',
      'Los defectos mecánicos del vehículo',
    ],
    respuestaCorrecta: 2,
  ),
  PreguntaExamen(
    pregunta:
        '¿Los objetos duros y con puntas depositados en los estantes delanteros y traseros se pueden convertir en proyectiles peligrosos en una frenada brusca?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿Aun tomando descansos, no se tiene que conducir por más de 9 horas continuas?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿A partir de los 35 y 40 años de edad se va perdiendo la rapidez para reaccionar?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿La velocidad adecuada de circulación de un vehículo en caso de aglomeración de personas es?',
    opciones: [
      '15 km/h',
      'A paso de peatón',
      '25 km/h',
      'Ninguna de las anteriores es correcta',
    ],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿Qué tiene que hacer un conductor al iniciar un giro a la izquierda desde una calle de doble mano?',
    opciones: [
      'Aproximarse a la línea central o eje de la calle, señalizando con suficiente anticipación.',
      'Ubicarse sobre el lado izquierdo del eje de la calzada',
      'Acercarse lo más a la derecha posible',
      'Ninguna de las anteriores es correcta',
    ],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿Los peatones que circulan por la vereda tienen preferencia de paso ante un vehículo que la atraviesa para entrar o salir de un garaje?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿Los vehículos que tengan sus neumáticos con bandas de rodamiento gastadas?',
    opciones: [
      'Podrán circular solo de noche',
      'Podrán circular solo de día',
      'No podrán circular',
    ],
    respuestaCorrecta: 2,
  ),
  PreguntaExamen(
    pregunta: '¿Si es encandilado por otro vehículo, usted tiene que?',
    opciones: [
      'Hacer cambio de luces',
      'Colocar sus luces cortas',
      'Tirarse a la banquina si el choque es inevitable',
      'Solo a y c son correctas',
    ],
    respuestaCorrecta: 3,
  ),
  PreguntaExamen(
    pregunta: '¿Para quién es obligatorio el uso del cinturón de seguridad?',
    opciones: [
      'Solo para los ocupantes de los asientos traseros de los vehículos automotores',
      'Solo para los ocupantes de los asientos delanteros de los vehículos automotores',
      'Ninguna de las anteriores',
      'Para todos los ocupantes del vehículo.',
    ],
    respuestaCorrecta: 3,
  ),
  PreguntaExamen(
    pregunta: '¿Derecho preferente de paso es?',
    opciones: [
      'La facultad de un peatón o conductor de un vehículo para proseguir la marcha',
      'La facultad del conductor de un vehículo para no detener la marcha al ingresar a una calle de preferencia',
      'La facultad del conductor de un vehículo para cambiar de dirección careciendo de preferencia',
      'Ninguna de las anteriores es correcta',
    ],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿En un cruce no regulado, qué vehículo tiene que ceder el derecho preferente de paso?',
    opciones: [
      'El que llega primero al cruce',
      'El que aparece por la derecha',
      'El que aparece por la izquierda',
      'El que llega último al cruce',
    ],
    respuestaCorrecta: 2,
  ),
  PreguntaExamen(
    pregunta:
        '¿El conductor de un vehículo puede sobrepasar a otro por la derecha cuando?',
    opciones: [
      'El vehículo de adelante va a doblar a la derecha',
      'El vehículo de adelante va a doblar a la izquierda',
      'Nunca',
      'El vehículo de adelante da paso a otros',
    ],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿En caso de quedarse sin frenos, cuando el pedal ofrece algo de resistencia, lo primero que debe intentar es bombearlo varias veces?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿Las bebidas alcohólicas tomadas junto con algunos antialérgicos disminuyen la capacidad de conducir?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta: '¿Con mucha carga en la valija del automóvil se afectará?',
    opciones: [
      'El consumo de combustible',
      'El mecanismo de la dirección',
      'La altura de los faros delanteros',
      'Solo b y c son correctas',
    ],
    respuestaCorrecta: 3,
  ),
  PreguntaExamen(
    pregunta:
        '¿Usted puede circular sin espejo retrovisor cuando circula a baja velocidad?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta: '¿Cuando llueve?',
    opciones: [
      'Debe circular en el centro de la calzada',
      'Debe circular a la derecha del centro de la calzada',
      'Ninguna de las anteriores es correcta',
    ],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿Si observa que se encienden las luces blancas del vehículo, ello significa?',
    opciones: [
      'Que da marcha atrás',
      'Que se dispone a pasar a otro',
      'Que va a frenar',
      'Que va a girar a la derecha',
    ],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿Hasta los 70 años de edad no se altera la rapidez para reaccionar?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿El ruido que produce el silenciador en mal estado no aumenta la fatiga del conductor?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿La Intendencia se encuentra facultada para retirar de la vía pública los vehículos mal estacionados o estacionados en lugar prohibido?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta: '¿Cruce peatonal es?',
    opciones: [
      'Parte de la calle habilitada para ser atravesada por los peatones',
      'La senda de seguridad formada por la prolongación (imaginaria o demarcada) del eje de la calzada',
      'Parte de la vereda donde se debe esperar hasta poder cruzar',
      'Ninguna de las anteriores es correcta',
    ],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿Por norma general usted tiene que circular por la izquierda de la calzada?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿Las rutas nacionales son la única vía de circulación de preferencia aun cuando las transversales no tengan la señal de PARE?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿Ante destellantes amarillos instalados en las cercanías de las escuelas, a qué velocidad tiene que circular?',
    opciones: ['A 15 km/h', 'A paso de peatón', 'A 25 km/h', 'A 30 km/h'],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿Nunca tiene que adelantarse a un vehículo que está doblando a la derecha?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta: '¿Qué tiene que hacer usted si es adelantado por otro vehículo?',
    opciones: [
      'Mantener la velocidad o disminuirla',
      'Encender las luces',
      'Frenar bruscamente',
      'Aumentar la velocidad',
    ],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta: '¿Adelantamiento correcto es una maniobra efectuada?',
    opciones: [
      'Por el costado izquierdo del vehículo que se va a adelantar',
      'Por el costado derecho del vehículo que se va a adelantar',
      'Por la banquina si hubiere',
      'Nunca se debe adelantar',
    ],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿Para conducir adecuadamente es importante observar la luz del semáforo que está de frente a usted?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿Qué tramo de la calle se tiene que utilizar exclusivamente para manejar un vehículo?',
    opciones: [
      'La banquina',
      'La calzada',
      'La acera',
      'Ninguna de las anteriores es correcta',
    ],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿Tienen preferencia de paso cuando hagan las señales correspondientes?',
    opciones: [
      'Las ambulancias',
      'Patrulleros y bomberos',
      'Los vehículos del departamento de tránsito',
      'Todas las anteriores son correctas',
    ],
    respuestaCorrecta: 3,
  ),
  PreguntaExamen(
    pregunta:
        '¿Al encontrarse la calle mojada por la lluvia, qué tiene que hacer usted?',
    opciones: [
      'Disminuir la velocidad',
      'Aumentar la velocidad',
      'Estar atento a frenar',
      'Solo a y c son correctas',
    ],
    respuestaCorrecta: 3,
  ),
  PreguntaExamen(
    pregunta:
        '¿La velocidad máxima a la que se tiene que conducir en la zona urbana, salvo expresas excepciones, es?',
    opciones: [
      '20 km/h',
      '45 km/h',
      '60 km/h',
      'Ninguna de las anteriores es correcta',
    ],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿Para señalar con el brazo la disminución de la velocidad o detención del vehículo, se tiene que colocar?',
    opciones: [
      'Extendido horizontalmente',
      'En ángulo recto hacia abajo',
      'Extendido hacia abajo',
      'Ninguna de las anteriores es correcta',
    ],
    respuestaCorrecta: 2,
  ),
  PreguntaExamen(
    pregunta:
        '¿Las luces largas deberán sustituirse por las de alcance medio cuando haya riesgo de encandilarse?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿Cuando un automóvil al salir del garaje cruza la vereda, obtiene la preferencia sobre los peatones que circulan en ella?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta: '¿La visión se reduce?',
    opciones: [
      'En horas de la noche',
      'Con el encandilamiento',
      'Cuando mayor velocidad se desarrolla',
      'Todas las anteriores son correctas',
    ],
    respuestaCorrecta: 3,
  ),
  PreguntaExamen(
    pregunta:
        '¿El color de las luces que proyectan hacia delante los vehículos puede ser?',
    opciones: [
      'Rojas o blancas',
      'Verdes o blancas',
      'Amarillas o blancas',
      'Ninguna de las anteriores es correcta',
    ],
    respuestaCorrecta: 2,
  ),
  PreguntaExamen(
    pregunta: '¿En un repecho se puede adelantar a otro vehículo?',
    opciones: [
      'Sí',
      'No',
      'Sí, si el vehículo cede el paso',
      'Sí, siempre y cuando no sea de noche',
    ],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿Durante la carga de combustible se puede dejar el motor encendido?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿Ante la proximidad de vehículos de emergencia, despejar rápidamente la calzada permaneciendo donde no moleste?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿En las calles de doble sentido, los vehículos que circulen en sentido opuesto al cruzarse?',
    opciones: [
      'Deberán encender las luces bajas',
      'Deberán circular por el eje de la calzada demarcada o imaginaria',
      'No pasarán el eje de la calzada demarcada o imaginaria',
      'Hacer un destello de luces',
    ],
    respuestaCorrecta: 2,
  ),
  PreguntaExamen(
    pregunta:
        '¿Por norma general usted tiene que circular por la mitad derecha de la calzada?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿Un conductor al enfrentar una señal de "Ceda el Paso" tiene que?',
    opciones: [
      'Detenerse siempre',
      'Seguir la marcha a la misma velocidad',
      'Reducir la velocidad y detenerse siempre si es necesario',
      'Acelerar',
    ],
    respuestaCorrecta: 2,
  ),
  PreguntaExamen(
    pregunta:
        '¿Nunca tiene que adelantarse a un vehículo que está dando paso a peatones?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿La vereda es el tramo de vía pública preferentemente destinado a?',
    opciones: [
      'El uso de peatones',
      'El uso de los vehículos automotores',
      'Otros usos',
      'Ninguna de las anteriores es correcta',
    ],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿En el cruce cuyos semáforos se encuentran apagados o descompuestos, la preferencia será de?',
    opciones: [
      'Los que circulan por una avenida',
      'Los vehículos que aparecen por la derecha',
      'Los que llegan primero al cruce',
      'Los vehículos que aparecen por la izquierda',
    ],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿Siempre se tiene que prestar atención a la luz del semáforo que se encuentra frente a uno?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta: '¿Al conducir en carretera su fatiga aumentará si?',
    opciones: [
      'Escucha música',
      'Si fuma con las ventanas cerradas',
      'Si el paisaje es monótono',
      'Solo b y c son correctas',
    ],
    respuestaCorrecta: 3,
  ),
  PreguntaExamen(
    pregunta:
        '¿Cuando se trata de evitar un choque de frente en carretera, usted tiene que?',
    opciones: [
      'Frenar',
      'Rebajar los cambios',
      'Desviarse hacia la banquina',
      'Encender las luces largas',
    ],
    respuestaCorrecta: 2,
  ),
  PreguntaExamen(
    pregunta:
        '¿Tiene que prestar atención de no encandilar a los que vienen en sentido contrario usando las luces cortas?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿Usted puede circular sin espejo retrovisor cuando el vehículo sea de transporte de carga?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿En pavimento mojado nunca se tiene que circular con el vehículo en punto muerto?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿Qué tiene que hacer un conductor al indicar el giro a la derecha?',
    opciones: [
      'Acercarse a la izquierda lo más posible y prender el señalero',
      'Mantenerse en el eje de la calzada y prender el señalero',
      'Acercarse lo más a la derecha posible y prender el señalero',
      'Ninguna de las anteriores es correcta',
    ],
    respuestaCorrecta: 2,
  ),
  PreguntaExamen(
    pregunta:
        '¿La velocidad adecuada de circulación frente a escuelas en horarios de entrada o salida?',
    opciones: ['30 km/h', '15 km/h', 'A paso de peatón', '25 km/h'],
    respuestaCorrecta: 2,
  ),
  PreguntaExamen(
    pregunta: '¿Si usted tiene que estacionar en bajada?',
    opciones: [
      'Deja derecho el auto y aplica freno de mano',
      'Deja derecho el auto y le pone cambio',
      'Aplica el freno de mano y gira las ruedas hacia el cordón de la vereda.',
      'Aplica el freno de mano y gira las ruedas en sentido contrario al cordón de la vereda',
    ],
    respuestaCorrecta: 2,
  ),
  PreguntaExamen(
    pregunta: '¿Si mientras va circulando revienta un neumático, qué hace?',
    opciones: [
      'Frena bruscamente',
      'Quita el pie del acelerador y gira por el lado que reventó el neumático',
      'Frena suavemente, arrimando el auto derecho hasta detenerse',
      'Apaga el motor',
    ],
    respuestaCorrecta: 2,
  ),
  PreguntaExamen(
    pregunta: '¿Un vehículo que circula a 65 km/h necesita para detenerse?',
    opciones: ['10 metros', '25 metros', 'Media cuadra', '2 cuadras'],
    respuestaCorrecta: 2,
  ),
  PreguntaExamen(
    pregunta: '¿En carretera se tiene que aminorar la marcha en?',
    opciones: [
      'Zonas urbanas y caseríos',
      'Curvas y cruces',
      'Pasos a nivel y puentes',
      'Todas las anteriores son correctas',
    ],
    respuestaCorrecta: 3,
  ),
  PreguntaExamen(
    pregunta:
        '¿Cuando un vehículo sufre un desperfecto en la carretera, se tiene que colocar la baliza o triángulo por lo menos a 50 metros?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta: '¿Está terminantemente prohibido estacionar?',
    opciones: [
      'En la mitad de la cuadra',
      'En la acera derecha de las calles de un solo sentido',
      'En la puerta de una escuela',
      'A menos de 10 metros de una señal de "Pare" o "Ceda el paso"',
    ],
    respuestaCorrecta: 3,
  ),
  PreguntaExamen(
    pregunta:
        '¿En caso de incendio o inmersión, el cinturón de seguridad le puede salvar la vida?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿Ante irregularidades en la documentación o estado del vehículo, este puede ser detenido por un funcionario de tránsito, al igual que la documentación (del conductor y del vehículo), previa entrega del recibo pertinente?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta: '¿Al reventarse un neumático se tiene que?',
    opciones: [
      'Tomar fuertemente el volante y frenar tan suavemente como le sea posible',
      'Frenar bruscamente',
      'Quitar el pie del acelerador y girar para el lado que reventó el neumático',
      'Frenar suavemente, arrimando el auto al borde derecho hasta detenerse',
      'Apagar el motor',
    ],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿El peatón tiene preferencia de cruce en cualquier lugar de la calzada?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta: '¿Cruce peatonal es?',
    opciones: [
      'Parte de la calzada habilitada para ser atravesada por peatones',
      'La senda de seguridad formada por la prolongación (imaginaria o demarcada) del eje de la calzada',
      'Parte de la vereda donde se debe esperar para poder cruzar',
      'Los llamados "lomos de burro"',
      'Las señalizadas con franjas blancas paralelas.',
    ],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta: '¿Ante la proximidad de un vehículo de emergencia usted?',
    opciones: [
      'Aumenta la velocidad',
      'Despeja rápidamente la calzada, permaneciendo detenido donde no moleste',
      'Hace cambio de luces y toca la bocina para avisar al resto de los conductores',
      'Ninguna es correcta',
    ],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿Qué luces debe llevar encendidas un vehículo durante la noche en las áreas urbanas?',
    opciones: [
      'Luces altas o bajas de acuerdo a la situación del tránsito',
      'Cualquiera indistintamente',
      'Luces de posición',
      'Solo a y c son correctas',
    ],
    respuestaCorrecta: 3,
  ),
  PreguntaExamen(
    pregunta:
        '¿Cuando va detrás de un vehículo durante la noche deben usarse las luces cortas?',
    opciones: [
      'En ningún momento',
      'Cuando la distancia haga innecesarias las luces largas',
      'Cuando la visibilidad sea muy buena',
      'Ninguna de las anteriores es correcta',
    ],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿Cuál es la edad mínima para poder viajar en el asiento delantero del vehículo?',
    opciones: ['1 año', '6 años', '12 años', 'Ninguna es correcta.'],
    respuestaCorrecta: 2,
  ),
  PreguntaExamen(
    pregunta: '¿La preferencia de paso del vehículo de la derecha no regirá?',
    opciones: [
      'En los cruces regulados por semáforos o agentes de tránsito',
      'En las vías de doble tránsito',
      'En los cruces no regulados',
    ],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta: '¿Un conductor al enfrentar una señal de PARE tiene que?',
    opciones: [
      'Seguir su marcha a la misma velocidad',
      'Reducir un poco la velocidad y continuar',
      'Detener totalmente la marcha',
      'Reducir la velocidad y detenerse si fuera necesario.',
    ],
    respuestaCorrecta: 2,
  ),
  PreguntaExamen(
    pregunta: '¿Un cruce regulado?',
    opciones: [
      'Es aquel en que existen semáforos funcionando regularmente, un inspector o agente de tránsito',
      'En el que existe cualquier tipo de señal vertical u horizontal',
      'Ninguna es correcta',
    ],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿Se puede adelantar a un vehículo que está doblando a la derecha?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta: '¿Cuando usted dobla a la derecha?',
    opciones: [
      'Debe acercar su vehículo a la izquierda, encender el señalero y doblar con precaución',
      'Debe encender el señalero derecho',
      'Debe mirar por el espejo retrovisor, encender el señalero y acercarse al cordón derecho.',
    ],
    respuestaCorrecta: 2,
  ),
  PreguntaExamen(
    pregunta:
        '¿Por norma general usted tiene que circular por el eje de calzada, salvo que transiten otros vehículos?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿Un vehículo motorizado que está correctamente estacionado es aquel que se encuentra con?',
    opciones: [
      'El motor apagado',
      'El freno de mano puesto',
      'Las ruedas en ángulo con el cordón',
      'Las respuestas a y b son correctas',
    ],
    respuestaCorrecta: 3,
  ),

  PreguntaExamen(
    pregunta:
        '¿Cuál es la distancia mínima de seguridad que usted tiene que mantener con respecto al vehículo que circula delante?',
    opciones: [
      'El doble en metros de la velocidad en km/h',
      'Un cuarto en metros de la velocidad en km/h',
      'El doble en metros de la velocidad en km/h',
      'La mitad en metros de la velocidad en km/h',
      'Ninguna de las anteriores es correcta',
    ],
    respuestaCorrecta: 3,
  ),
  PreguntaExamen(
    pregunta:
        '¿Para enfrentar futuras emergencias, un conductor prudente tiene que tener en su vehículo?',
    opciones: [
      'Un extintor',
      'Dos balizas o triángulos',
      'Un manual de funcionamiento del motor',
      'Juegos para entretener niños si viajan con ellos',
      'Las respuestas a, b y d son correctas',
    ],
    respuestaCorrecta: 4,
  ),
  PreguntaExamen(
    pregunta:
        '¿Los vehículos que tienen sus neumáticos con bandas de rodamiento gastadas (menos de 2 mm de profundidad)?',
    opciones: [
      'Deben circular solo de noche',
      'Deben circular solo de día',
      'No deben circular',
      'Pueden circular a toda hora',
      'Deben circular a bajas velocidades',
    ],
    respuestaCorrecta: 2,
  ),
  PreguntaExamen(
    pregunta: '¿Al conducir en carretera su fatiga aumenta si?',
    opciones: [
      'Se escucha música',
      'Se viaja con la ventanilla cerrada',
      'El paisaje es monótono',
      'Solo b y c son correctas',
    ],
    respuestaCorrecta: 3,
  ),
  PreguntaExamen(
    pregunta: '¿Con el coche cargado?',
    opciones: [
      'La aceleración será más fácil',
      'Las distancias para detenerse serán mayores',
      'Necesitará menos distancia para pasar y parar',
      'Todas las anteriores son incorrectas',
    ],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta: '¿Si su vehículo comienza a patinar al momento de frenar?',
    opciones: [
      'Procure detenerlo bombeando intermitentemente el freno',
      'Frene enérgicamente',
      'Acelere',
      'Todas las anteriores son incorrectas',
    ],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿Al protagonizar un choque simple (sin heridos, solo daños materiales) se tiene que despejar inmediatamente la calle?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿Circulando delante de un vehículo de emergencia usted tiene que aumentar la distancia que lo separa del mismo?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿A partir de los 45 años de edad se va perdiendo la rapidez para reaccionar?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta: '¿A 60 km/h la visión lateral?',
    opciones: [
      'No se altera',
      'Disminuye un 25%',
      'Disminuye un 50%',
      'Se reduce a visión de tubo',
    ],
    respuestaCorrecta: 3,
  ),
  PreguntaExamen(
    pregunta:
        '¿Ante estas circunstancias: lluvia, atardecer, niebla, humo. Con qué luces tiene que circular?',
    opciones: [
      'Luces de posición',
      'Luces de corto alcance',
      'Luces de largo alcance',
      'Luces de marcha atrás.',
    ],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿Al reventar un neumático se tiene que tomar fuertemente el volante y frenar tan suavemente como le sea posible?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta: '¿Usted puede usar la bocina de su vehículo para?',
    opciones: [
      'Apurar al que va adelante',
      'Prevenir un accidente en caso de extrema necesidad',
      'Avisar que va a estacionar',
      'Siempre, salvo cuando pasa frente a un hospital',
    ],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿Durante la noche en áreas urbanas los vehículos deben circular con todas las luces reglamentarias encendidas?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿En un cruce no regulado, qué vehículo tiene el derecho preferente de paso?',
    opciones: [
      'El que llega primero al cruce',
      'El que aparece por la derecha',
      'El que aparece por la izquierda',
      'El que llegue último al cruce',
    ],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿Antes de empezar a pasar al vehículo que va adelante, usted tiene que?',
    opciones: [
      'Mirar por el espejo retrovisor y prender el señalero',
      'Tocar bocina',
      'Hacer cambio de luces',
      'Colocarse en la senda derecha y prender el señalero',
    ],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿Qué tiene que hacer un conductor al estacionar un vehículo motorizado?',
    opciones: [
      'Detener el motor del vehículo',
      'Dejar el coche en primera',
      'Aplicar freno de mano',
      'Poner las ruedas en ángulo con el cordón',
      'Solo a y c son correctas',
    ],
    respuestaCorrecta: 4,
  ),
  PreguntaExamen(
    pregunta:
        '¿Si usted está mentalmente incapacitado para conducir, le pueden negar la libreta?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿En caso de quedarse sin frenos, cuando el pedal ofrece algo de resistencia, lo correcto es?',
    opciones: [
      'Apretar el pedal a fondo',
      'Bombear para recuperar presión en el sistema',
      'Apretar el pedal suavemente',
    ],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿Cuando los neumáticos están con menor cantidad de aire que la debida para su vehículo?',
    opciones: [
      'Se ahorra combustible',
      'Se consume mayor cantidad de combustible',
      'Se pierde estabilidad, aumentando los desplazamientos laterales',
      'Solo b y c son correctas',
    ],
    respuestaCorrecta: 3,
  ),
  PreguntaExamen(
    pregunta:
        '¿La mayor parte de los accidentes de tránsito por desperfectos del vehículo, a excepción de los frenos, son producidos por?',
    opciones: [
      'Los neumáticos gastados',
      'Problemas de suspensión',
      'El hidroplaneamiento.',
    ],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿La velocidad ideal para conducir con seguridad en carretera se encuentra entre?',
    opciones: [
      '50 y 60 km/h',
      '70 y 90 km/h',
      '100 y 120 km/h',
      'Ninguna de las anteriores es correcta',
    ],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿Cuál es la distancia mínima que tiene que mantener un conductor con respecto al vehículo que circula delante de usted a 60 km/h?',
    opciones: [
      '30 metros',
      '50 metros',
      'Apretar el pedal suavemente',
      'Ninguna de las anteriores es correcta',
    ],
    respuestaCorrecta: 0,
  ),
  PreguntaExamen(
    pregunta:
        '¿En caso de quedarse sin frenos tiene que dejar que el vehículo aminore la velocidad evitando los obstáculos?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿La velocidad máxima a la que se puede conducir en carretera, salvo expresas excepciones, es?',
    opciones: ['45 km/h', '60 km/h', '75 km/h', '90 km/h'],
    respuestaCorrecta: 3,
  ),
  PreguntaExamen(
    pregunta:
        '¿Circulando en el mismo sentido de un vehículo de emergencia, usted tiene que aumentar la distancia que lo separa del mismo?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta:
        '¿La distancia prudencial entre dos vehículos que circulan en la misma dirección en carretera es aquella que permite ver al conductor?',
    opciones: ['Verdadero', 'Falso'],
    respuestaCorrecta: 1,
  ),
  PreguntaExamen(
    pregunta: 'Está terminantemente prohibido estacionar...',
    opciones: [
      'En los canteros centrales',
      'En la mitad de la cuadra',
      'En la acera derecha de las calles de un solo sentido',
      'Ninguna de las anteriores es correcta',
    ],
    respuestaCorrecta: 0,
  ),
];
