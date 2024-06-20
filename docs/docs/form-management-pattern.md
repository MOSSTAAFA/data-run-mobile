---
title: Getting Started
slug: /getting-started
---

## Form Management Pattern

This document describes the design pattern used to manage forms within the Flutter application. This pattern promotes separation of concerns, improves maintainability, and simplifies the development process for complex forms.

### Core Concepts

The form management pattern relies on several key components:

* **FieldInputModel:** This class represents a single field in the form. It encapsulates properties like field type (text, dropdown, etc.), current value, error state, a mandatory flag indicating if the field is required, and other relevant information for formatting and behavior.

* **FormInputFieldIntent:** This class defines various events that can occur within a form field. Examples include text changes, focus changes, and save actions. Fields emit these intents to communicate with the form logic, decoupling UI interactions from the underlying logic.

* **FormViewModelNotifier:** This state management class listens for `FormInputFieldIntent` objects emitted by the fields. It acts as the coordinator, processing the intents, updating the form state accordingly (e.g., validating user input, setting error messages), and triggering UI updates (e.g., highlighting an error field).

* **RowAction and StoreResult:** These classes work hand-in-hand to manage actions and their outcomes. `RowAction` represents the action triggered by an intent and the result of processing it. It includes information like the field ID, action type (e.g., save, clear), value (optional, for some actions), error (if validation fails), and value type. `StoreResult` represents the outcome of saving or updating form data. It contains details like the field ID and any error messages encountered during the process.

* **FormRepository:** This class acts as the central point of control for the form. It handles various form-related tasks, including:
    * Fetching initial data for the form from relevant data providers.
    * Composing the final list of fields, incorporating errors, focus states, and other relevant information for the UI to render.
    * Performing data integrity checks to ensure the validity of form data before submission.
    * Interacting with data storage services (like `DataEntryRepository`) to persist the form data upon successful submission.

### Communication Flow

The form management pattern follows an event-driven approach:

1. **User Interaction:** When a user interacts with a form field (e.g., typing text, selecting an option), the field emits a corresponding `FormInputFieldIntent` object.
2. **Intent Processing:** The `FormViewModelNotifier` listens for these intents. Based on the intent type, it performs necessary actions like validating user input, updating field state in `FieldInputModel`, and potentially interacting with the `FormRepository`. Validation logic might reside elsewhere in the codebase and be called upon by the `FormViewModelNotifier` as needed.
3. **State Updates:** The `FormViewModelNotifier` updates the state of the form based on the processing results. This might involve setting error messages in the `FieldInputModel` for display, updating field values, or triggering UI updates (e.g., focus changes).
4. **FormRepository Interaction:** The `FormRepository` can be involved in various scenarios:
    * Fetching initial data for the form on creation.
    * Saving form data upon submission, potentially interacting with data storage services.
    * Running data integrity checks before submission to ensure data validity.

### Benefits

* **Separation of Concerns:** This pattern separates UI logic from form logic, promoting code maintainability and reusability. UI components are responsible for rendering the form and handling user interactions, while the form logic (validation, data processing) resides in the `FormViewModelNotifier` and `FormRepository`.
* **Event-Driven Architecture:** Events (intents) drive state changes, making the code more reactive and easier to reason about. The code responds to user interactions and internal form events, resulting in a more predictable and testable codebase.
* **Centralized Logic:** The `FormRepository` encapsulates core form functionalities like data fetching, saving, and integrity checks, simplifying logic management and reducing code duplication.
* **Improved Testability:** Individual components like `FieldInputModel` and `FormViewModelNotifier` can be easily unit tested in isolation, promoting code quality and maintainability.

### FormViewModelNotifier 

**1. Class Responsibilities:**

- Fetches initial form data from the `FormRepository` (`build`).
- Listens for user interactions through `FormInputFieldIntent` objects (`build`).
- Processes user interactions by:
    - Validating user input (`_checkFieldError`).
    - Updating form state (`_displayResult`).
    - Saving data to the repository (`_processUserAction`).
    - Performing calculations based on form data (`processCalculatedItems`).
- Manages focus state (`_createRowActionFromIntent`).
- Runs data integrity checks (`runDataIntegrityCheck`).
- Provides helper methods for saving and discarding changes (`saveDataEntry`, `discardChanges`).

**2. Key Interactions:**

- The class listens for `FormInputFieldIntent` events emitted from UI components representing form fields.
- These events trigger corresponding methods in `FormViewModelNotifier` to handle user interactions.
- The class interacts with the `FormRepository` for data fetching, saving, and integrity checks.
- It updates the form state based on processing results and triggers UI updates.

**3. Implementation Details:**

- `_createRowActionFromIntent` translates `FormInputFieldIntent` objects into `RowAction` objects containing relevant information like field ID, value, and action type (save, clear, etc.).
- `_processUserAction` handles different `RowAction` types, performing actions like saving data, updating error states, and notifying the repository about changes.
- `_checkFieldError` validates user input based on field type and configured validation rules.
- `_displayResult` updates the form state based on the processing outcome (e.g., successful save, validation errors).
