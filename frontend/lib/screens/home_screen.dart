import 'package:flutter/material.dart';
import '../widgets/input_field_widget.dart';
import '../widgets/method_card_widget.dart';
import 'result_screen.dart';
import '../services/ode_api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();

  String selectedMethod = 'Euler';

  final TextEditingController equationController =
      TextEditingController();

  final TextEditingController x0Controller =
      TextEditingController();

  final TextEditingController y0Controller =
      TextEditingController();

  final TextEditingController hController =
      TextEditingController();

  final TextEditingController xEndController =
      TextEditingController();

  @override
  void dispose() {
    equationController.dispose();
    x0Controller.dispose();
    y0Controller.dispose();
    hController.dispose();
    xEndController.dispose();
    super.dispose();
  }

 Future<void> solveEquation() async {
  if (!_formKey.currentState!.validate()) {
    return;
  }

  try {
    final result = await OdeApiService().solve(
      equation: equationController.text,
      x0: double.parse(x0Controller.text),
      y0: double.parse(y0Controller.text),
      h: double.parse(hController.text),
      xEnd: double.parse(xEndController.text),
      method: selectedMethod,
    );

  print('FULL RESULT = $result');
print('INNER RESULT = ${result['result']}');

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ResultScreen(
          result: result,
        ),
      ),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error: $e'),
      ),
    );
  }
}

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ODE Platform'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Interactive Differential Equation Solver',
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(height: 32),

              const Text(
                'Method Selection',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  MethodCardWidget(
                    title: 'Euler',
                    isSelected: selectedMethod == 'Euler',
                    onTap: () {
                      setState(() {
                        selectedMethod = 'Euler';
                      });
                    },
                  ),

                  const SizedBox(width: 12),

                  MethodCardWidget(
                    title: 'RK4',
                    isSelected: selectedMethod == 'RK4',
                    onTap: () {
                      setState(() {
                        selectedMethod = 'RK4';
                      });
                    },
                  ),

                  const SizedBox(width: 12),

                  MethodCardWidget(
                    title: 'Compare',
                    isSelected: selectedMethod == 'Compare',
                    onTap: () {
                      setState(() {
                        selectedMethod = 'Compare';
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 32),

              InputFieldWidget(
                label: 'Differential Equation',
                hintText: 'Example: x + y',
                controller: equationController,
              ),

              const SizedBox(height: 20),

              InputFieldWidget(
                label: 'Initial x₀',
                hintText: 'Enter x₀',
                controller: x0Controller,
              ),

              const SizedBox(height: 20),

              InputFieldWidget(
                label: 'Initial y₀',
                hintText: 'Enter y₀',
                controller: y0Controller,
              ),

              const SizedBox(height: 20),

              InputFieldWidget(
                label: 'Step Size (h)',
                hintText: 'Enter step size',
                controller: hController,
              ),

              const SizedBox(height: 20),

              InputFieldWidget(
                label: 'x_end',
                hintText: 'Enter x_end',
                controller: xEndController,
              ),

              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: solveEquation,
                  child: const Text(
                    'Solve',
                    style: TextStyle(
                      fontSize: 16,
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