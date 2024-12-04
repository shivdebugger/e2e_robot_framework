# e2e_robot_framework
This is the Robot framework with POM model framework

## 1. Setup Instructions
To get started with the Robot Framework, follow these steps:

### Step 1: Install Python
Robot Framework requires Python to be installed on your system. You can download Python from the official website.

Make sure to install Python 3.7 or later. You can verify the installation by running:
```
python --version
```

### Step 2: Install Robot Framework and Dependencies
Once Python is installed, you need to install the Robot Framework and any necessary dependencies. Typically, you will use a requirements.txt file to manage dependencies.

#### 1. Create a virtual environment (optional but recommended):
```
python -m venv venv
source venv/bin/activate   # On Windows: venv\Scripts\activate
```
#### 2. Install dependencies:
```
robotframework-seleniumlibrary
robotframework
robotframework-requests
robotframework-jsonlibrary
```

### Step 3: Install WebDriver (for Selenium Tests)
If you are automating web applications using Selenium, you need to install WebDriver binaries. This can either be done manually or by using a library like WebDriverManager.

- Manual installation: Download the WebDriver for the browser you plan to use (e.g., ChromeDriver for Chrome, GeckoDriver for Firefox) and place it in a folder accessible by the system's PATH.

- Using WebDriverManager (Recommended): The WebDriverManager Python package automatically handles browser driver installations. You can install it via pip:
```
pip install webdriver-manager
```

## 2. Tools Used

Here are the primary tools used in the Robot Framework automation setup:

- Robot Framework: The core automation framework that provides a simple, readable syntax for writing tests. It uses a keyword-driven approach, which makes it easy to write tests without writing complex code.

- ***SeleniumLibrary***: A Robot Framework library used for web automation. It is built on top of Selenium WebDriver and allows interaction with web pages using keywords like Open Browser, Click Element, Input Text, etc.

- ***WebDriverManager***: (Optional) A tool to manage browser drivers like ChromeDriver and GeckoDriver automatically, without needing to manually download and update the drivers.

- ***Other Robot Libraries***: Depending on your testing requirements, you may also use libraries like RequestsLibrary (for API testing), DatabaseLibrary (for database testing), or OperatingSystemLibrary (for file system operations).

## 3. Page Object Model (POM) Approach
The Page Object Model (POM) is a design pattern that is used to enhance the maintainability and reusability of test scripts in an automation framework. In this pattern, each web page is represented by a class (or module in the case of Robot Framework), which contains all the methods (or keywords) that interact with elements on that page.

### Why Use POM in Robot Framework?
Separation of Concerns: The main advantage of POM is the separation of the test scripts (which describe the high-level flow of the tests) from the details of interacting with web elements (which is encapsulated in the page objects). This makes tests easier to maintain and scale.

- ***Reusability:*** Once you define the page object for a page, you can reuse it across multiple test cases, reducing code duplication.

- ***Maintainability:*** When a web page’s structure changes (e.g., element locators change), you only need to update the page object, not the individual test cases.

### How POM is Implemented in Robot Framework?
In Robot Framework, the Page Object Model can be implemented by creating separate Python files for each page. These files contain methods (or keywords) that perform actions on the elements of that page. The tests then interact with these methods instead of directly dealing with Selenium commands.

### Example Folder Structure:
```
/project-root
│
├── /tests/                # Test cases
│   ├── login_test.robot    # Test case for login functionality
│
├── /pages/                # Page Objects
│   ├── login_page.py      # Page Object for login page
│
├── /resources/
|   ├── commonkeywprds.resources  # Common keyword 
|
├── /testdata/             # test files
├── requirements.txt       # Python dependencies
└── results/               # Test results
```

### Key Concepts of POM in Robot Framework:

- Page Object: A class (or Python module) representing a page or component in the web application. It encapsulates all interactions with the page.

- Keywords: Methods within the page object that represent actions a user can take on that page, such as entering text, clicking a button, or verifying content.

- Test Case: A separate Robot Framework test case file that uses the page objects to perform high-level actions (like testing the login functionality).

## 4. Running the Scripts
Once you’ve set up the environment and written the test cases, running the tests is simple:

1. Run all tests:
```
robot tests/
```
This will execute all test cases in the tests/ folder.

2. Run a specific test file:
```
robot tests/LoginTest.robot
```
3. Run a specific test case from file:
```
 robot --test 'Login With Valid Username and Valid Password Test' ./tests/LoginTest.robot
```
4. Storing the logs into result folder:
```
robot -d ./results --test 'Login With Valid Username and Valid Password Test' ./tests/LoginTest.robot
```

## For Using this Repository code follow the below steps:

***1. Clone the repository :***
```
git Clone https://github.com/shivdebugger/e2e_robot_framework
```

***2. Installing the required libraries run the requirement.txt :***
```
pip install -r requirements.txt
```
Once you're donw the installation run the below commands to execute test cases.

***3. Commands for executing test cases:***

1. Run all tests:
```
robot tests/
```
This will execute all test cases in the tests/ folder.

2. Run a specific test file:
```
robot tests/LoginTest.robot
```
3. Run a specific test case from file:
```
 robot --test 'Login With Valid Username and Valid Password Test' ./tests/LoginTest.robot
```
4. Storing the logs into result folder:
```
robot -d ./results --test 'Login With Valid Username and Valid Password Test' ./tests/LoginTest.robot
```



