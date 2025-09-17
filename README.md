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
- **Phase 1 (Completed)**
- Requirement gathering  
- Stakeholder analysis  
- Business process mapping  
- AppExchange exploration
- 📄 Detailed documentation: see `Phase1_completion.pdf`. 
   
- **Phase 2 ✅ (Completed)**
- Org setup (users, profiles, roles, permission sets)  
- Organization-Wide Defaults (OWD) & Sharing Rules  
- Queues & Record-Triggered Flows for auto-assignment  
- SLA tracking via metadata-driven approach  
- Complaint lifecycle Path (New → In Progress → Resolved → Closed)  
- Reports & Dashboards for complaints, SLA breaches, and resolution time  
- Gamified Feedback system (Feedback object + rating mechanism)  
- Deployment setup (Scratch Org, Dev Org, SFDX CLI)
-📄 Detailed documentation: see `Phase2_completion.pdf`.  
  
**Upcoming Phases**
- Advanced Automation (Escalation rules, SLA breach alerts)  
- Enhanced Reports & Dashboards  
- Citizen Feedback Portal integration  
- Final Deployment to production/sandbox   



---

## 📂 Repository Structure
smart-city-portal/
│
├── force-app/ # Salesforce metadata
├── config/ # Scratch org definitions
├── Phase1_completion # Project documentation (Word/PDF)
├── Phase2_completion # Project documentation (Word/PDF)
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


