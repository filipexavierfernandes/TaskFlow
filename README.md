# TaskFlow - Task Manager iOS App

**TaskFlow** is a simple, yet powerful task manager built for iOS, showcasing my proficiency with advanced iOS architectures, such as VIPER, Clean Swift, and MVVM-C. This project leverages SwiftUI and Combine for modern, declarative UI components and reactive data handling.

## Features
- **Task Management**: Add, edit, and track tasks easily.
- **State Management**: Utilizes Combine for reactive programming, managing complex state transitions.
- **Navigation**: Uses the Coordinator pattern for seamless and scalable navigation flows.
- **Architecture**: Built with VIPER (or Clean Swift), ensuring scalability and separation of concerns.

## Technologies Used
- **Swift**: The main language used for development.
- **SwiftUI**: The framework for building the user interface in a declarative way.
- **Combine**: For handling asynchronous events and data streams.
- **VIPER/Clean Swift**: For scalable, testable architecture.
- **Coordinator Pattern**: For managing navigation flow and reducing view controller dependencies.

## How to Run
1. Clone the repository:
    ```bash
    git clone https://github.com/filipexavierfernandes/TaskFlow.git
    ```
2. Open the project in Xcode.
3. Run the app on the simulator or a connected device.

## Structure
The project is divided into the following modules:
- **Models**: Contains the task model and data storage logic (e.g., CoreData or UserDefaults).
- **ViewModels/Presenters**: Manages data flow between views and models.
- **Views**: Built with SwiftUI for a modern, responsive UI.
- **Coordinators**: Responsible for managing the navigation flow.
- **Services**: Handles network requests, persistence, etc.

## Future Improvements
- Integrate with external APIs for task synchronization across devices.
- Implement additional features such as task categorization or due dates.
- Enhance testing coverage with more unit and UI tests.

## Contributing
Feel free to fork the repository and submit pull requests. If you find any bugs or issues, please report them using GitHub issues.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Screenshots (Optional)
Include images of the app’s UI here, once you have them available.
