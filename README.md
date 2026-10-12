# 🔍 TruthScan AI - Fake News & Misinformation Detector

An advanced, modern web application for checking news articles, viral WhatsApp messages, and social media claims using **Google Gemini AI** (`generativelanguage.googleapis.com`) and forensic linguistic analysis.

---

## 🌟 Key Features

1. **Google Gemini Live AI Integration**:
   - Directly connects to `https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent` (or `gemini-2.5-flash`).
   - Analyzes claims in real-time, outputs objective verdicts:
     - **Supported** (Authentic / Real)
     - **Contradicted** (Debunked / Fake)
     - **Misleading** (Partial truths / Distorted context)
     - **Unverified** (Insufficient official data)
   - Outputs credibility scores (0–100), red flags, key claims, verified facts, and advice before sharing.

2. **Full Bilingual Support (मराठी & English)**:
   - Complete toggle for English and Marathi.
   - When Marathi is active, the prompt directs Gemini AI to output deep explanations, context, and advice directly in pure Marathi (मराठीत उत्तर व स्पष्टीकरण).

3. **Linguistic Triggers & Interactive Highlighter**:
   - Detects clickbait, panic keywords, sensational urgency phrases, and excessive capitalization.
   - Visual color-coded text highlighter for suspicious wording.

4. **Offline / Fallback Heuristics Mode**:
   - Works immediately even without an API key using built-in linguistic heuristics and preset scenarios.
   - Switch to live AI anytime by clicking "Configure Gemini API Key" in the navbar.

5. **History & Printable Reports**:
   - Saves all checks locally with search and filtering.
   - 1-click **Export / Print Report** feature to save analysis as PDF.

6. **Interactive Learning & "Spot the Fake" Quiz**:
   - Educational guide on misinformation vs disinformation, plus an interactive quiz to sharpen critical thinking.

---

## 🚀 How to Run & Deploy ("Diploy")

### Option 1: Run Locally (Fastest - No installation needed)
1. Navigate to the project folder:
   ```
   C:\Users\Radha Krishna\.gemini\antigravity\scratch\truthscan
   ```
2. Simply double-click **`index.html`** to open it directly in your browser (Google Chrome, Microsoft Edge, Firefox, Brave, etc.).

---

### Option 2: Deploy to GitHub Pages (100% Free Public Website)
1. Go to [github.com](https://github.com) and create a new repository named `truthscan`.
2. Upload `index.html` to the repository.
3. In the repository, go to **Settings** &rarr; **Pages**.
4. Under **Build and deployment** &rarr; **Branch**, select `main` (or `master`) and folder `/ (root)`, then click **Save**.
5. Within 1 minute, your app will be live at:
   ```
   https://<your-username>.github.io/truthscan/
   ```

---

### Option 3: Deploy to Netlify Drop (Instant Drag & Drop - 30 Seconds)
1. Visit [app.netlify.com/drop](https://app.netlify.com/drop).
2. Drag and drop the `truthscan` folder onto the page.
3. You will get an instant public live URL (e.g., `https://truthscan-ai.netlify.app`) with free SSL.

---

### Option 4: Deploy to Vercel
1. Install Vercel CLI or link your GitHub repo at [vercel.com](https://vercel.com).
2. Select standard Static HTML deployment.

---

## 🔑 How to Set Up Your Google Gemini API Key
1. Go to [Google AI Studio](https://aistudio.google.com/app/apikey).
2. Click **Create API Key** (free tier includes high rate limits for `gemini-1.5-flash` and `gemini-2.5-flash`).
3. Open TruthScan in your browser.
4. Click the **"Gemini AI"** button in the top navigation bar.
5. Paste your API key and click **"Test Connection"** &rarr; **"Save Key"**.
6. That's it! Every news claim you submit will now be verified live by Gemini AI.
