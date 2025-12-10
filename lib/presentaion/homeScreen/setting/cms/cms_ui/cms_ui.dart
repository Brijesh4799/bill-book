import 'package:BillBook/core/widgets/custom_app_bar/ui/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import '../provider/cms_provider.dart';
class CmsScreen extends StatelessWidget {
  const CmsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'About Us'),
      body: Column(
        children: [
          ChangeNotifierProvider(
            create: (_) => CmsProvider()..fetchCmsData(),
            child: Consumer<CmsProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (provider.error != null) {
                  return Center(child: Text('Error: ${provider.error}'));
                }
                final cmsData = provider.cmsModel?.cmsData;
                if (cmsData == null) {
                  return const Center(child: Text('No CMS data found.'));
                }
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      InfoTile(
                        title: 'About',
                          value: provider.cmsModel?.cmsData?.aboutUs,
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
class InfoTile extends StatelessWidget {
  final String title;
  final String? value;

  const InfoTile({super.key, required this.title, this.value});

  @override
  Widget build(BuildContext context) {
    if (value == null || value!.trim().isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),

        /// Render HTML instead of plain text
        Html(
          data: value,
          style: {
            "body": Style(
              fontSize: FontSize(16),
              margin: Margins.zero,
            ),
            "p": Style(
              margin: Margins.only(bottom: 6),
            ),
            "ul": Style(
              margin: Margins.only(left: 16, bottom: 6),
            ),
          },
        ),

        const Divider(),
        const SizedBox(height: 10),
      ],
    );
  }
}