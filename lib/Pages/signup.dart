import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import './login.dart';
import 'package:choice/choice.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  List<String> tags = [];
  List<String> dopeydoses = [
    'Fluoxetine',
    'Sertraline',
    'Escitalopram',
    'Citalopram',
    'Paroxetine',
    'Venlafaxine',
    'Duloxetine',
    'Bupropion',
    'Mirtazapine',
    'Trazodone',
    'Amitriptyline',
    'Nortriptyline',
    'Imipramine',
    'Desipramine',
    'Maprotiline',
    'Trimipramine',
    'Clomipramine',
    'Doxepin',
    'Amoxapine',
    'Vilazodone',
    'Vortioxetine',
    'Tranylcypromine',
    'Isocarboxazid',
    'Phenelzine',
    'Selegiline',
    'Moclobemide'
  ];
  String _selectedGender = 'male';
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
        resizeToAvoidBottomInset: false,
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xFFff486d),
            Color(0xFFff6181),
            Color(0xFFff6181),
          ],
        ),
        body: PageView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/heart.png'),
                height: 150,
                width: 150,
              ),
              const Text(
                "MedMate",
                style: TextStyle(fontSize: 70.0, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter your username',
                    hintStyle: const TextStyle(
                      color: Colors.white60,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white24),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white38),
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle: const TextStyle(
                      color: Colors.white60,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white24),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white38),
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    hintStyle: const TextStyle(
                      color: Colors.white60,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white24),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white38),
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<String>(
                    value: 'male',
                    fillColor: const MaterialStatePropertyAll(Colors.white),
                    activeColor: Colors.white,
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    },
                  ),
                  const Text(
                    'Male',
                    style: TextStyle(color: Colors.white),
                  ),
                  Radio<String>(
                    value: 'female',
                    fillColor: const MaterialStatePropertyAll(Colors.white),
                    activeColor: Colors.white,
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    },
                  ),
                  const Text(
                    'Female',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Select your dopey doses",
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    "Set your bio",
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(
                    width: 35,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: StatefulBuilder(
                              builder: (context, setState) {
                                return InlineChoice<String>.multiple(
                                  clearable: true,
                                  value: tags,
                                  onChanged: (val) =>
                                      setState(() => tags = val),
                                  itemCount: dopeydoses.length,
                                  itemBuilder: (state, i) {
                                    return ChoiceChip(
                                      selected: state.selected(dopeydoses[i]),
                                      onSelected:
                                          state.onSelected(dopeydoses[i]),
                                      label: Text(dopeydoses[i]),
                                    );
                                  },
                                  listBuilder: ChoiceList.createWrapped(
                                    spacing: 10,
                                    runSpacing: 10,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 25,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                    child: const Text("Choose"),
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: StatefulBuilder(
                              builder: (context, setState) {
                                return const TextField(
                                  maxLines: 8,
                                  maxLength: 300,
                                  decoration: InputDecoration(
                                      hintText:
                                          "Write all you want, you ain't getting any right swipes"),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                    child: const Text("Write"),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButtonTheme(
                    data: ElevatedButtonThemeData(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 17),
                        ),
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                      child: const Text(
                        "Login",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFFff6181)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButtonTheme(
                    data: ElevatedButtonThemeData(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 17),
                        ),
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Signup",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFFff6181)),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ]));
  }
}
