# ApexEval — Enterprise Online Coding & Aptitude Assessment Platform
> **AI-Proctored Technical Examination System with Sandboxed Multi-Language Code Compilation**  
> *Developed for B.E. Computer Science & Engineering (3rd Year Capstone / Major Project)*

[![Java](https://img.shields.io/badge/Java-21%20%2F%2025%20LTS-orange.svg)](https://www.oracle.com/java/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.3.2-brightgreen.svg)](https://spring.io/projects/spring-boot)
[![Spring Security](https://img.shields.io/badge/Spring%20Security-6.3-blue.svg)](https://spring.io/projects/spring-security)
[![Database](https://img.shields.io/badge/Database-H2%20%2F%20MySQL%20Ready-blueviolet.svg)](https://www.h2database.com/)
[![License](https://img.shields.io/badge/Security-Sandboxed%20Execution-crimson.svg)](#security-architecture)

---

## 🌟 Executive Summary

**ApexEval** is a professional, enterprise-grade assessment platform designed to simulate modern campus placement drives (such as TCS NQT, Amazon SDE, Infosys, and Cognizant diagnostic assessments). Built **100% on Java and the Spring Boot ecosystem**, it combines:

1. **Aptitude & Technical Screening**: Quantitative Aptitude, Logical Reasoning, Verbal Ability, and Core Computer Science fundamentals (OS, DBMS, Computer Networks, and Java OOP/JVM internals).
2. **In-Browser Sandboxed Code Execution**: Real-time compilation and execution of Java and Python solutions against both public sample cases and hidden test cases with execution time and memory tracking.
3. **Multi-Vector AI-Assisted Proctoring Shield**: Enforced browser fullscreen, tab-switching tracking, developer tools restriction, copy-paste defense, live camera monitoring HUD, and an automated 3-strikes disqualification engine.
4. **Instant Scorecard & Audit Certificate**: Granular category-wise mastery breakdowns, time consumption telemetry, proctor violation audit timeline, step-by-step logic explanations, and printable official PDF certificates.

---

## 🏗️ System Architecture

ApexEval follows **Clean Architecture & Domain-Driven Design (DDD)** principles:

```
                            [ Web Browser / Client ]
                                        │
           ┌────────────────────────────┼───────────────────────────┐
           │ (REST Requests with JWT)   │ (Real-time Telemetry)     │ (Static Assets)
           ▼                            ▼                           ▼
┌───────────────────────────────────────────────────────────────────────────────┐
│                        ApexEval Spring Boot Core                              │
│                                                                               │
│  ┌───────────────────────┐  ┌──────────────────────┐  ┌────────────────────┐ │
│  │   Security Filter     │  │  Proctoring Service   │  │   Sandbox Service  │ │
│  │ (JWT + Spring Sec 6)  │  │ (Anti-Cheat Engine)   │  │ (Process Watchdog) │ │
│  └──────────┬────────────┘  └──────────┬───────────┘  └──────────┬─────────┘ │
│             │                          │                         │            │
│  ┌──────────▼────────────┐  ┌──────────▼───────────┐  ┌──────────▼─────────┐ │
│  │    REST Controllers   │  │    Business Logic    │  │ Security Sanitizer │ │
│  │ (Auth, Test, Admin)   │  │ (Grading & Analytics)│  │ (Malicious Filter) │ │
│  └──────────┬────────────┘  └──────────┬───────────┘  └──────────┬─────────┘ │
│             │                          │                         │            │
│  ┌──────────▼──────────────────────────▼─────────────────────────▼─────────┐ │
│  │                 Spring Data JPA / Hibernate Layer                       │ │
│  └─────────────────────────────────────┬───────────────────────────────────┘ │
└────────────────────────────────────────┼──────────────────────────────────────┘
                                         ▼
                 ┌──────────────────────────────────────────────┐
                 │    In-Memory H2 / Enterprise MySQL DB        │
                 └──────────────────────────────────────────────┘
```

---

## 🛡️ Security & Anti-Cheating Architecture

### 1. Multi-Vector Proctoring Shield
- **Browser Fullscreen Enforcement**: Detects fullscreen exits (`fullscreenchange`) and logs an infraction strike.
- **Tab Switch & Window Blur Detection**: Listens to `visibilitychange` and window focus events. Navigating away triggers an immediate strike.
- **Developer Tools & Shortcut Disabler**: Blocks `F12`, `Ctrl+Shift+I`, `Ctrl+Shift+J`, `Ctrl+Shift+C`, `Ctrl+U`, and `Alt+Tab`.
- **Clipboard & Context Menu Lock**: Prevents right-click and question text copying to ensure question bank confidentiality.
- **Automated Disqualification**: If a candidate accrues more than **3 infractions** or their Trust Score drops below threshold, the exam is locked and marked `DISQUALIFIED`.

### 2. Sandboxed Code Execution
- **Subprocess Isolation**: Runs student submissions in ephemeral isolated directories using Java's `ProcessBuilder`.
- **Code Sanitizer**: Pre-execution regex inspection blocks dangerous invocations:
  - Java: `Runtime.getRuntime()`, `ProcessBuilder`, `System.exit()`, `java.lang.reflect`, network sockets (`Socket`), arbitrary file deletions (`Files.delete`).
  - Python: `import os`, `import subprocess`, `import sys`, `open(`, `eval(`, `exec(`.
- **Watchdog Timeout**: Forcefully terminates processes taking longer than 5 seconds (`destroyForcibly()`) to prevent infinite loops (`while(true)`).
- **Buffer Overflow Protection**: Truncates standard output to prevent memory exhaustion bombs.

---

## 💻 Tech Stack

| Layer | Technologies Used |
| :--- | :--- |
| **Backend Language** | **Java 21 / 25 LTS** |
| **Backend Framework** | **Spring Boot 3.3.2** |
| **Security** | **Spring Security 6.3**, Stateless JWT (`jjwt 0.12.5`), BCrypt |
| **Persistence** | **Spring Data JPA**, **Hibernate ORM 6.5**, HikariCP |
| **Database** | **H2 Database 2.2** (In-Memory, zero setup) / MySQL Connector/J |
| **Frontend** | Dark Glassmorphism, Responsive CSS3, Vanilla ES6+ Modules |
| **Code Editor** | In-Browser IDE with tab indent, syntax formatting, test case runner |

---

## 🚀 Quick Start Guide

### Prerequisites
- **Java 21+** (or Java 25 LTS) installed.

### Launch with One Click
Double-click **`run.bat`** (Windows) or execute in PowerShell:
```powershell
.\run.ps1
```

Or run directly using standard Java:
```powershell
java @classpath.txt
```

Once started, open your browser:
👉 **`http://localhost:8080`**

---

## 🔑 Demo Credentials for College Viva & Presentation

The platform is pre-loaded with realistic assessments and credentials:

| Role | Username | Password | Purpose |
| :--- | :--- | :--- | :--- |
| **Candidate** | `candidate` | `test123` | Take proctored assessments, run code, view scorecard |
| **Administrator** | `admin` | `admin123` | View live surveillance wall, create tests, inspect gradebook |
| **Recruiter** | `recruiter` | `recruiter123` | View candidate submissions and audit logs |

**Assessment Access Code**: `APEX-2026`

---

## 📋 Comprehensive Feature Walkthrough

### 1. Candidate Experience
- **Pre-flight Diagnostic Room (`portal.html`)**:
  - Live hardware webcam stream test
  - Anti-cheating undertaking acknowledgment
  - Fullscreen API capability check
  - Past submission performance history
- **Examination Interface (`take-test.html`)**:
  - Countdown clock with color-coded alerts (green -> amber -> flashing red)
  - Floating AI Proctoring HUD with mirrored webcam feed and live integrity score
  - Section navigation pills (Quantitative, Logical, CS Core, Coding)
  - Interactive MCQ cards with keyboard shortcuts (1, 2, 3, 4)
  - Split-pane coding IDE with language switcher (Java / Python), boilerplate reset, public test cases runner, and execution console
  - Question Palette Drawer with color-coded status badges: Answered (Green), Marked (Purple), Answered & Marked (Cyan), Not Visited (Slate)
- **Scorecard & Audit Certificate (`report.html`)**:
  - Pass/Fail verification badge
  - Percentile and score breakdown (Aptitude vs Coding)
  - Proctoring audit log with exact micro-timestamps
  - Question review with step-by-step mathematical logic and solutions
  - One-click **Print / Save as PDF** certificate formatting

### 2. Admin Command Center (`admin.html`)
- **Real-Time Surveillance Wall**: Live monitor showing active candidates in progress, their current tab switch count, and live integrity scores.
- **Assessment Builder**: Create custom tests with duration, cutoff marks, and proctoring strictness.
- **Submissions Gradebook**: Comprehensive table of all historical attempts with direct links to view detailed candidate audit reports.

---

## 🎓 Academic Viva Questions & Answers (For Evaluators)

**Q1: Why did you choose Java and Spring Boot for this project?**  
*Answer:* Java is the enterprise standard for high-concurrency, type-safe, mission-critical applications. Spring Boot 3 provides a modular architecture with production-ready security, JPA connection pooling via HikariCP, and process-level isolation for running sandboxed compilers safely.

**Q2: How does the code execution sandbox ensure security?**  
*Answer:* We implement a three-tiered defense:
1. *Static Analysis (CodeSanitizer)*: Pre-compilation regex scans detect and block forbidden packages (`Runtime.getRuntime()`, `ProcessBuilder`, `System.exit`, reflection, network sockets).
2. *Resource Watchdog*: Subprocesses execute with memory caps and strict timeout enforcement (5 seconds). Any runaway or infinite-loop code is destroyed forcibly.
3. *Output Truncation*: Protects against gigabyte-scale memory denial-of-service spam.

**Q3: How does the proctoring mechanism detect cheating?**  
*Answer:* The client implements real-time event hooks:
- Fullscreen change events (`fullscreenchange`)
- Window focus and visibility change events (`visibilitychange` and `blur`)
- Keystroke intercepts for developer tools (`F12`, `Ctrl+Shift+I`)
Every event is transmitted via REST to `/api/proctor/log`, deducting from the candidate's Trust Index. A 3-strikes rule enforces automatic disqualification.

**Q4: How are coding test cases scored?**  
*Answer:* Questions define both public test cases (visible for candidate debugging) and hidden test cases (unseen assertions). Marks are awarded proportionally:  
$$\text{Marks Awarded} = \text{Total Question Marks} \times \left(\frac{\text{Passed Test Cases}}{\text{Total Test Cases}}\right)$$

---

## 📁 Repository Directory Structure

```
Online Coding and Aptitude Test Platform/
├── src/
│   ├── main/
│   │   ├── java/com/evalplatform/
│   │   │   ├── ApexEvalApplication.java      # Application Entrypoint
│   │   │   ├── config/
│   │   │   │   └── DataInitializer.java      # DB Seeder (Users, Flagship Assessment, Questions)
│   │   │   ├── controller/
│   │   │   │   ├── AuthController.java       # Login, Register, Profile
│   │   │   │   ├── AssessmentController.java # Test Session, Questions, Scoring
│   │   │   │   ├── CodeExecutionController.java # Sandboxed Run & Submit
│   │   │   │   ├── ProctorController.java    # Anti-Cheat Telemetry Logging
│   │   │   │   └── AdminController.java      # Admin Dashboard, Assessment Builder
│   │   │   ├── dto/                          # Clean Data Transfer Objects
│   │   │   ├── model/                        # JPA Entities (User, Assessment, Question, etc.)
│   │   │   ├── proctor/
│   │   │   │   └── ProctoringService.java    # Anti-Cheating & Integrity Calculator
│   │   │   ├── repository/                   # Spring Data JPA Repositories
│   │   │   ├── sandbox/
│   │   │   │   ├── CodeSanitizer.java        # Security Vulnerability & Exploit Guard
│   │   │   │   └── CodeSandboxService.java   # Subprocess Isolation & Watchdog
│   │   │   └── security/                     # Spring Security 6 & JWT Configuration
│   │   └── resources/
│   │       ├── application.yml               # Application Configuration
│   │       └── static/                       # Premium Glassmorphic Frontend
│   │           ├── index.html                # Landing Page & Assessment Catalog
│   │           ├── login.html                # Auth Portal with 1-Click Demo Logins
│   │           ├── portal.html               # Candidate Lobby & Pre-Exam Check
│   │           ├── take-test.html            # Proctored Examination Workspace & IDE
│   │           ├── report.html               # Candidate Diagnostic Scorecard & PDF Export
│   │           ├── admin.html                # Executive Surveillance & Gradebook
│   │           ├── css/style.css             # Enterprise Dark Glassmorphism CSS
│   │           └── js/
│   │               ├── app.js                # Core API Client & Auth Manager
│   │               ├── proctor.js            # Client-Side Anti-Cheating Shield
│   │               └── code-editor.js        # In-Browser IDE Controller
├── pom.xml                                   # Maven Build Configuration
├── run.bat                                   # 1-Click Windows Batch Runner
├── run.ps1                                   # 1-Click PowerShell Runner
└── README.md                                 # Complete Project & Viva Documentation
```

---

## 🏆 Project Accomplishments
- **100% Java Backend** conforming to university evaluation criteria.
- **Enterprise-Grade Architecture** ready for campus placements and technical interviews.
- **Zero-Dependency Startup** runnable in seconds on any Windows system with Java installed.
