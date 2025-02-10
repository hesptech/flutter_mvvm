# flutter_mvvm


 

----------------------------------

Software architecture is the set of decisions that we make before we start coding and that will be hard to change after.

MVVM Architectural pattern
Separation of Concerns, testability, reusability, scalability and Maintenance
understand, test, and evolve
flexibility and reusability of code and the ability to test each component independently.
more maintainable, larger projects or planning long-term development, Easy State Management, Clean Codebase
redundant at times?...


- MODEL: 
This is the data layer, responsible for holding data and interacting with external sources like databases or APIs.
The Model is just everything else. Entities, Domain objects, Value objects, Services, Repositories, and local and remote databases all belong to the Model.
- VIEW: 
This represents the UI components in Flutter. 
It’s the part the user interacts with, such as buttons, text fields, and other visual elements.
- VIEW-MODEL: 
This layer acts as a mediator between the Model and the View. 
It holds the logic and prepares data for display, making sure that the View remains free from business logic.
The ViewModel or Controller (those words are synonyms, amen) manages the state and connects the View to the Model.


----------------------------------
TYPES of Folders Structure options

1. FEATURE-first
          home
              home_view_model.dart
              home_screen.dart
     
          login
               login_view_model.dart     
               login_screen.dart
    
          signup
                signup_view_model.dart             
                signup_screen.dart
                
2. LAYER-first
model
     auth
         auth_service.dart

view_model
          home
              home_view_model.dart
          login
               login_view_model.dart
          signup
                signup_view_model.dart

view 
     home  
          home_screen.dart
     login
          login_screen.dart
     signup
           signup_screen.dart

lib/
├── models/
│   └── weather_model.dart
├── viewmodels/
│   └── weather_viewmodel.dart
├── views/
│   └── weather_screen.dart

2. HYBRID
model
     auth
         auth_service.dart           
view 
     home  
          home_screen.dart
          home_view_model.dart
     login
          login_screen.dart   
          login_view_model.dart      
     signup
           signup_screen.dart       
           signup_view_model.dart


-----------------------------------
TESTING
Model can be tested with unit tests, 

The View and ViewModel can be tested with integration tests
Additionally, the ViewModel can be tested with mock objects, which allows for testing the logic of the ViewModel without the need for a real View.

How can I test the ViewModel in Flutter?
To test the ViewModel, you can write unit tests that check its logic, such as fetching data, updating state, and handling errors. Since the ViewModel doesn’t directly interact with the UI, it’s easy to test in isolation using frameworks like Mockito or Flutter_test.


-----------------------------------

https://medium.com/@Victor.Ahmad/implementing-model-view-viewmodel-mvvm-in-a-flutter-app-a-step-by-step-guide-92b05e6e8192


maintainable and testable user interfaces
separation of concerns: allows for a more testable and maintainable codebase
loosely coupled architecture: greater flexibility and reusability of code