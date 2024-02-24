import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Member { // definit un modele de membre avec des proprietes
  final String name;
  final String position;
  final String Tel;
  final String bio;
  final String academicBackground; // Ajout de la propriété academicBackground

  Member({
    required this.name,
    required this.position,
    required this.Tel,
    required this.bio,
    required this.academicBackground, // Initialisation de la propriété academicBackground
  });
}

List<Member> members = [
  Member(
    name: 'Louis Stanley',
    position: 'Développeur mobile',
    Tel: '3111-4111',
    bio: 'Louis Stanley est un développeur mobile passionné ...',
    academicBackground: 'Baccalauréat en informatique, Université ESIH', // Exemple d'antécédents académiques
  ),
    Member(
    name: 'Ovide Samuel',
    position: 'Développeur mobile',
    Tel: '4050-2090',
    bio: 'Ovide Samuel est un développeur mobile passionné ...',
    academicBackground: 'Baccalauréat en informatique, Université ESIH', // Exemple d'antécédents académiques
  ),
    Member(
    name: 'Jean Exard Abellard',
    position: 'Développeur mobile',
    Tel: '3414-8784',
    bio: 'Exard Abellard est un développeur mobile passionné ...',
    academicBackground: 'Baccalauréat en informatique, Université ESIH', // Exemple d'antécédents académiques
  ),
    Member(
    name: 'Steeve Emmanuel',
    position: 'Développeur mobile',
    Tel: '3234-5678',
    bio: 'Steeve Emmanuel est un développeur mobile passionné ...',
    academicBackground: 'Baccalauréat en informatique, Université ESIH', // Exemple d'antécédents académiques
  ),
  
  // Ajoutez d'autres membres ici
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GroupMemberList(),
    );
  }
}

class GroupMemberList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' CV Membres du Groupe'),
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(members[index].name),
            subtitle: Text(members[index].position),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MemberDetail(member: members[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MemberDetail extends StatelessWidget {
  final Member member;

  MemberDetail({required this.member});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(member.name),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Personal Information'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PersonalInformation(member: member),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Academic Background'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AcademicBackground(member: member),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class PersonalInformation extends StatelessWidget {
  final Member member;

  PersonalInformation({required this.member});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Information'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${member.name}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Position: ${member.position}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Bio: ${member.bio}',
              style: TextStyle(fontSize: 18),
            ),
            // Ajoutez d'autres informations personnelles ici
          ],
        ),
      ),
    );
  }
}

class AcademicBackground extends StatelessWidget {
  final Member member;

  AcademicBackground({required this.member});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Academic Background'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Academic Background:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              member.academicBackground, // Afficher les antécédents académiques du membre
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}










