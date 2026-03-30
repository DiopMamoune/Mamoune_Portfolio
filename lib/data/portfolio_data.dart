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
  final double level; // 0.0 to 1.0
  final String category;

  const Skill({required this.name, required this.level, required this.category});
}

class Project {
  final String name;
  final String description;
  final String icon;
  final List<String> tags;

  const Project({
    required this.name,
    required this.description,
    required this.icon,
    required this.tags,
  });
}

class Education {
  final String school;
  final String degree;
  final String years;

  const Education({required this.school, required this.degree, required this.years});
}

class PortfolioData {
  static const String name = 'Modou Mamoune Diop';
  static const String title = 'Développeur Web & Mobile · Full-Stack';
  static const String location = 'Dakar, Sénégal';
  static const String phone = '+221 77 157 93 13';
  static const String email = 'modou.mamoune@email.com';
  static const String linkedin = 'linkedin.com/in/modou-mamoune-diop-598952199';
  static const String github = 'github.com/DiopMamoune';
  static const String bio =
      'Développeur full-stack passionné par l\'informatique et la programmation, j\'ai acquis la majorité de mes compétences en auto-apprentissage, grâce à une curiosité constante et un goût prononcé pour la recherche. Doté d\'une grande capacité d\'adaptation et d\'une forte réactivité face aux environnements exigeants, je travaille aussi bien en équipe qu\'en autonomie.';

  static const List<Experience> experiences = [
    Experience(
      company: 'CBAO · Groupe Attijariwafa Bank',
      role: 'Consultant Développeur Mobile Flutter',
      date: 'Sept. 2024 — Aujourd\'hui · 1 an 7 mois',
      location: 'Dakar, Sénégal · Sur site',
      description:
          'Mission de consultance pour le développement d\'une application mobile embarquant le système de Paiement Interopérable (PI) de la BCEAO — solution déployée à l\'échelle de la zone UEMOA pour l\'un des principaux groupes bancaires d\'Afrique de l\'Ouest.',
      tags: ['Flutter', 'Dart', 'Paiement Interopérable', 'BCEAO', 'Bitbucket', 'Jira', 'Agile'],
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
      description: 'Développement d\'une plateforme de gestion de la mutuelle de santé des militaires.',
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
    Skill(name: 'Flutter', level: 0.90, category: 'Frontend / Mobile'),
    Skill(name: 'React JS', level: 0.85, category: 'Frontend / Mobile'),
    Skill(name: 'Next JS', level: 0.80, category: 'Frontend / Mobile'),
    Skill(name: 'Angular', level: 0.75, category: 'Frontend / Mobile'),
    Skill(name: 'HTML/CSS', level: 0.90, category: 'Frontend / Mobile'),
    Skill(name: 'PHP', level: 0.75, category: 'Backend'),
    Skill(name: 'Java', level: 0.65, category: 'Backend'),
    Skill(name: 'MySQL', level: 0.70, category: 'Backend'),
  ];

  static const List<String> tools = [
    'Git', 'VS Code', 'IntelliJ', 'Postman', 'Insomnia',
    'Jira', 'Slack', 'Notion', 'VirtualBox', 'Bitbucket', 'GitLab', 'GitHub',
  ];

  static const List<Project> projects = [
    Project(
      name: 'PI BCEAO App',
      description: 'Application mobile de paiement interopérable pour la zone UEMOA développée pour CBAO · Attijariwafa.',
      icon: '💳',
      tags: ['Flutter', 'Dart'],
    ),
    Project(
      name: 'Sysbudgep Module',
      description: 'Module web de gestion des dépenses publiques pour la Direction Générale du Budget du Sénégal.',
      icon: '🏦',
      tags: ['ReactJS', 'NextJS'],
    ),
    Project(
      name: 'Mutuelle Militaire',
      description: 'Plateforme fullstack de gestion de la mutuelle de santé des militaires sénégalais.',
      icon: '🏥',
      tags: ['Angular 12', 'PHP 8'],
    ),
    Project(
      name: 'FINDME Géoloc',
      description: 'Application mobile générant une adresse postale unique et géolocalisée à partir de la position GPS.',
      icon: '📍',
      tags: ['Flutter', 'Sentry'],
    ),
    Project(
      name: 'Mifos Banking',
      description: 'Déploiement et personnalisation d\'une solution open source de gestion bancaire (Mifos).',
      icon: '🏗',
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

  static const List<String> interests = ['Veille technologique', 'Voyage', 'Basket-ball'];
}
