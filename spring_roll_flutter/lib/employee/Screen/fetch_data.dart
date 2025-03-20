import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spring_roll_flutter/Authentication/Provider/loadTokenProvider.dart';
import 'package:spring_roll_flutter/Authentication/Screen/loginScreen.dart';
import 'package:spring_roll_flutter/Theme/theme_data.dart';
import 'package:spring_roll_flutter/Theme/theme_provider.dart';
import 'package:spring_roll_flutter/Wallet/Screen/fun_transfer_screen.dart';
import 'package:spring_roll_flutter/employee/Provider/add_employee_provider.dart';
import 'package:spring_roll_flutter/employee/Model/data_model.dart';
import 'package:spring_roll_flutter/employee/Provider/delete_employee_provider.dart';
import 'package:spring_roll_flutter/employee/Provider/edit_employee_provider.dart';
import 'package:spring_roll_flutter/employee/Provider/fetch_provider.dart';
import 'package:spring_roll_flutter/Utils/toast_utils.dart';

class EmployeeApp extends ConsumerStatefulWidget {
  @override
  ConsumerState<EmployeeApp> createState() => _EmployeeAppState();
}

class _EmployeeAppState extends ConsumerState<EmployeeApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(employeeProvider.notifier).getEmployeeData();
    });
  }

  Future<void> _logout(BuildContext context) async {
    // ref.read(tokenProvider.notifier).deleteToken();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: themeMode,
      home: EmployeeListScreen(logoutCallback: _logout),
    );
  }
}

class EmployeeListScreen extends ConsumerStatefulWidget {
  final Function(BuildContext) logoutCallback;

  EmployeeListScreen({required this.logoutCallback});

  @override
  ConsumerState<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends ConsumerState<EmployeeListScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String phone = '';

  @override
  Widget build(BuildContext context) {
    ref.listen(addEmployeeProvider, (prev, next) {
      next.maybeWhen(
        orElse: () {},
        success: (data) {
          ToastUtils().showSuccessToast(context, "Employee added successfully");
          ref.read(employeeProvider.notifier).getEmployeeData();
        },
        error: (e) {
          ToastUtils().showErrorToast(context, "Failed to add employee");
        },
      );
    });
    ref.listen(deleteEmployeeProvider, (prev, next) {
      next.maybeWhen(
        orElse: () {},
        success: (data) {
          ToastUtils()
              .showSuccessToast(context, "Employee Deleted successfully");
          ref.read(employeeProvider.notifier).getEmployeeData();
        },
        error: (e) {
          ToastUtils().showErrorToast(context, "Failed to delete employee");
        },
      );
    });
    ref.listen(editEmployeeProvider, (prev, next) {
      next.maybeWhen(
        orElse: () {},
        success: (data) {
          ToastUtils()
              .showSuccessToast(context, "Employee Edited successfully");
          ref.read(employeeProvider.notifier).getEmployeeData();
        },
        error: (e) {
          ToastUtils().showErrorToast(context, "Failed to edited employee");
        },
      );
    });

    final employees = ref.watch(employeeProvider);
    final themeMode = ref.watch(themeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee List"),
        actions: [
          IconButton(
            icon: Icon(themeMode == ThemeMode.dark
                ? Icons.light_mode
                : Icons.dark_mode),
            onPressed: () {
              ref.read(themeProvider.notifier).toggleTheme();
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => widget.logoutCallback(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildTextField("Name", (value) => name = value!),
                  _buildTextField("Email", (value) => email = value!,
                      validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !RegExp(r"[^@]+@[a-zA-Z]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  }),
                  _buildTextField("Phone", (value) => phone = value!),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        ref
                            .read(addEmployeeProvider.notifier)
                            .addEmployeeData(name, email, phone);
                      }
                    },
                    child: Text('Add Employee'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TransferForm(), // The screen you want to navigate to
                        ),
                      );
                      // if (_formKey.currentState!.validate()) {
                      //   _formKey.currentState!.save();
                      //   ref
                      //       .read(addEmployeeProvider.notifier)
                      //       .addEmployeeData(name, email, phone);
                      // }
                    },
                    child: Text('Fund Transfer'),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: employees.maybeWhen(
              orElse: () => Center(child: CircularProgressIndicator()),
              success: (datas) => ListView.builder(
                itemCount: datas?.length,
                itemBuilder: (context, index) {
                  final employee = datas?[index];

                  return Dismissible(
                    key: Key(employee!.id.toString()),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    confirmDismiss: (direction) async {
                      return await _showDeleteConfirmation(context, employee);
                    },
                    onDismissed: (direction) {
                      ref
                          .read(deleteEmployeeProvider.notifier)
                          .deleteEmployee(employee.id);
                      ToastUtils()
                          .showSuccessToast(context, "Employee deleted");
                    },
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[700],
                          child: Text(employee.id.toString(),
                              style: TextStyle(color: Colors.white)),
                        ),
                        title: Text(employee.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Email: ${employee.email}",
                                style: TextStyle(color: Colors.grey[300])),
                            Text("Phone: ${employee.phone}",
                                style: TextStyle(color: Colors.grey[300])),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.edit, color: Colors.white),
                          onPressed: () => _showEditDialog(context, employee),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, Function(String?) onSaved,
      {String? Function(String?)? validator}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        decoration: InputDecoration(labelText: label),
        onSaved: onSaved,
        validator:
            validator ?? (value) => value!.isEmpty ? 'Enter a $label' : null,
      ),
    );
  }

  Future<bool?> _showDeleteConfirmation(
      BuildContext context, DataModel employee) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text("Confirm Delete", style: TextStyle(color: Colors.white)),
        content: Text("Are you sure you want to delete ${employee.name}?",
            style: TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text("Cancel", style: TextStyle(color: Colors.white70)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text("Delete", style: TextStyle(color: Colors.redAccent)),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(BuildContext context, DataModel employee) {
    TextEditingController nameController =
        TextEditingController(text: employee.name);
    TextEditingController emailController =
        TextEditingController(text: employee.email);
    TextEditingController phoneController =
        TextEditingController(text: employee.phone);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Employee"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Name")),
            TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email")),
            TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: "Phone")),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              ref.read(editEmployeeProvider.notifier).editEmployeeData(
                    employee.id,
                    nameController.text,
                    emailController.text,
                    phoneController.text,
                  );
              Navigator.pop(context);
              ToastUtils().showSuccessToast(context, "Employee updated");
            },
            child: Text("Save", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }

 
}
