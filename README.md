# task_manager

You will create a Flutter app that manages a task list using StatefulWidget and Firebase Firestore for real-time cloud persistence. Users must be able to add tasks, mark them complete, attach nested subtasks, and delete tasks — all synced live with Firestore so changes appear instantly without a manual refresh.

## Getting Started (Tasks)

Create Flutter project and add firebase_core + cloud_firestore to pubspec.yaml.

Initialize Firebase in main.dart using await Firebase.initializeApp().

Design a Task model with toMap() and fromMap() methods.

Build the base UI: text input, Add button, and ListView.builder task list.

Implement full CRUD: add, stream (read), toggle complete, and delete tasks via Firestore.

Add nested subtask support — each task can have a sub-list of items.

Handle all UX states: loading spinner, empty-list message, input validation.

Write README, complete reflection document, and build APK for submission.

### Features

1. CRUD operations like adding new tasks, seeing tasks update in real time, mark tasks as completed, and deleting tasks.
2. Nested subtasks that helped to toggle other subtasks and delete individual subtasks.

#### Known Limitations

You can't use this for large datasets and the subtasks are stored as arrays.

