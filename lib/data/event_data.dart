// Datos iniciales para la práctica.
//
// Pueden agregar más eventos o modificar estos datos.
// No es obligatorio conservar exactamente estos eventos.

const List<String> categorias = [
  'Todos',
  'Académicos',
  'Deportivos',
  'Culturales',
  'Tecnología',
  'Talleres',
];

const List<Map<String, dynamic>> eventos = [
  {
    'titulo': 'Hackathon Universitario',
    'categoria': 'Tecnología',
    'fecha': '18 de septiembre',
    'hora': '09:00',
    'lugar': 'Laboratorio de Cómputo',
    'cupo': 40,
    'imagen':
        'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?w=900',
  },
  {
    'titulo': 'Taller de Flutter',
    'categoria': 'Talleres',
    'fecha': '20 de septiembre',
    'hora': '12:00',
    'lugar': 'Edificio 5',
    'cupo': 25,
    'imagen':
        'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=900',
  },
  {
    'titulo': 'Conferencia de Inteligencia Artificial',
    'categoria': 'Académicos',
    'fecha': '23 de septiembre',
    'hora': '10:00',
    'lugar': 'Auditorio Central',
    'cupo': 120,
    'imagen':
        'https://images.unsplash.com/photo-1531482615713-2afd69097998?w=900',
  },
  {
    'titulo': 'Torneo de Futbol',
    'categoria': 'Deportivos',
    'fecha': '25 de septiembre',
    'hora': '16:00',
    'lugar': 'Cancha Universitaria',
    'cupo': 80,
    'imagen':
        'https://images.unsplash.com/photo-1579952363873-27f3bade9f55?w=900',
  },
  {
    'titulo': 'Exposición de Arte',
    'categoria': 'Culturales',
    'fecha': '27 de septiembre',
    'hora': '11:00',
    'lugar': 'Galería Universitaria',
    'cupo': 60,
    'imagen':
        'https://images.unsplash.com/photo-1561214115-f2f134cc4912?w=900',
  },
  {
    'titulo': 'Charla de Ciberseguridad',
    'categoria': 'Tecnología',
    'fecha': '30 de septiembre',
    'hora': '13:00',
    'lugar': 'Sala Audiovisual',
    'cupo': 50,
    'imagen':
        'https://images.unsplash.com/photo-1563013544-824ae1b704d3?w=900',
  },
  {
    'titulo': 'Taller de Emprendimiento',
    'categoria': 'Talleres',
    'fecha': '2 de octubre',
    'hora': '15:00',
    'lugar': 'Centro de Innovación',
    'cupo': 35,
    'imagen':
        'https://images.unsplash.com/photo-1521737711867-e3b97375f902?w=900',
  },
  {
    'titulo': 'Festival Universitario',
    'categoria': 'Culturales',
    'fecha': '5 de octubre',
    'hora': '17:00',
    'lugar': 'Plaza Principal',
    'cupo': 200,
    'imagen':
        'https://images.unsplash.com/photo-1501281668745-f7f57925c3b4?w=900',
  },
  {
    'titulo': 'Conferencia de Liderazgo Universitario',
    'categoria': 'Académicos',
    'fecha': '7 de octubre',
    'hora': '10:00',
    'lugar': 'Auditorio Central',
    'cupo': 150,
    'imagen':
        'https://images.unsplash.com/photo-1544531586-fde5298cdd40?w=900',
  },
  {
    'titulo': 'Torneo de Baloncesto Interfacultades',
    'categoria': 'Deportivos',
    'fecha': '8 de octubre',
    'hora': '17:00',
    'lugar': 'Gimnasio Universitario',
    'cupo': 100,
    'imagen':
        'https://images.unsplash.com/photo-1579487685737-e435a87b2518?w=900',
  },
  {
    'titulo': 'Meetup de Desarrollo de Software',
    'categoria': 'Tecnología',
    'fecha': '9 de octubre',
    'hora': '18:00',
    'lugar': 'Centro de Innovación',
    'cupo': 60,
    'imagen':
        'https://images.unsplash.com/photo-1631350397792-8e0c2de5b637?w=900',
  },
  {
    'titulo': 'Noche de Danza Folclórica',
    'categoria': 'Culturales',
    'fecha': '10 de octubre',
    'hora': '19:00',
    'lugar': 'Teatro Universitario',
    'cupo': 180,
    'imagen':
        'https://images.unsplash.com/photo-1463592177119-bab2a00f3ccb?w=900',
  },
  {
    'titulo': 'Taller de Robótica Educativa',
    'categoria': 'Talleres',
    'fecha': '11 de octubre',
    'hora': '14:00',
    'lugar': 'Laboratorio de Robótica',
    'cupo': 30,
    'imagen':
        'https://images.unsplash.com/photo-1655393001768-d946c97d6fd1?w=900',
  },
  {
    'titulo': 'Simposio de Investigación Científica',
    'categoria': 'Académicos',
    'fecha': '13 de octubre',
    'hora': '09:00',
    'lugar': 'Auditorio Central',
    'cupo': 120,
    'imagen':
        'https://images.unsplash.com/photo-1492538368677-f6e0afe31dcc?w=900',
  },
  {
    'titulo': 'Copa Universitaria de Voleibol',
    'categoria': 'Deportivos',
    'fecha': '14 de octubre',
    'hora': '16:00',
    'lugar': 'Cancha Universitaria',
    'cupo': 70,
    'imagen':
        'https://images.unsplash.com/photo-1547347298-4074fc3086f0?w=900',
  },
  {
    'titulo': 'Bootcamp de Programación',
    'categoria': 'Tecnología',
    'fecha': '15 de octubre',
    'hora': '09:00',
    'lugar': 'Laboratorio de Cómputo',
    'cupo': 45,
    'imagen':
        'https://images.unsplash.com/photo-1756273343749-63f7d6ea0cda?w=900',
  },
  {
    'titulo': 'Festival de Tradiciones Mexicanas',
    'categoria': 'Culturales',
    'fecha': '17 de octubre',
    'hora': '17:00',
    'lugar': 'Plaza Principal',
    'cupo': 250,
    'imagen':
        'https://images.unsplash.com/photo-1759738102510-ec524f666274?w=900',
  },
  {
    'titulo': 'Taller de Automatización y Electrónica',
    'categoria': 'Talleres',
    'fecha': '18 de octubre',
    'hora': '15:00',
    'lugar': 'Edificio 5',
    'cupo': 28,
    'imagen':
        'https://images.unsplash.com/photo-1637002722490-5f8ceed9774c?w=900',
  },
  {
    'titulo': 'Coloquio de Ciencias Sociales',
    'categoria': 'Académicos',
    'fecha': '20 de octubre',
    'hora': '11:00',
    'lugar': 'Sala Audiovisual',
    'cupo': 80,
    'imagen':
        'https://images.unsplash.com/photo-1655337690778-694dda7f4454?w=900',
  },
  {
    'titulo': 'Clásico Deportivo UAA',
    'categoria': 'Deportivos',
    'fecha': '21 de octubre',
    'hora': '18:00',
    'lugar': 'Gimnasio Universitario',
    'cupo': 200,
    'imagen':
        'https://images.unsplash.com/photo-1581390561595-2544b8d26538?w=900',
  },
  {
    'titulo': 'Foro de Innovación Tecnológica',
    'categoria': 'Tecnología',
    'fecha': '23 de octubre',
    'hora': '12:00',
    'lugar': 'Centro de Innovación',
    'cupo': 90,
    'imagen':
        'https://images.unsplash.com/photo-1632910121591-29e2484c0259?w=900',
  },
  {
    'titulo': 'Seminario de Metodología de la Investigación',
    'categoria': 'Académicos',
    'fecha': '24 de octubre',
    'hora': '10:00',
    'lugar': 'Auditorio Central',
    'cupo': 100,
    'imagen':
        'https://images.unsplash.com/photo-1758270704262-ecc82b23dc37?w=900',
  },
];
