import 'package:firebase_live_score_project/ui/screens/match_list_screen.dart';
import 'package:flutter/material.dart';

class LiveScore extends StatelessWidget {
  const LiveScore({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Live Score',
      debugShowCheckedModeBanner: false,
      home: MatchListScreen(),
    );
  }
}
