import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../entities/football.dart';
import '../widget/team_list_card.dart';

class MatchListScreen extends StatefulWidget {
  const MatchListScreen({super.key});

  @override
  State<MatchListScreen> createState() => _MatchListScreenState();
}

class _MatchListScreenState extends State<MatchListScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<Football> teamList = [];

  Future<void> _getFootBallMatch() async{
    teamList.clear();
    final QuerySnapshot result = await firebaseFirestore.collection('football')
        .get();
    for (QueryDocumentSnapshot doc in result.docs) {
      teamList.add(Football(
          matchName: doc.id,
          team1Score: doc.get('team1Score'),
          team2Score: doc.get('team2Score'),
          team1Name: doc.get('team1Name'),
          team2Name: doc.get('team2Name')));
    }
    setState(() {

    });
  }
  @override
  void initState() {
    super.initState();
    _getFootBallMatch();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match List'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('football').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshots) {
          if(snapshots.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshots.hasError){
            return Center(
              child: Text(snapshots.error.toString()),
            );
          }
          if(snapshots.hasData == false){
            return const Center(
              child:  Text('Empty list'),
            );
          }
          teamList.clear();
          for (QueryDocumentSnapshot doc in snapshots.data?.docs ?? []) {
            teamList.add(Football(
                matchName: doc.id,
                team1Score: doc.get('team1Score'),
                team2Score: doc.get('team2Score'),
                team1Name: doc.get('team1Name'),
                team2Name: doc.get('team2Name')));
          }
          return ListView.builder(
            itemCount: teamList.length,
            itemBuilder: (context, index) {
              return TeamListCard(football: teamList[index],);
            },);
        }
      )
    );
  }
}




