import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GlobalKey<FormState> keyForForm = GlobalKey<FormState>();
  final firstController = TextEditingController();
  String contentsTextFormField2 = "";

  @override
  void dispose() {
    firstController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form and TextFormField"),
        centerTitle: true,
        leading: const Icon(Icons.account_tree, color: Colors.white),
        backgroundColor: Colors.lime,
      ),
      body: Form(
        key: keyForForm,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                validator: (newValue) {
                  if (newValue!.contains("@")) {
                    return "Remove @";
                  }
                  return null;
                },
                controller: firstController,
                minLines: 2,
                maxLines: 4,
                decoration: const InputDecoration(
                    prefix: Icon(
                      Icons.add_circle,
                      color: Colors.yellow,
                    ),

                    suffixIcon: Icon(Icons.add),
                    suffixIconColor: Colors.limeAccent,
                    icon: Icon(Icons.add_box),
                    iconColor: Colors.blue,
                    labelText: "labeltext",
                    labelStyle: TextStyle(color: Colors.teal),
                    hintText: "hinttext for TextFormField 1",
                    hintStyle: TextStyle(color: Colors.red),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      borderSide: BorderSide(width:2,color: Colors.red),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      borderSide: BorderSide(color: Colors.black45),
                    )),

              ),
              Container(
                height: 20,
              ),
              TextFormField(
                onChanged: (newValue) {
                  setState(() {
                    contentsTextFormField2 = newValue;
                  });
                },
                keyboardType: TextInputType.number,
                maxLength: 20,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.black12,
                    prefix: Icon(
                      Icons.add_box_outlined,
                      color: Colors.deepOrange,
                    ),
                    hintText: "hinttext for TextFormField 2",
                    hintStyle: TextStyle(color: Colors.green),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      borderSide: BorderSide(color: Colors.pink),
                    )),
                validator: (newValue) {
                  if (newValue!.contains("X")) {
                    return "delete X";
                  }
                  return null;
                },
              ),
              Container(
                height: 20,
              ),
              Text(
                " $contentsTextFormField2",
                style: const TextStyle(color: Colors.deepOrange, fontSize: 25),
              ),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[400],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 23),
                    elevation: 25,
                    shape: const BeveledRectangleBorder(),
                    side: const BorderSide(width: 5, color: Colors.green),
                    shadowColor: Colors.grey,
                  ),
                  onLongPress: (){
                    if (keyForForm.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(" ${firstController.text}")));
                    }
                  },
                  onPressed: () {
                    if (keyForForm.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(" ${firstController.text}")));
                    }
                  },
                  icon: const Icon(Icons.check),
                  label: const Text("(Example) Validates every FormField"))
            ],
          ),
        ),
      ),
    );
  }
}
