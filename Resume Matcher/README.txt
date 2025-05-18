# 🧠 Resume Matcher

A Flask-based web application that compares a job description to multiple resumes and ranks them based on similarity using TF-IDF and cosine similarity.

---

## ✨ Features

- Upload multiple resumes in `.pdf`, `.docx`, or `.txt` formats
- Input a job description
- Get top 5 matching resumes ranked by similarity score
- Clean and responsive UI using Bootstrap

---

## 🚀 How It Works

1. User enters a job description.
2. Uploads resumes.
3. The backend extracts text from each resume.
4. Uses `TfidfVectorizer` to vectorize and compare.
5. Returns the top matches.

---

## 🛠️ Tech Stack

- **Frontend:** HTML, Bootstrap 4
- **Backend:** Python, Flask
- **Libraries:** 
  - `docx2txt`
  - `PyPDF2`
  - `scikit-learn`
  - `Flask`

---

## 🔧 Installation & Run Locally

```bash
git clone https://github.com/Subarna013/resume-matcher.git
cd resume-matcher
pip install -r requirements.txt
python app.py
