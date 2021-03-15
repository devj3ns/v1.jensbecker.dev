import '../models/project.dart';

String _getMockupPath(String imageName) =>
    '/assets/projects/mockups/$imageName';
String _getIconPath(String imageName) => '/assets/projects/icons/$imageName';

List<Project> projects = [
  Project(
    id: 'nestwaerme-kita-app',
    name: 'Nestwärme KiTa App',
    tags: ['nestwärme e.V.', 'KiTa', 'Elterninformation'],
    tools: ['Flutter', 'Dart', 'Firebase'],
    iconUrl: _getIconPath('nestwaerme_kita.png'),
    mockupUrl: _getMockupPath('nestwaerme_kita.png'),
    descriptionShort:
        'Eine App für die Nestwärme KiTa um die Eltern unkompliziert und in Echtzeit informieren zu können.',
    description:
        'Der Verein nestwärme e.V. hat in Trier eine inklusive Kindergrippe und suchte nach einem Weg, die Eltern unkompliziert und in Echtzeit digital zu erreichen und informieren.\n'
        'So ist die Nestwärme KiTa App entstanden.\n\n'
        'Die App bietet die folgenden Funktionen:\n\n'
        '• KiTa Feed: Hier werden Nachrichten angezeigt, die für alle Eltern relevant sind. Eine Nachricht kann auch ein Dokument wie zum Beispiel den Essensplan enthalten.\n'
        '• Gruppen Feed: Hier werden den Eltern Nachrichten von den Erziehern der Gruppe ihres Kindes angezeigt. Diese Nachrichten können nur Eltern von Kindern in derselben Gruppe sehen.\n'
        '• Privat Feed: Hier können Erzieher Nachrichten direkt an Eltern schreiben.\n'
        '• Kalender: Auf der Kalenderseite können alle anstehenden Termine (für die Gruppe des Kindes und der gesamten KiTa) eingesehen werden.\n'
        '• Kind abmelden: Auf der Seite "Mein Kind" können Eltern ihr Kind für den heutigen Tag (bis 9 Uhr) oder den nächsten Tag (ab 16 Uhr) abmelden.\n\n'
        'Die App ist Anfang 2021 in Zusammenarbeit mit Nils Lauterbach entstanden.',
    appStoreUrl:
        'https://apps.apple.com/de/app/nestw%C3%A4rme-kita/id1550933241#?platform=iphone',
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=de.jensbecker.nestwaerme_kita_app',
  ),
  Project(
    id: 'nestwaerme-blickwechsel-buchungsassistent',
    name: 'Nestwärme Blickwechsel Buchungsassistent',
    tags: ['nestwärme e.V.', 'Blickwechsel', 'Coachings'],
    tools: ['Django', 'Python', 'MySQL'],
    iconUrl: _getIconPath('nestwaerme_blickwechsel.png'),
    mockupUrl: _getMockupPath('nestwaerme_blickwechsel.png'),
    descriptionShort:
        'Eine Buchungsassistent-Website für das Projekt Blickwechsel von nestwärme e.V. um ein Coaching online buchen zu können.',
    description:
        'Nestwärme bietet mit ihrem „Blickwechsel“ Projekt, emotionale Unterstützung und Hilfe zur Selbsthilfe an – diskret und behutsam. Siehe https://mein-blickwechsel.de\n\n'
        'Es gibt mehrere Coaches, die bestimmte Themenschwerpunkte haben. Damit einfach und unkompliziert Termine gebucht werden können, habe ich einen Buchungsassistenten entwickelt, bei welchem man Schritt für Schritt zur Terminbuchung geleitet wird.'
        'So bekommt man zum Beispiel für sein Thema alle passenden Termine angezeigt und kann einfach jenen wählen, welcher am besten in den eigenen Terminkalender passt.\n'
        'Die Coaches können ihre verfügbaren Zeiträume auf einer extra Seite angeben und werden dann benachrichtigt, sobald sich jemand für ein Coaching bei Ihnen angemeldet hat.\n\n'
        'Das Projekt ist Anfang 2021 in Zusammenarbeit mit Nils Lauterbach entstanden.',
  ),
  Project(
    id: 'muskelwerkstatt-mehr-performance-onlinebereich',
    name: 'Muskelwerkstatt Mehr Performance Onlinebereich',
    tags: ['Muskelwerkstatt', 'Onlinebereich'],
    tools: ['Django', 'Python', 'MySQL'],
    iconUrl: _getIconPath('muskelwerkstatt.png'),
    mockupUrl: _getMockupPath('muskelwerkstatt.png'),
    descriptionShort:
        'Ein Onlinebereich für die Trainierenden die Muskelwerkstatt Trier.',
    description:
        'In der Muskelwerkstatt arbeitet Sascha Telen mit seinen Muskelarbeitern an deren Körper, deren Fitness und deren Leistungsfähigkeit.\n\n'
        'Um seinen Muskelarbeitern eine Plattform zu bieten, auf der diese gebündelt und einfach auf alle wichtigen Informationen, Dokumente, Tipps, Trainingspläne usw. zugreifen zu können, habe ich den Mehr Performance Online Bereich entwickelt.\n\n'
        'Der Onlinebreich bietet die folgenden Funktionen:\n\n'
        '• Aktuelle Messwerte und Ziele sehen und verfolgen können.\n'
        '• Kalender, in dem man eintragen kann, wann man trainieren war.\n'
        '• Tagestracker, durch den man jeden Tag die Ernährung, den Schlaf, das Training und die Stimmung tracken kann.\n'
        '• Persönliche Dokumente und Trainingspläne einsehen.\n'
        '• Videos mit Trainingsübungen usw. suchen und ansehen können.\n'
        '• Über einen Chat mit Sascha Telen in Kontakt treten.\n\n'
        'Das Projekt ist Mitte 2020 in Zusammenarbeit mit Nils Lauterbach entstanden und wird ab und zu mit neuen Funktionen erweitert.',
  ),
  Project(
    id: 'fleischerei-martin-click-und-collect',
    name: 'Fleischerei Martin Click & Collect Bestellseite',
    tags: ['Fleischerei Martin', 'Click & Collect'],
    tools: ['Django', 'Python', 'MySQL'],
    iconUrl: _getIconPath('fleischerei_martin.png'),
    mockupUrl: _getMockupPath('fleischerei_martin.png'),
    descriptionShort:
        'Eine Click & Collect Bestellseite für die Fleischerei Martin.',
    description:
        'Die Fleischerei Martin wollte aufgrund der aktuellen Situation ihren Kunden eine weitere Möglichkeit des einfachen, unkomplizierten Bestellens zu bieten.\n'
        'Daher habe ich eine Seite entwickelt, auf der die Kunden einfach und bequem ihre Bestellung rund um die Uhr einreichen können und so am nächsten Tag die Bestellung abholbereit im Laden steht.\n\n'
        'Das Projekt ist Ende 2020 in Zusammenarbeit mit Nils Lauterbach entstanden und wird seitdem von den Kunden genutzt.',
  ),
  Project(
    id: 'martin-ternes-mandantenportal',
    name: 'Martin Ternes Mandantenportal',
    tags: ['Martin Ternes', 'Mandantenportal'],
    tools: ['Django', 'Python', 'MySQL'],
    iconUrl: _getIconPath('martin_ternes.png'),
    mockupUrl: _getMockupPath('martin_ternes.png'),
    descriptionShort:
        'Ein Mandantenportal zum Transfer von Belegen und anderen Dokumenten für das Buchhaltungsbüro von Martin Ternes.',
    description:
        'Martin Ternes ist ein Buchhalter mit Sitz in Luxemburg. Für seine Mandanten brauchte er ein Portal, über das diese ihm Ihre Belege und andere Dokumente auf elektronische Weise zukommen lassen können. '
        'So gibt es für seine Mandanten einen zentralen Ort für Dokumente, die sie selber oder er Ihnen hochgeladen hat.\n\n'
        'Das Projekt ist Ende 2020 in Zusammenarbeit mit Nils Lauterbach entstanden.',
  ),
  Project(
    id: 'trading-analyse-newsbots',
    name: 'Trading Newsbots',
    tags: ['Norman Stolze', 'Trading', 'Newsbots'],
    tools: ['Python', 'Twitter API'],
    iconUrl: _getIconPath('trading.png'),
    mockupUrl: _getMockupPath('trading.png'),
    descriptionShort:
        'Newsbots die das Internet und die sozialen Medien nach börsenrelevanten Nachrichten durchsuchen.',
    description:
        'Für den erfolgreichen News-Trader und Trader-Coach Norman Stolze habe ich mehrere Newsbots programmiert, die das Internet und die sozialen Medien nach börsenrelevanten Nachrichten durchsuchen. '
        'Die enorme Menge aller Daten wird dann gefiltert und analysiert, um dann nur die relevanten Nachrichten ihm und seinen Tradern gebündelt in einem Telegram Channel anzuzeigen.\n'
        'Durch die Bots haben die Trader in Echtzeit alle börsenrelevanten Nachrichten auf ihrem Bildschirm und können darauf reagieren.\n\n'
        'Die Zusammenarbeit mit Norman Stolze besteht seit 2020.',
  ),
];
