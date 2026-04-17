# Fleet Control System

A structured fleet management solution designed to provide **visibility, accountability, and cost control** over vehicle operations.

---

## 1. System Structure

The system is built on a 3-layer control model:

### Driver Layer (Execution)
- Records all trips (start and end)
- Captures trip purpose and distance
- Logs expenses (fuel, tolls, etc.)
- Ensures no activity goes unrecorded

### Administration Layer (Control)
- Reviews and approves all trips
- Classifies trips (business or personal)
- Validates records for compliance and tax use
- Locks approved data to prevent alteration

### Management Layer (Intelligence)
- Views operational summaries and reports
- Tracks cost per vehicle and per distance
- Monitors efficiency and resource usage
- Supports data-driven decision making

---

## 2. Tech Stack

- **Backend:** Node.js (Express)
- **Database:** PostgreSQL
- **Authentication:** JSON Web Tokens (JWT)
- **Deployment (planned):** Cloud-based hosting (Render / Supabase)

---

## 3. How It Works

1. A driver starts and ends a trip  
2. Trip details are recorded (time, distance, purpose)  
3. Administration reviews and approves the trip  
4. Approved trips are locked and stored as verified records  
5. The system generates reports and cost insights for management  

---

## 4. Key Features

- Trip tracking and logging  
- Admin approval workflow  
- Expense tracking  
- Cost per distance calculation  
- Role-based access (Driver, Admin, Manager)  
- Audit-ready data structure  

---

## 5. Purpose

This system is designed to:

- Improve operational control over fleet usage  
- Reduce inefficiencies and unauthorized usage  
- Provide accurate, tax-ready records  
- Enable informed financial and operational decisions  

---

## 6. Status

This is the foundational version of the system, focusing on:

- Core control flow (Driver → Admin → Management)  
- Verified data capture  
- Basic financial insight generation  

Future development will include:
- GPS tracking
- Maintenance management
- Advanced analytics and forecasting
