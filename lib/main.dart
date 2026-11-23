
import 'package:flutter/material.dart';

void main() {
  runApp(const EvaApp());
}

class EvaApp extends StatelessWidget {
  const EvaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EVA AI',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF080D18),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00D9FF),
        ),
      ),
      home: const EvaHome(),
    );
  }
}

class EvaHome extends StatefulWidget {
  const EvaHome({super.key});

  @override
  State<EvaHome> createState() => _EvaHomeState();
}

class _EvaHomeState extends State<EvaHome> {
  final TextEditingController controller =
      TextEditingController();

  final List<String> messages = [
    'Merhaba! Ben EVA. Sana nasıl yardımcı olabilirim?'
  ];

  void sendMessage() {
    final text = controller.text.trim();

    if (text.isEmpty) return;

    setState(() {
      messages.add('Sen: $text');
      messages.add(
        'EVA: Mesajını aldım. Yapay zekâ bağlantım '
        'kurulduğunda sana yardımcı olacağım.'
      );
      controller.clear();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF101A2B),
        title: const Text(
          'EVA AI',
          style: TextStyle(
            color: Color(0xFF00D9FF),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.auto_awesome,
          color: Color(0xFF00D9FF),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.circle,
              color: Colors.greenAccent,
              size: 12,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 25),
          Container(
            width: 145,
            height: 145,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const RadialGradient(
                colors: [
                  Color(0xFF00D9FF),
                  Color(0xFF123C70),
                  Color(0xFF080D18),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyan.withOpacity(0.3),
                  blurRadius: 35,
                  spreadRadius: 8,
                ),
              ],
            ),
            child: const Icon(
              Icons.graphic_eq,
              size: 65,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'MERHABA, BEN EVA',
            style: TextStyle(
              color: Color(0xFF00D9FF),
              fontSize: 21,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          const Text(
            'Kişisel yapay zekâ asistanın',
            style: TextStyle(color: Colors.white54),
          ),
          const SizedBox(height: 25),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xFF142238),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.cyan.withOpacity(0.2),
                    ),
                  ),
                  child: Text(
                    messages[index],
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    onSubmitted: (_) => sendMessage(),
                    decoration: InputDecoration(
                      hintText: 'EVA’ya bir şey sor...',
                      filled: true,
                      fillColor: const Color(0xFF142238),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: sendMessage,
                  icon: const Icon(
                    Icons.send,
                    color: Color(0xFF00D9FF),
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.mic,
                    color: Color(0xFF00D9FF),
                    size: 30,
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
