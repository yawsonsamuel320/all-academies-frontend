import 'package:flutter/material.dart';

class RecentActivityCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Recent');
    // return Card(
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    //   child: Padding(
    //     padding: EdgeInsets.all(16.0),
    //     child: Row(
    //       children: [
    //         Image.asset("assets/images/book.jpg", width: 50), // Placeholder book image
    //         SizedBox(width: 10),
    //         Expanded(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text("Religious and Moral Education", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    //               Text("In-Scope Series", style: TextStyle(color: Colors.grey)),
    //               SizedBox(height: 5),
    //               LinearProgressIndicator(value: 0.58, color: Colors.yellow, backgroundColor: Colors.grey[300]),
    //               SizedBox(height: 5),
    //               Text("Next: Chapter 3 (Quiz)", style: TextStyle(color: Colors.black)),
    //             ],
    //           ),
    //         ),
    //         ElevatedButton(
    //           style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
    //           onPressed: () {},
    //           child: Text("Start Quiz", style: TextStyle(color: Colors.white)),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
