import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import '../models/book_model.dart';

class BookReaderPage extends StatefulWidget {
  final Book book;
  const BookReaderPage({super.key, required this.book});

  @override
  State<BookReaderPage> createState() => _BookReaderPageState();
}

class _BookReaderPageState extends State<BookReaderPage> {
  String? localPath;
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  Future<void> _loadPdf() async {
    try {
      final url = widget.book.download;
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        final dir = await getApplicationDocumentsDirectory();
        final file =
            File('${dir.path}/${widget.book.title.replaceAll(" ", "_")}.pdf');
        await file.writeAsBytes(bytes);

        setState(() {
          localPath = file.path;
          isLoading = false;
        });
      } else {
        print("HTTP Error: ${response.statusCode}");
        setState(() {
          hasError = true;
          isLoading = false;
        });
      }
    } catch (e) {
      print("Exception: $e");
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.book.title)),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : hasError
              ? const Center(child: Text("❌ Failed to load book."))
              : PDFView(filePath: localPath!),
    );
  }
}
