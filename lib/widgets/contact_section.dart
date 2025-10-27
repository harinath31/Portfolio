import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/constants/app_constant.dart';
import 'package:portfolio/constants/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final _emailCtl = TextEditingController();
  final _subjectCtl = TextEditingController();
  final _messageCtl = TextEditingController();

  static const double _pillRadius = 30.0; // Adjusted radius for a softer look
  static const _border = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(_pillRadius)),
    borderSide: BorderSide(color: Colors.grey, width: 1.5), // Softer border
  );

  @override
  void dispose() {
    nameController.dispose();
    _emailCtl.dispose();
    _subjectCtl.dispose();
    _messageCtl.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final payload = {
      'Name': nameController.text.trim(),
      'Email': _emailCtl.text.trim(),
      'Subject': _subjectCtl.text.trim(),
      'Message': _messageCtl.text.trim(),
    };

    final uri = Uri.parse(AppConstant().formspreeEndpoint);

    try {
      final resp = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(payload),
      );

      if (resp.statusCode == 200 ||
          resp.statusCode == 201 ||
          resp.statusCode == 204) {
        _showToast(
          'Thanks for reaching out! Your message has been sent — I will review it and reply within 48 hours.',
        );
        _clearFields();
      } else {
        _handleError();
      }
    } catch (e) {
      _showToast('Error sending message: $e');
    }
  }

  void _showToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(label: 'CLOSE', onPressed: () {}),
      ),
    );
  }

  void _clearFields() {
    nameController.clear();
    _emailCtl.clear();
    _subjectCtl.clear();
    _messageCtl.clear();
  }

  void _handleError() {
    _showToast(
      'Due to a technical issue the message could not be sent. Redirecting to Gmail...',
    );
    Future.delayed(const Duration(seconds: 2), () async {
      final subject = Uri.encodeComponent(_subjectCtl.text.trim());
      final body = Uri.encodeComponent(
        'Name: ${nameController.text.trim()}\nEmail: ${_emailCtl.text.trim()}\n\n${_messageCtl.text.trim()}',
      );
      final mailto = Uri.parse(
        'mailto:${Constants().userProfile.email}?subject=$subject&body=$body',
      );

      if (await canLaunchUrl(mailto)) {
        await launchUrl(mailto);
      } else {
        _showToast('Could not open mail app');
      }
    });
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 6),
            const Text('*', style: TextStyle(color: Colors.red)),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: validator,
          maxLines: maxLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            enabledBorder: _border,
            focusedBorder: _border.copyWith(
              borderSide: BorderSide(color: AppConstant().themeColor),
            ),
            border: _border,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNotPhone = constraints.maxWidth > 800;
        final fieldSpacing = 24.0;
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Add the "Contact Me" heading here
              Text(
                'Contact Me',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppConstant().themeColor,
                ),
              ),
              const SizedBox(height: 16), // Space between heading and form
              formCard(isNotPhone, fieldSpacing),
            ],
          ),
        );
      },
    );
  }

  Card formCard(bool isNotPhone, double fieldSpacing) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              isNotPhone
                  ? Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            label: 'Your full name',
                            controller: nameController,
                            validator: (v) => (v == null || v.trim().isEmpty)
                                ? 'Required'
                                : null,
                          ),
                        ),
                        SizedBox(width: fieldSpacing),
                        Expanded(
                          child: _buildTextField(
                            label: 'Your email address',
                            controller: _emailCtl,
                            validator: (v) {
                              if (v == null || v.trim().isEmpty) {
                                return 'Required';
                              }
                              final email = v.trim();
                              if (!RegExp(
                                r'^[^@]+@[^@]+\.[^@]+',
                              ).hasMatch(email)) {
                                return 'Invalid email';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        _buildTextField(
                          label: 'Your full name',
                          controller: nameController,
                          validator: (v) => (v == null || v.trim().isEmpty)
                              ? 'Required'
                              : null,
                        ),
                        const SizedBox(height: 18),
                        _buildTextField(
                          label: 'Your email address',
                          controller: _emailCtl,
                          validator: (v) {
                            if (v == null || v.trim().isEmpty) {
                              return 'Required';
                            }
                            final email = v.trim();
                            if (!RegExp(
                              r'^[^@]+@[^@]+\.[^@]+',
                            ).hasMatch(email)) {
                              return 'Invalid email';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
              const SizedBox(height: 28),
              _buildTextField(
                label: 'Your subject',
                controller: _subjectCtl,
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Required' : null,
              ),
              const SizedBox(height: 28),
              _buildTextField(
                label: 'Your message',
                controller: _messageCtl,
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Required' : null,
                maxLines: 8,
              ),
              const SizedBox(height: 28),
              SizedBox(
                height: 50,
                child: Material(
                  color: AppConstant().themeColor,
                  elevation: 6,
                  shadowColor: Colors.black26,
                  borderRadius: BorderRadius.circular(_pillRadius),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(_pillRadius),
                    onTap: _send,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(_pillRadius),
                      ),
                      child: const Text(
                        'SEND MESSAGE',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                          color: Colors.white, // Improved contrast
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
