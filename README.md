# Oceans Institute System

## Contributors
| UWA ID   |  Name    | Github Username |
|----------|----------|----------|
| 23600251   | Linshan Xiao   | LinshanXiao  |
| 21972356   | Hannah Meagher | hrmeagher |
| 23169267   | Kaoma Kabange    | Kaomakabange |
| 23449203   | Spencer Kinder  | SpKinder    |
| 23443635   | Vittorio Panaia    | vittopan |
| 23664629   | Yusuke Matsuki  | DaimyOu    |  

Prototype system for UWA Oceans Institute to integrate and display member expertise data.

## Features
- Information goes here

## Tech Stack
This a possible tech stack subject to change of course.
- Python
- SQL
- JSON/CSV

## Folder Structure
```
oceans-institute-system/
├── data/                 # Place holder for data
├── scripts/              # Scripts for processing and integration
├── display/              # Possible UI Mockups
├── docs/                 # Technical and API notes
├── README.md             # Project overview
├── requirements.txt      # dependencies
└── .gitignore
```

---

# Running the App Locally

### 1. Clone the repository
```
git clone https://github.com/vittopan/oceans-institute-system.git
```

### 2. Create a virtual environment and activate it
```
python -m venv venv
source venv/bin/activate   # On Windows: venv\Scripts\activate
```
### 3. Install dependencies
```
pip install -r requirements.txt
```
### 4. Initialize the database
```
flask db upgrade
```
### 5. Run the app 
```
flask run
```
Access the app at http://localhost:5000

---

