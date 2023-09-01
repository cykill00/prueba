import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  const SnackBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Snacksbar y Dialogos'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton.tonal(
                  onPressed: () {
                    showAboutDialog(context: context, children: [
                      const Text(
                          'Do occaecat culpa culpa aliqua tempor incididunt minim enim fugiat. Reprehenderit minim ut culpa ipsum tempor non est cillum. Qui aliqua dolor eu aliqua nisi nisi elit minim dolore elit. Reprehenderit sunt esse enim tempor do et ullamco adipisicing amet excepteur eiusmod. Mollit non quis incididunt velit nostrud ad ut consequat anim esse. Aliquip consectetur ut reprehenderit aliquip deserunt excepteur.')
                    ]);
                  },
                  child: const Text('Licencias usadas')),
              FilledButton.tonal(
                  onPressed: () => openDialog(context),
                  child: const Text('Mostrar dialogo'))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            label: const Text('Mostrar Snackbar'),
            icon: const Icon(Icons.remove_red_eye_outlined),
            onPressed: () => showCustomSnackBar(context)));
  }

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola Pepe'),
      action: SnackBarAction(label: 'Ok', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro'),
        content: const Text('Dolor cupidatat mollit Lorem adipisicing ullamco proident. Qui officia ad quis consectetur tempor in non excepteur irure. Fugiat nisi amet adipisicing quis qui Lorem exercitation consectetur fugiat occaecat. Cupidatat nostrud non exercitation pariatur occaecat enim dolor magna aute.'),
        actions: [
          TextButton(onPressed: ()=> context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: ()=> context.pop(), child: const Text('Aceptar')),
        ],
        
      ),
    );
  }
}
