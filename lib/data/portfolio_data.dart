class Experience {
  final String company;
  final String role;
  final String date;
  final String location;
  final String description;
  final List<String> tags;
  final bool isCurrent;

  const Experience({
    required this.company,
    required this.role,
    required this.date,
    required this.description,
    required this.tags,
    this.location = '',
    this.isCurrent = false,
  });
}

class Skill {
  final String name;
  final String usage;
  final String category;

  const Skill({
    required this.name,
    required this.usage,
    required this.category,
  });
}

class Project {
  final String name;
  final String description;
  final String contribution;
  final List<String> tags;

  const Project({
    required this.name,
    required this.description,
    required this.contribution,
    required this.tags,
  });
}

class Education {
  final String school;
  final String degree;
  final String years;

  const Education({
    required this.school,
    required this.degree,
    required this.years,
  });
}

class PortfolioData {
  static const String name = 'Modou Mamoune Diop';
  static const String title = 'Développeur Web & Mobile · Full-Stack';
  static const String location = 'Dakar, Sénégal';
  static const String phone = '+221 77 157 93 13';
  static const String email = 'mamoune044@gmail.com';
  static const String linkedin = 'linkedin.com/in/modou-mamoune-diop-598952199';
  static const String github = 'github.com/DiopMamoune';
  static const String bio =
      'Je suis développeur web et mobile à Dakar. Je travaille actuellement sur une application Flutter chez CBAO, autour du paiement interopérable. '
      'J’ai aussi travaillé sur la gestion des dépenses publiques, une mutuelle de santé et des services de géolocalisation. '
      'Une grande partie de mon apprentissage s’est faite en autonomie, au fil des projets et des problèmes à résoudre.';

  static const List<Experience> experiences = [
    Experience(
      company: 'CBAO · Groupe Attijariwafa Bank',
      role: 'Consultant Développeur Mobile Flutter',
      date: 'Sept. 2024 — Aujourd\'hui',
      location: 'Dakar, Sénégal · Sur site',
      description:
          'Mission de consultance pour le développement d\'une application mobile embarquant le système de Paiement Interopérable (PI) de la BCEAO — solution déployée à l\'échelle de la zone UEMOA pour l\'un des principaux groupes bancaires d\'Afrique de l\'Ouest.',
      tags: [
        'Flutter',
        'Dart',
        'Paiement Interopérable',
        'BCEAO',
        'Bitbucket',
        'Jira',
        'Agile',
      ],
      isCurrent: true,
    ),
    Experience(
      company: 'Finetech Groupe',
      role: 'Développeur Web & Mobile',
      date: 'Fév. 2023 — Aujourd\'hui',
      description:
          'Exploitation du module exécution des dépenses et comptabilité budgétaire pour la Direction Générale du Budget du Sénégal via la plateforme Sysbudgep.',
      tags: ['ReactJS', 'NextJS', 'Bitbucket'],
    ),
    Experience(
      company: 'GITECH SN',
      role: 'Développeur Fullstack',
      date: 'Août 2022 — Janv. 2023',
      description:
          'Développement d\'une plateforme de gestion de la mutuelle de santé des militaires.',
      tags: ['Angular 12', 'PHP 8', 'GitLab'],
    ),
    Experience(
      company: 'FINDME',
      role: 'Développeur Fullstack',
      date: 'Juil. 2022 — Déc. 2022',
      description:
          'Développement d\'une plateforme de gestion et de demandes d\'agréments. Application mobile générant une adresse postale géolocalisée.',
      tags: ['Flutter', 'Sentry'],
    ),
    Experience(
      company: 'UNITED VENDOR',
      role: 'Développeur Fullstack',
      date: 'Avr. 2021 — Déc. 2021',
      description:
          'Mise en place d\'une plateforme open source (Mifos) de gestion bancaire. Branding et adaptations selon les besoins clients.',
      tags: ['Angular', 'Spring Boot'],
    ),
  ];

  static const List<Skill> skills = [
    Skill(
      name: 'Flutter · Dart',
      usage:
          'Applications mobiles chez CBAO et FINDME : paiement interopérable et adresse géolocalisée.',
      category: 'Frontend / Mobile',
    ),
    Skill(
      name: 'React · Next.js',
      usage:
          'Module de gestion des dépenses publiques sur Sysbudgep, chez Finetech Groupe.',
      category: 'Frontend / Mobile',
    ),
    Skill(
      name: 'Angular',
      usage:
          'Plateforme de mutuelle de santé chez GITECH SN et personnalisation de Mifos chez UNITED VENDOR.',
      category: 'Frontend / Mobile',
    ),
    Skill(
      name: 'PHP',
      usage:
          'Développement de la plateforme de mutuelle de santé avec PHP 8 chez GITECH SN.',
      category: 'Backend',
    ),
    Skill(
      name: 'Spring Boot',
      usage:
          'Stack utilisée dans la mission de déploiement et de personnalisation de Mifos.',
      category: 'Backend',
    ),
  ];

  static const List<String> tools = [
    'Git',
    'VS Code',
    'IntelliJ',
    'Postman',
    'Insomnia',
    'Jira',
    'Slack',
    'Notion',
    'VirtualBox',
    'Bitbucket',
    'GitLab',
    'GitHub',
  ];

  static const List<Project> projects = [
    Project(
      name: 'Paiement interopérable · CBAO',
      description:
          'Application mobile de paiement interopérable pour la zone UEMOA développée pour CBAO · Attijariwafa.',
      contribution:
          'Développement mobile Flutter dans le cadre d’une mission de consultance chez CBAO.',
      tags: ['Flutter', 'Dart'],
    ),
    Project(
      name: 'Dépenses publiques · Sysbudgep',
      description:
          'Module web de gestion des dépenses publiques pour la Direction Générale du Budget du Sénégal.',
      contribution:
          'Travail sur le module d’exécution des dépenses et de comptabilité budgétaire chez Finetech Groupe.',
      tags: ['ReactJS', 'NextJS'],
    ),
    Project(
      name: 'Mutuelle Militaire',
      description:
          'Plateforme fullstack de gestion de la mutuelle de santé des militaires sénégalais.',
      contribution:
          'Développement full-stack de la plateforme chez GITECH SN, avec Angular 12 et PHP 8.',
      tags: ['Angular 12', 'PHP 8'],
    ),
    Project(
      name: 'Adresse géolocalisée · FINDME',
      description:
          'Application mobile générant une adresse postale unique et géolocalisée à partir de la position GPS.',
      contribution:
          'Développement de l’application mobile Flutter chez FINDME.',
      tags: ['Flutter', 'Sentry'],
    ),
    Project(
      name: 'Mifos Banking',
      description:
          'Déploiement et personnalisation d\'une solution open source de gestion bancaire (Mifos).',
      contribution:
          'Mise en place de Mifos, adaptation de l’identité visuelle et personnalisation selon les besoins clients chez UNITED VENDOR.',
      tags: ['Angular', 'Spring Boot'],
    ),
  ];

  static const List<Education> education = [
    Education(
      school: 'Access Code School',
      degree: 'Certification Développement Web & Mobile',
      years: '2020 – 2021',
    ),
    Education(
      school: 'ISI',
      degree: 'Licence Génie Logiciel',
      years: '2016 – 2019',
    ),
    Education(
      school: 'Lycée Seydina Limamou Laye',
      degree: 'Baccalauréat Série S2',
      years: '2015 – 2016',
    ),
  ];

  static const List<String> interests = [
    'Veille technologique',
    'Voyage',
    'Basket-ball',
  ];
}
