# Smart City Complaint & Feedback Portal

## 📌 Problem Statement
Urban citizens often face issues with public services such as roads, water supply, and electricity outages. Traditional complaint systems are slow, lack transparency, and do not ensure accountability.  

This project solves these challenges by building a **Salesforce-based portal** where:
- Citizens raise complaints online.  
- Cases are auto-assigned to departments.  
- SLA timers ensure timely resolution with escalations.  
- A gamified feedback system captures citizen satisfaction.  
- Administrators view dashboards & reports for better governance.  

---

## ✨ Features
- Citizen complaint submission form.  
- Auto-assignment of complaints by department.  
- SLA tracking & escalation rules.  
- Feedback system (ratings for resolved complaints).  
- Reports & dashboards for city administrators.  
- Salesforce Lightning App with modern UI.  

---

## 🛠️ Tech Stack
- **Salesforce Lightning Platform**  
- **Apex, LWC, SOQL**  
- **Salesforce DX (SFDX) + VS Code**  
- **GitHub for version control**  

---

## 🚀 Project Progress
- **Phase 1 (Done)**: Requirement gathering, stakeholder analysis, business process mapping, AppExchange exploration.  
- **Phase 2 (In Progress)**: Org setup (profiles, roles, permissions, OWD, sharing rules, business hours, deployment setup).  
- Next phases → Automation, Reports, Feedback system, Deployment to sandbox/production.  

📄 Detailed documentation: see `docs/Phase_1.docx`.  

---

## 📂 Repository Structure
smart-city-portal/
│
├── force-app/ # Salesforce metadata
├── config/ # Scratch org definitions
├── docs/ # Project documentation (Word/PDF)
│ └── Phase_1.docx
├── README.md # Project overview

---

## ⚡ Setup Instructions
1. Clone the repo:
   ```bash
   git clone https://github.com/YOUR_USERNAME/smart-city-complaint-portal.git
2. Authorize Salesforce org:
   sf org login web -d -a SmartCityOrg
3.Create scratch org:
   sf org create scratch -f config/project-scratch-def.json -a SmartCityScratch -s -d 7
4.Deploy metadata:
   sf project deploy start --source-dir force-app --target-org SmartCityScratch
5. Open the org:
   sf org open

👩‍💻Contributors

Jahnavi Gowda — Salesforce Admin & Developer
