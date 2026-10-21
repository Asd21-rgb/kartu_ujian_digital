import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kartu Ujian Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const KartuUjianPage(),
      debugShowCheckedModeBanner: false, // menghilangkan tanda debug di pojok kanan aplikasi
    );
  }
}

class KartuUjianPage extends StatelessWidget {
  const KartuUjianPage({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. AppBar bertema warna kampus (maroon & emas)
      appBar: AppBar(
        title:const Text(
          'KARTU UJIAN DIGITAL',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
        ),
        backgroundColor: Colors.green[700], // warna kampus utama
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: Colors.grey[100],
      // menggunakan singlechildscrollview agar anti-overflow pada pixel 7
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 2. kartu informasi mahasiswa (container + decoration)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                 boxShadow: [
                  BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                  ),
                 ],
                 border: Border.all(color: Colors.green.shade700, width: 1.5),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // foto mahasiswa placeholder
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.green[700],
                    child: const Text(
                      'MA', // inisial Muhammad Asdiani
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 16,),
                  // detail biodata mahasiswa menggunakan column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Muhammad Asdiani',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text('NPM: 2410020096', style: TextStyle(color: Colors.grey)),
                        Text('Prodi: Sistem Informasi', style: TextStyle(color: Colors.grey)),
                        Text('Semester: 5 (Lima)', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // bagian judul utama
            Row(
              children: const [
                Icon(Icons.calendar_month, color: Colors.blueGrey),
                SizedBox(width: 8),
                Text(
                  'Jadwal Ujian Akhir Semester (UAS)',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // 3. container jadwal ujian (minimal 4 mata kuliah)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  // memanggil method helper baris berulang
                  _buildJadwalRow(Icons.phone_android, 'Mobile Progamming', '26 Okt 2026', '08:00-10:00', 'Lab Komp 3'),
                  const Divider(height: 1),
                  _buildJadwalRow(Icons.storage, 'Basis Data Lanjut', '27 Oktober 2026', '10:30 - 12:30', 'Ruang H.2.1'),
                  const Divider(height: 1),
                  _buildJadwalRow(Icons.language, 'Web Progamming 2', '28 Okt 2026', '08:00 - 10:00', 'Lab Komp 1'),
                  const Divider(height: 1),
                  _buildJadwalRow(Icons.psychology, 'Kecerdasan Buatan', '29 Okt 2026', '13:00- 15:00', 'Ruang H.3.4'),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // 4. Tombol Aksi di Bagian Bawah
            ElevatedButton.icon(
              onPressed: () {
                // aksi bebas di bagian bawah
                debugPrint('Mencetak Kartu...');
              },
              icon: const Icon(Icons.print, color: Colors.white),
              label: const Text('Cetak Kartu Ujian', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                debugPrint('Membuka syarat...');
              },
              child: const Text('Lihat Syarat & Ketentuan Ujian'),
            )
          ],
        ),
      ),
    ),
  );
}


  // ====================================================================
  // 3. METHOD HELPER UNTUK BARIS BERULANG (JADWAL)
  // ====================================================================
  Widget _buildJadwalRow(IconData icon, String matkul, String tanggal, String jam, String ruang) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.green[700], size: 28),
          const SizedBox(width: 12),
          // expanded menjaga agar teks mata kuliah panjang tidak mendorong konten keluar layar
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(matkul, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text('$tanggal •  $jam', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                  ],
                ),
                Text('Ruang: $ruang', style: TextStyle(color: Colors.amber[900], fontSize: 12, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}