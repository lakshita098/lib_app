import 'package:flutter/material.dart';
import 'book_list_page.dart';

class SubjectGridPage extends StatelessWidget {
  const SubjectGridPage({super.key});

  final List<String> subjects = const [
    "English",
    "Geography",
    "History",
    "Economics",
    "Chemistry",
    "Physics",
    "Biology",
    "Computer Science",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Subjects")),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: subjects.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => BookListPage(subject: subjects[index])),
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(subjects[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          );
        },
      ),
    );
  }
}
