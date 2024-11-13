import 'package:master_plan/provider/plan_provider.dart';
import '../models/data_layer.dart';
import 'package:flutter/material.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan;
  const PlanScreen({super.key, required this.plan});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;
  Plan get plan => widget.plan;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(plan.name)),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: plansNotifier,
        builder: (context, plans, child) {
          Plan currentPlan = plans.firstWhere((p) => p.name == plan.name);
          return Column(
            children: [
              Expanded(child: _buildList(currentPlan)),
              SafeArea(child: Text(currentPlan.completenessMessage)),
            ],
          );
        },
      ),
      floatingActionButton: _buildAddTaskButton(context, plansNotifier),
    );
  }

  Widget _buildAddTaskButton(
      BuildContext context, ValueNotifier<List<Plan>> planNotifier) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        int planIndex =
            planNotifier.value.indexWhere((p) => p.name == plan.name);

        if (planIndex != -1) {
          // Preserve the current tasks and add a new one
          List<Task> updatedTasks =
              List<Task>.from(planNotifier.value[planIndex].tasks)..add(Task());

          // Create a new list of plans with the updated tasks
          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(
              name: plan.name,
              tasks: updatedTasks,
            );
        }
      },
    );
  }

  Widget _buildList(Plan plan) {
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(plan.tasks[index], index, context),
    );
  }

  Widget _buildTaskTile(Task task, int index, BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);

    Plan? currentPlan = planNotifier.value.firstWhere(
      (p) => p.name == plan.name,
      orElse: () => Plan(name: '', tasks: []),
    );

    if (index < 0 || index >= currentPlan.tasks.length) {
      return const ListTile(
        title: Text("Task not found"),
      );
    }

    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          int planIndex =
              planNotifier.value.indexWhere((p) => p.name == plan.name);

          if (planIndex != -1) {
            // Update the specific task's completion status
            List<Task> updatedTasks = List<Task>.from(currentPlan.tasks)
              ..[index] = Task(
                description: task.description,
                complete: selected ?? false,
              );

            // Update the list of plans with modified task list
            planNotifier.value = List<Plan>.from(planNotifier.value)
              ..[planIndex] = Plan(
                name: currentPlan.name,
                tasks: updatedTasks,
              );
          }
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          int planIndex =
              planNotifier.value.indexWhere((p) => p.name == plan.name);

          if (planIndex != -1) {
            List<Task> updatedTasks = List<Task>.from(currentPlan.tasks)
              ..[index] = Task(
                description: text,
                complete: task.complete,
              );

            planNotifier.value = List<Plan>.from(planNotifier.value)
              ..[planIndex] = Plan(
                name: currentPlan.name,
                tasks: updatedTasks,
              );
          }
        },
      ),
    );
  }
}
