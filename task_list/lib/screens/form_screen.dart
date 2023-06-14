import 'package:flutter/material.dart';
import 'package:task_list/data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key, required this.taskContext}) : super(key: key);

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  bool difficultyValidator(String? value) {
    if (value != null && value.isEmpty) {
      if (int.parse(value) > 5 || int.parse(value) < 1) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Adicionar tarefa"),
          leading: const Icon(Icons.arrow_back),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black12,
                  border: Border.all(width: 3),
                  borderRadius: BorderRadius.circular(10)),
              height: 650,
              width: 375,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (valueValidator(value)) {
                          return 'Insira o nome da tarefa';
                        }
                        return null;
                      },
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.white70,
                        filled: true,
                        hintText: 'Nome',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (difficultyValidator(value)) {
                          return 'Coloque uma dificuldade entre 1 e 5';
                        }
                        return null;
                      },
                      controller: difficultyController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.white70,
                        filled: true,
                        hintText: 'Dificuldade',
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (valueValidator(value)) {
                          return 'Insira uma URL de';
                        }
                        return null;
                      },
                      onChanged: (text) {
                        setState(() {});
                      },
                      controller: imageController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.white70,
                        filled: true,
                        hintText: 'Imagem',
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.url,
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.blue),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageController.text,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return const Icon(Icons.no_photography_outlined);
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        TaskInherited.of(widget.taskContext)!.newTask(
                            nameController.text,
                            imageController.text,
                            int.parse(difficultyController.text));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Salvando nova tarefa'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Adicionar"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
