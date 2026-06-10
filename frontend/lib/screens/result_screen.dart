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
    final bool isCompare =
        result['method'] == 'compare';

    Map<String, dynamic> solution =
        result['result'] ?? {};

    if (isCompare) {
      solution = result['rk4'] ?? {};
    }

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

    Widget graphSection;

    if (isCompare) {
      final euler =
          result['euler'] as Map<String, dynamic>;

      final rk4 =
          result['rk4'] as Map<String, dynamic>;

      graphSection = GraphWidget(
        xValues: euler['x_values'],
        yValues: euler['y_values'],
        secondXValues: rk4['x_values'],
        secondYValues: rk4['y_values'],
      );
    } else {
      graphSection = GraphWidget(
        xValues: xValues,
        yValues: yValues,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
      ),
      body: SingleChildScrollView(
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

            DashboardCard(
              title: 'Solution Graph',
              child: SizedBox(
                height: 300,
                child: graphSection,
              ),
            ),

            if (isCompare)
              Padding(
                padding:
                    const EdgeInsets.only(
                  top: 16,
                  bottom: 8,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration:
                          const BoxDecoration(
                        color: Colors.blue,
                        shape:
                            BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Euler',
                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 32),
                    Container(
                      width: 18,
                      height: 18,
                      decoration:
                          const BoxDecoration(
                        color: Colors.red,
                        shape:
                            BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'RK4',
                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ],
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
                    child: isCompare
                        ? Column(
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                            children: [
                              Text(
                                'Euler Final: ${result['analysis']['euler_final']}',
                              ),
                              const SizedBox(
                                  height: 10),
                              Text(
                                'RK4 Final: ${result['analysis']['rk4_final']}',
                              ),
                              const SizedBox(
                                  height: 10),
                              Text(
                                'Absolute Difference: ${result['analysis']['absolute_difference']}',
                              ),
                              const SizedBox(
                                  height: 10),
                              Text(
                                'Relative Difference: ${result['analysis']['relative_difference_percent']}%',
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                            children: [
                              Text(
                                'Final Value: ${finalValue.toStringAsFixed(6)}',
                              ),
                              const SizedBox(
                                  height: 10),
                              Text(
                                'Total Points: ${xValues.length}',
                              ),
                            ],
                          ),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: DashboardCard(
                    title: 'Step By Step',
                    child: isCompare
                        ? Column(
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                            children: [
                              const Text(
                                'Euler Steps',
                                style: TextStyle(
                                  fontWeight:
                                      FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),

                              const SizedBox(
                                  height: 8),

                              ...((result['euler']
                                              ['steps']
                                          as List)
                                      .take(3))
                                  .map<Widget>(
                                (step) =>
                                    Padding(
                                  padding:
                                      const EdgeInsets
                                          .only(
                                    bottom: 6,
                                  ),
                                  child: Text(
                                    'Step ${step['step']} | x=${step['x']} | y=${step['y']}',
                                  ),
                                ),
                              ),

                              const SizedBox(
                                  height: 16),

                              const Divider(),

                              const SizedBox(
                                  height: 16),

                              const Text(
                                'RK4 Steps',
                                style: TextStyle(
                                  fontWeight:
                                      FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),

                              const SizedBox(
                                  height: 8),

                              ...((result['rk4']
                                              ['steps']
                                          as List)
                                      .take(3))
                                  .map<Widget>(
                                (step) =>
                                    Padding(
                                  padding:
                                      const EdgeInsets
                                          .only(
                                    bottom: 6,
                                  ),
                                  child: Text(
                                    'Step ${step['step']} | x=${step['x']} | y=${step['y']}',
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                            children: steps
                                .take(5)
                                .map<Widget>(
                                  (step) =>
                                      Padding(
                                    padding:
                                        const EdgeInsets
                                            .only(
                                      bottom: 8,
                                    ),
                                    child: Text(
                                      'Step ${step['step']} | x=${step['x']} | y=${step['y']}',
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}