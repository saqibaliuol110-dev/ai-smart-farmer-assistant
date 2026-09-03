# 🌾 AI Smart Farmer Assistant

An AI-powered smart agriculture application designed to help farmers make faster and more informed crop decisions using on-device artificial intelligence.

The application combines **plant disease detection**, **crop recommendation**, **offline AI inference**, and **regional language support** in a single Flutter-based mobile application.

## 🎯 Problem

Farmers can face difficulty identifying crop diseases at an early stage and selecting crops according to available soil and environmental conditions.

Access to agricultural experts and reliable internet connectivity may also be limited, especially in rural areas.

## 💡 Our Solution

**AI Smart Farmer Assistant** provides two core AI-assisted tools:

### 🍃 Dr. Leaf — Plant Disease Detection

Farmers can capture or select a leaf image and receive:

- Disease / healthy-leaf identification
- AI confidence score
- Basic cause information
- Treatment guidance
- Uncertain-result handling when model confidence is low

The disease model runs **locally on the device**, allowing inference without requiring an internet connection.

### 🌱 Crop Recommendation

The application helps recommend suitable crops using agricultural inputs such as:

- Soil type
- Season
- Nitrogen (N)
- Phosphorus (P)
- Potassium (K)
- Temperature
- Humidity
- Soil pH
- Rainfall

The app provides ranked crop recommendations based on the supplied conditions.

## 🤖 AI & Machine Learning

The plant disease detection system uses a fine-tuned **MobileNetV2** image-classification model converted to **TensorFlow Lite** for mobile deployment.

**Model evaluation:**

- Held-out test accuracy: **89.68%**
- Macro F1-score: **0.896**
- Test images: **1,076**
- Dataset size: **7,188 images**
- Number of classes: **14**
- TFLite inference runs on-device

The dataset contains healthy and diseased examples for:

- Cotton
- Rice
- Tomato
- Wheat

It also contains **Not_A_Plant** and **Other_Leaves** classes to improve rejection of unsupported inputs.

## 🛡️ Confidence & Uncertainty Handling

Real-world images can differ significantly from training images.

To reduce unreliable predictions, the current MVP includes:

- Explicit non-plant detection
- Unsupported-leaf detection
- A **60% minimum confidence threshold**
- “Uncertain Identification” feedback with guidance to retake the image

This is a practical safety layer for the MVP rather than a claim of complete out-of-distribution detection.

## 🌐 Language Support

The application currently supports:

- English
- Urdu
- Sindhi

This makes the interface more accessible to farmers who may prefer regional languages.

## 📱 Current MVP Features

- Plant disease detection
- Crop recommendation
- Offline TensorFlow Lite inference
- English, Urdu and Sindhi interface
- Disease information and treatment guidance
- Confidence-based uncertain-result handling
- Mobile-friendly Flutter interface

## 🛠️ Technology Stack

- **Flutter**
- **Dart**
- **TensorFlow / Keras**
- **TensorFlow Lite**
- **MobileNetV2**
- **Provider** for application state management

## 🚀 Running the Project

### Requirements

- Flutter SDK
- Dart SDK
- Android Studio or VS Code
- Android device or emulator

### Setup

Clone the repository:

```bash
git clone https://github.com/saqibaliuol110-dev/ai-smart-farmer-assistant.git