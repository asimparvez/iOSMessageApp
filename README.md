# iOS Messaging App Sample to split Messages with Unit tests
Messaging App


It is a universal app and can be run on both iPhone and iPad devices. The code is written in Swift 4.2 and the deployment target is set to iOS 9.0.

I have declared my splitMessage function in String Utility class so that it can be used from any point. Please find it in the Utilities folder. Comments have been added to explain code at each point.

I have also added an Int extension by the name of Int+DigitCount.swift. The purpose of the extension is to count the number of digits in a number. I am using it in the splitMessage function.

Furthermore, I have used SlackTextViewController for representing chat control. It is useful since it provides useful input features out of the box such as: 
* Tap Gesture for dismissing the keyboard
* Growing text view
* Undo/Redo functionalities
* Ability to handle constraints on auto rotation
* Other refinements such as tap to dismiss etc
* It is also highly customizable and can be used to integrate many more features


Unit tests have been added to test the splitMessage function as required. The method splits the input message regardless of the length of input string, extremely large inputs are also possible.

Please note that a single word can not be longer than 50 characters as per requirement. Simultaneously, the message part prefix also counts towards total character count hence if prefix + word count is greater than 50 the app shows an error.

A Pull Request Template has been added to serve as a reminder before a new PR is created.

Thankyou.