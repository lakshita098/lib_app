import 'package:flutter/material.dart';
import '../models/book_model.dart';
import 'book_reader_page.dart';

import '../data/english_books.dart';
import '../data/geography_books.dart';
import '../data/history_books.dart';
import '../data/economics_books.dart';
import '../data/chemistry_books.dart';
import '../data/physics_books.dart';
import '../data/biology_books.dart';
import '../data/computer_science_books.dart';

class BookListPage extends StatelessWidget {
  final String subject;
  const BookListPage({super.key, required this.subject});

  List<Book> getBooksForSubject(String subject) {
    switch (subject) {
      case "English":
        return englishBooks;
      case "Geography":
        return geographyBooks;
      case "History":
        return historyBooks;
      case "Economics":
        return economicsBooks;
      case "Chemistry":
        return chemistryBooks;
      case "Physics":
        return physicsBooks;
      case "Biology":
        return biologyBooks;
      case "Computer Science":
        return computerScienceBooks;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final books = getBooksForSubject(subject);

    return Scaffold(
      appBar: AppBar(title: Text(subject)),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: books.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (_, index) {
          final book = books[index];
          return ListTile(
            tileColor: Colors.deepPurple.shade50,
            title: Text(book.title),
            subtitle: Text(book.author),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => Container(
                  padding: const EdgeInsets.all(16),
                  height: 180,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(book.title,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text("by ${book.author}"),
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BookReaderPage(book: book),
                              ),
                            );
                          },
                          icon: const Icon(Icons.menu_book),
                          label: const Text("Read Book"),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
