import '../models/project.dart';

List<Project> projects = [
  const Project(
    id: 'xn4kop32djqa2',
    name: 'Nestwärme KiTa App',
    tags: ['nestwärme e.V', 'KiTa', 'Elterninformation'],
    tools: ['Flutter', 'Dart', 'Firebase'],
    descriptionShort:
        'Eine App für die Nestwärme KiTa um die Eltern unkompliziert und in Echtzeit informieren zu können.',
    description:
        'Die App bietet die folgenden Funktionen: KiTa Feed: Hier werden Nachrichten angezeigt, die für alle Eltern relevant sind. Eine Nachricht kann auch ein Dokument wie zum Beispiel den Essensplan enthalten.'
        '- Gruppen Feed: Hier werden Nachrichten von den Erziehern der Gruppe ihres Kindes angezeigt. Diese Nachrichten können nur Eltern von Kindern in der selben Gruppe sehen.'
        '- Privat Feed: Hier können Erzieher Nachrichten direkt an Sie schreiben. '
        '- Kalender: Auf der Kalender Seite können Sie alle anstehenden Termine (fūr die Gruppe ihres Kindes und die gesamte KiTa) sehen. '
        '- Kind abmelden: Auf der Seite "Mein Kind" können Sie ihr Kind für den heutigen Tag (bis 8 Uhr) oder den nächsten Tag (ab 16 Uhr) abmelden. Rufen Sie uns außerhalb dieser Uhrzeiten bitte an um ihr Kind abzumelden.',
  ),
  const Project(
    id: 'x6nc62pmz3x2fa',
    name: 'Nestwärme Blickwechsel Buchungsassistent',
    tags: ['nestwärme e.V', 'Blickwechsel', 'Coachings'],
    tools: ['Django', 'Python', 'MySQL'],
    descriptionShort:
        'Website auf der man ein Blickwechsel Coaching buchen kann und über welche die Coaches ihre verfügbaren Zeiträume angeben.',
    description:
        'Website auf der man ein Blickwechsel Coaching buchen kann und über welche die Coaches ihre verfügbaren Zeiträume angeben.',
  ),
];
