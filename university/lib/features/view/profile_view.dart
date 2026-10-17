import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university/features/view/profile_viewmodel.dart';
import 'package:university/features/weidgets/custom_icon.dart';
import 'package:university/features/weidgets/profile_buttons.dart';
import 'package:url_launcher/url_launcher.dart';


import 'portfolio_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileViewModel(),
      child: const _ProfileContent(),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  const _ProfileContent();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProfileViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xFF343449),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),

              // Profile avatar
              Center(
                child: CircleAvatar(
                  radius: 65,
                  backgroundColor: const Color(0xFFE5E5E5),
                  child: Icon(
                    Icons.person,
                    size: 75,
                    color: Colors.white.withValues(alpha: 0.9),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // Name
              Center(
                child: Text(
                  viewModel.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // Job title
              Center(
                child: Text(
                  viewModel.jobTitle,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(height: 35),

              // Custom widget containing contact info rows
              ProfileInfoSection(
                email: viewModel.email,
                location: viewModel.location,
                phone: viewModel.phone,
              ),

              const SizedBox(height: 30),

              // About Me
              const Text(
                'About Me',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                viewModel.aboutMe,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 35),

              // Custom buttons widget
              ProfileButtons(
                onContactTap: () async {
                  final emailUri = Uri(
                    scheme: 'mailto',
                    path: viewModel.email,
                    queryParameters: {
                      'subject': 'Hello ${viewModel.name}',
                    },
                  );

                  final opened = await launchUrl(emailUri);

                  if (!opened && context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Could not open email app.'),
                      ),
                    );
                  }
                },

                onPortfolioTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PortfolioView(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}