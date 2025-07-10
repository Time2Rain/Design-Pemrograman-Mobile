import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            const SizedBox(height: 16),
            Text(
              'User Name',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'user@email.com',
              style: GoogleFonts.poppins(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 30),
            _buildProfileItem(
              icon: Icons.person_outline,
              title: 'Edit Profil',
              onTap: () {},
            ),
            _buildProfileItem(
              icon: Icons.history,
              title: 'Riwayat Aktivitas',
              onTap: () {},
            ),
            _buildProfileItem(
              icon: Icons.bar_chart,
              title: 'Statistik Kesehatan',
              onTap: () {},
            ),
            _buildProfileItem(
              icon: Icons.settings,
              title: 'Pengaturan',
              onTap: () {},
            ),
            _buildProfileItem(
              icon: Icons.help_outline,
              title: 'Bantuan & Dukungan',
              onTap: () {},
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.red),
                  ),
                child: Text(
                  'Keluar',
                  style: GoogleFonts.poppins(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 6,
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title, style: GoogleFonts.poppins()),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}