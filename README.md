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
Phase 1: Requirement Gathering

Stakeholder analysis.

Business process mapping.

AppExchange exploration.

Docs: Phase1_completion.pdf

✅ Phase 2: Security & Sharing

Org setup (users, profiles, roles, permission sets).

OWD & Sharing Rules.

Queues for department-level assignment.

Complaint lifecycle Path (New → In Progress → Resolved → Closed).

Docs: Phase2_completion.pdf
  
Phase 3: Data Modeling & Relationships

Created Standard & Custom Objects: Complaint, Feedback, Department, Citizen.

Defined fields, record types, and page layouts.

Compact layouts for mobile view.

Schema Builder to visualize.

Used Lookup & Master-Detail relationships.

Created a Junction Object for linking complaints & feedback.

Docs: Phase3_completion.pdf

✅ Phase 4: Process Automation (Admin)

Validation Rule: Priority cannot be blank when Status = New.

Flows:

Auto-assign complaints to departments.

Send feedback request email on resolution.

Approval Process: Complaint closure requires Department Manager approval.

Email Alerts: Complaint resolved & feedback request.

Tasks & Notifications: SLA breaches trigger escalation notifications.

Docs: Phase 4 completion.pdf

✅ Phase 5: Apex Programming (Developer)

Classes: ComplaintUtility, ComplaintNotifier, ComplaintScheduler, FeedbackHandler.

Triggers: ComplaintTrigger with Trigger Handler pattern.

SOQL & Collections: Bulkified queries with List/Set/Map.

Asynchronous Apex:

Future methods for async email.

Queueable Apex for escalations.

Batch Apex for bulk unresolved complaints.

Scheduled Apex for daily SLA checks.

Test Classes: Achieved >75% coverage.

Docs: Phase 5 completion.pdf

✅ Phase 6: User Interface Development

Built Lightning App in App Builder.

Record Pages customized for Complaint & Feedback.

Tabs for Complaints, Departments, Feedback.

Home Page with dashboards.

LWC Components:

Complaint submission form.

Apex integration for saving complaints.

Wire Adapters & Imperative Apex Calls used.

Navigation Service: Redirection after submission.
Docs: Phase 6 completion.pdf


✅ Phase 7: Integration & External Access

Named Credential: Integrated JSONPlaceholder API.

External Services: Registered schema for REST APIs.

Web Services (REST): Created Apex REST endpoint /services/apexrest/complaints/{id}.

Callouts: Complaint escalation callouts via Named Credential.

Platform Events: SLA Breach Event published & subscribed.

Change Data Capture (CDC): Tracked Complaint object changes.

Salesforce Connect: Configured external object (demo setup).

OAuth & Authentication: Connected App for Postman testing.

Remote Site Settings: Allowed safe endpoints.

Docs: Phase 7 completion.pdf

✅ Phase 8: Data Management & Deployment

Data Import Wizard: Imported sample citizens & complaints.

Data Loader: Bulk inserted departments (department.csv).

Duplicate Rules: Prevent duplicate citizen records.

Data Export & Backup: Weekly export enabled.

Change Sets: Moved components between sandbox and production.

Packages: Compared Managed vs Unmanaged.

ANT Migration Tool & SFDX: Deployment automation.
Docs: Phase 8 completion.pdf

✅ Phase 9: Reporting, Dashboards & Security Review

Reports: Tabular (All Complaints), Summary (Complaints by Department), Matrix (Complaints by Status & Priority), Joined (Complaints + Feedback).

Report Types: Custom report type for Complaint + Feedback.

Dashboards: SLA Breach Trends, Avg Feedback Rating, Complaint Volumes.

Dynamic Dashboards: Role-based visibility (Citizen vs Admin vs Manager).

Security:

Sharing Settings (Private OWD for Complaint).

Field Level Security (hide citizen contact for unauthorized users).

Session Settings (2FA + timeout).

Login IP Ranges (restricted admin access).

Audit Trail enabled.

Docs: Phase 9 completion.pdf

✅ Phase 10: Final Deployment & Demo

Created full demo script (citizen complaint → auto-assignment → SLA tracking → feedback → reports).

Recorded 8–10 min walkthrough video.

Packaged solution uploaded for submission.

Demo Video Link:https://drive.google.com/file/d/1b5Sh5nKtIy5ZAm9_JQqDrxN-vSw1jO2N/view?usp=sharing



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



