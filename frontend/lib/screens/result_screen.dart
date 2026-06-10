import 'package:flutter/material.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/graph_widget.dart';

class ResultScreen extends StatelessWidget {
  final Map<String, dynamic> result;

  const ResultScreen({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
  final Map<String, dynamic> solution =
    result['rk4'] ??
    result['euler'] ??
    result['result'] ??
    {};

final List<dynamic> xValues =
    solution['x_values'] ?? [];

final List<dynamic> yValues =
    solution['y_values'] ?? [];

final List<dynamic> steps =
    solution['steps'] ?? [];

    final double finalValue =
        yValues.isNotEmpty
            ? (yValues.last as num).toDouble()
            : 0;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(24),
                  gradient:
                      const LinearGradient(
                    colors: [
                      Color(0xFF4F46E5),
                      Color(0xFF7C3AED),
                    ],
                  ),
                ),
                child: const Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ODE Analysis Results',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Numerical Solution',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const DashboardCard(
                title: 'Solution Graph',
                child: SizedBox(
                  height: 300,
                  child: GraphWidget(),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: DashboardCard(
                      title: 'Analysis',
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Final Value: ${finalValue.toStringAsFixed(6)}',
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Total Points: ${xValues.length}',
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Method Result Loaded',
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: DashboardCard(
                      title: 'Step By Step',
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children:
                            steps.take(5).map<Widget>((step) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(
                              bottom: 8,
                            ),
                            child: Text(
                              'Step ${step['step']} | '
                              'x=${step['x']} | '
                              'y=${step['y']}',
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}