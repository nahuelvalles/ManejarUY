import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class AjustesScreen extends StatefulWidget {
  const AjustesScreen({super.key});

  @override
  State<AjustesScreen> createState() => _AjustesScreenState();
}

class _AjustesScreenState extends State<AjustesScreen> {
  PackageInfo? _info;

  @override
  void initState() {
    super.initState();
    _loadInfo();
  }

  Future<void> _loadInfo() async {
    final info = await PackageInfo.fromPlatform();
    if (!mounted) return;
    setState(() => _info = info);
  }

  Future<void> _openEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: 'moccatdev@gmail.com',
      // Si querés prellenar asunto/cuerpo, descomentá:
      // queryParameters: {
      //   'subject': 'Consulta sobre ManejarUY',
      //   'body': 'Hola! Tengo una consulta sobre la app ManejarUY:\n\n',
      // },
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No se pudo abrir la app de correo.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final versionText = _info == null
        ? 'Cargando...'
        : '${_info!.version} (${_info!.buildNumber})';

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: const Text(
          'Ajustes',
          style: TextStyle(color: AppColors.text, fontWeight: FontWeight.w800),
        ),
        iconTheme: const IconThemeData(color: AppColors.text),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
        children: [
          _SectionTitle('Información'),
          const SizedBox(height: 8),
          _Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _RowLabelValue(
                  icon: Icons.info_outline_rounded,
                  label: 'Versión',
                ),
                const SizedBox(height: 10),
                Text(
                  versionText,
                  style: const TextStyle(
                    color: AppColors.text,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 14),
                const Divider(height: 1, color: AppColors.border),
                const SizedBox(height: 14),

                _RowLabelValue(
                  icon: Icons.email_outlined,
                  label: 'Contacto',
                  valueWidget: InkWell(
                    onTap: _openEmail,
                    child: const Text(
                      'moccatdev@gmail.com',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.accent,
                        fontSize: 13.5,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                const _RowLabelValue(
                  icon: Icons.shield_outlined,
                  label: 'Uso',
                  value: 'Educativo',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          _SectionTitle('Aviso legal'),
          const SizedBox(height: 8),
          _Card(
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _RowLabelValue(icon: Icons.gavel_outlined, label: 'Disclaimer'),
                SizedBox(height: 10),
                Text(
                  'ManejarUY es una aplicación educativa independiente.\n\n'
                  'No es una aplicación oficial del Estado Uruguayo, de las Intendencias Departamentales ni de UNASEV.\n\n'
                  'El uso de esta aplicación no garantiza la aprobación del examen teórico de conducción.',
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: 14.5,
                    height: 1.35,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          _SectionTitle('Apariencia'),
          const SizedBox(height: 8),
          _Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _RowLabelValue(
                  icon: Icons.dark_mode_outlined,
                  label: 'Modo oscuro',
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Próximamente',
                        style: TextStyle(
                          color: Color(0xFF6C7684),
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Switch(
                      value: false,
                      onChanged: null, // deshabilitado (convencional)
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  'Estamos trabajando para incluir modo claro/oscuro.',
                  style: TextStyle(
                    color: Color(0xFF6C7684),
                    fontSize: 13,
                    height: 1.25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _SectionTitle('Acerca de'),
          const SizedBox(height: 8),
          _Card(
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _InfoBlock(
                  icon: Icons.traffic_outlined,
                  title: 'Objetivo',
                  description:
                      'Practicar para el examen teórico de conducción en Uruguay.',
                ),
                SizedBox(height: 14),
                _InfoBlock(
                  icon: Icons.description_outlined,
                  title: 'Material',
                  description:
                      'Basado en información pública de educación vial, utilizada con fines educativos.',
                ),
                SizedBox(height: 16),
                Divider(height: 1, color: AppColors.border),
                SizedBox(height: 12),
                Text(
                  '© 2026 Moccat. Contenido educativo independiente.',
                  style: TextStyle(
                    color: Color(0xFF6C7684),
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: const TextStyle(
        color: Color(0xFF6C7684),
        fontSize: 12.5,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.6,
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(padding: const EdgeInsets.all(14), child: child),
    );
  }
}

class _RowLabelValue extends StatelessWidget {
  const _RowLabelValue({
    required this.icon,
    required this.label,
    this.value,
    this.valueWidget,
  });

  final IconData icon;
  final String label;
  final String? value;
  final Widget? valueWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.accent, size: 20),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              color: AppColors.text,
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        if (valueWidget != null)
          Flexible(child: valueWidget!)
        else if (value != null)
          Flexible(
            child: Text(
              value!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Color(0xFF6C7684),
                fontSize: 13.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}

class _InfoBlock extends StatelessWidget {
  const _InfoBlock({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: AppColors.accent, size: 20),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                color: AppColors.text,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(
            color: Color(0xFF6C7684),
            fontSize: 14,
            height: 1.35,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
