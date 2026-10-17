import 'package:flutter/material.dart';

class ProfileInfoSection extends StatelessWidget {
  final String email;
  final String location;
  final String phone;

  const ProfileInfoSection({
    super.key,
    required this.email,
    required this.location,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _InfoRow(
          icon: Icons.email_outlined,
          text: email,
        ),
        const SizedBox(height: 14),
        _InfoRow(
          icon: Icons.location_on_outlined,
          text: location,
        ),
        const SizedBox(height: 14),
        _InfoRow(
          icon: Icons.phone_outlined,
          text: phone,
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: const BoxDecoration(
            color: Color(0xFF8583A9),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}