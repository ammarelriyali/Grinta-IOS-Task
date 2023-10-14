# Project Name: PL (Premier League Fixtures)

## Table of Contents

1. [Introduction](#introduction)
2. [Features](#features)
3. [Architecture](#architecture)
4. [Design](#design)
5. [Why These Choices](#why-these-choices)
5. [Caveats](#caveats)
## Introduction

The "PL" project is designed to provide users with access to fixtures from the Premier League.

## Features

List the key features of your project:

- Displaying a list of fixtures for the Premier League.
- Allowing users to mark fixtures as favorites.
- Implementing a user interface with UIKit and a design system for reusability.
- Utilizing a table view with pull-to-refresh functionality.
- Including a switch button to filter and display favorite fixtures.

## Architecture

In this project, we've carefully selected the following architectural choices to create a robust, maintainable, and testable application:

- MVVM (Model-View-ViewModel): We've opted for the MVVM architectural pattern, emphasizing reusability and maintainability. MVVM simplifies the management of UI state and interactions, making it easier to develop complex user interfaces.

- Clean Architecture: Our project follows clean architecture principles, featuring a clear separation of concerns into three layers: data, domain, and view. This structure enhances maintainability and testability while promoting modularity and code reuse. Each module is self-contained, ensuring that changes in one module do not affect others.

- Frameworks and Libraries: For network requests, we've chosen Alamofire. Alamofire simplifies the networking layer and offers a feature-rich solution for API communication. We've deliberately avoided more complex reactive frameworks like RxSwift and Combine to keep our codebase straightforward and maintainable.

## Design

- UI Framework: The user interface is developed using UIKit, with the aid of a design system to ensure the reusability of views and components.
	
- User Interface Design: The UI design prioritizes user-friendliness and a great user experience. The main component is a table view that showcases Premier League fixtures. Pull-to-refresh functionality ensures users have access to the latest fixtures. A switch button allows users to filter and display their favorite fixtures.
 

## Why These Choices

- MVVM Architecture: MVVM is an ideal choice for developing a reactive and testable user interface. It provides a clear separation of concerns and simplifies the management of UI state.
. Design System: The use of a design system allows for the efficient reuse of views and components, streamlining the UI development process. 

## Caveats 

- API Limitations: Utilizing the www.football-data.org API (v2) comes with certain limitations, particularly related to data filtration. The API might not offer the flexibility needed to filter data effectively, which could pose challenges for specific use cases.


This README serves as an overview of your project and helps users, contributors, and collaborators understand its purpose and functionality.

