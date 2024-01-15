import 'package:flutter/material.dart';

class halamanperaturan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tampilan Peraturan',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(78, 96, 76, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PeraturanPage(),
    );
  }
}

class PeraturanPage extends StatelessWidget {
  final List<String> daftarPeraturan = [
    'Peraturan 1',
    'Peraturan 2',
    'Peraturan 3',
    'Peraturan 4',
    'Peraturan 5',
    // Tambahkan peraturan sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 79, 90, 99),
        title: Text('Daftar Peraturan'),
      ),
      body: ListView.builder(
        itemCount: daftarPeraturan.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(daftarPeraturan[index]),
            onTap: () {
              // Tambahkan logika untuk menampilkan detail peraturan
              // Misalnya, navigasi ke halaman detail atau menampilkan dialog
              // sesuai dengan peraturan yang dipilih.
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Detail Peraturan'),
                    content: Text(
                        'Ini adalah detail peraturan ${daftarPeraturan[index]}'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Tutup'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Tutup dialog
                          Navigator.of(context)
                              .pop(); // Kembali ke halaman sebelumnya
                        },
                        child: Text('Kembali'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
