
# Edu-Learn

**Edu-Learn** is an e-learning platform designed for NMIMS students, bridging academic preparation and career readiness. The platform combines educational content, interactive tools, and job-preparation features to support student success in academic and professional growth.

## Table of Contents
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Features

- **AI-Guided Interview Preparation**: Personalized interview guidance through Gemini AI.
- **YouTube Video Integration**: Curated video lessons for flexible learning.
- **Notes Sharing and Peer Reviews**: Community-driven notes sharing and review-based content curation.
- **Offline Document Access**: In-app PDF Reader for offline study.
- **Smart Content Recognition**: Document AI for intelligent processing of study materials.

## Technologies Used

- **Frontend**: Flutter
- **Backend**: Firebase (data handling and user management)
- **AI Chatbot**: Gemini AI (personalized interview preparation)
- **Document Processing**: Document AI and PDF Reader
- **Video Content**: YouTube API for video integration

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/username/edu-learn.git
2. Navigate to the project directory:
   ```bash
     cd edu-learn
3. Install Dependencies:
   ```bash
     flutter pub get
4. Run Application
   ```bash
     flutter run
## Project Structure
Edu-Learn/
├── lib/
│   ├── models/             # Data models
│   ├── screens/            # Main screens and UI components
│   ├── services/           # Firebase and API integrations
│   ├── widgets/            # Custom widgets
│   └── main.dart           # App entry point
├── pubspec.yaml            # Dependency file
└── README.md               # Project documentation


## Integration Tests

To test on a real iOS / Android device, first connect the device and run the following command from the root of the project:

```bash
flutter test integration_test/test.dart
```

To test on a web browser, first launch `chromedriver` as follows:
```bash
chromedriver --port=4444
```

Then from the root of the project, run the following command:
```bash
flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=integration_test/test.dart \
  -d chrome
```

***License***
This project is licensed under the MIT License. See the LICENSE file for more details.

***Contact***
For questions or feedback, reach out to the contributors:

Chetan Kachave - ***chetanpatil662002@gmail.com***
Takshil Rajkumar Chinnakonda - ***takshil.cn27@gmail.com***
Neel Hemant Patil - ***neel1234patil@gmail.com***




