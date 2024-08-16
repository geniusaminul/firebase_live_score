
import 'package:firebase_live_score_project/ui/entities/football.dart';
import 'package:flutter/material.dart';
class TeamListCard extends StatelessWidget {
  const TeamListCard({
    super.key, required this.football,
  });
  final Football football;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildTeamName(football.team1Score, football.team1Name),
            const Text('vs'),
            buildTeamName(football.team2Score, football.team2Name),

          ],
        ),
      ),
    );
  }

  Widget buildTeamName(int score, String teamName) {
    return Column(
            children: [
              Text(score.toString(), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              Text(teamName, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),)
            ],
          );
  }
}