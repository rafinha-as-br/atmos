# Project Concept

**Official name:** Atmos

**Product type:** Flutter Weather App

**Product overview (description):** A portfolio Flutter app for practicing API consumption.

**Product objective goals & target users:**

- The objective is to build a simple Flutter app that consumes weather data from the OpenWeather API.
- The target users are online recruiters.

---

## Core Concepts

- Display current weather for a selected city.
- Provide a 5-day weather forecast.
- Search weather by city name or by device location.
- Store search history in local storage.
- Dynamically change the app theme based on current weather conditions.
- Toggle the application language.

---

## Design Principles

The app design focuses on a **cozy and minimalist style**.

# MVP Scope

## MVP Goal

Build the basic application features using the weather API.

---

## MVP Features

### Current City Weather

**Purpose & Responsibilities**

Retrieve the current weather data for a selected city and display it in the UI.

**User Actions**

None.

**System Behavior**

Request current weather data from the weather API using the selected city.

**Feature Relationship**

Receives a city from an external controller.

---

### City Weather Forecast

**Purpose & Responsibilities**

Retrieve a 5-day weather forecast for a selected city and display it in the UI.

**User Actions**

None.

**System Behavior**

Request 5-day forecast data from the weather API using the selected city.

**Feature Relationship**

Receives a city from an external controller.

---

### Search City

**Purpose & Responsibilities**

Allow users to search for cities globally and select one to display weather data.

**User Actions**

- Type a city name
- Select a city from suggestions or search results

**System Behavior**

Query the geocoder API to retrieve city search results.

**Feature Relationship**

Provides a city to the external controller.

---

## Navigation Flow

The diagram below represents the high level navigation and data flow of the MVP.

![image.png](attachment:4518c1ca-4148-4440-9a7f-30cc02910f3e:image.png)

Observations: The home screen does not fit inside any feature UI, it’s a screen that the 3 features work on it.

---

## Core Data Structures

### Main Entity

**City**

Attributes:

- City name
- Current temperature
- Thermal sensation
- Humidity
- Wind speed

### Controller

A global controller responsible for managing the selected city and providing it to the weather-related features.

---

## Out of Scope

The following features are intentionally excluded from the MVP:

- Theme implementation and dynamic theme changes based on weather conditions
- Weather search based on the current device location
- Search history storage
