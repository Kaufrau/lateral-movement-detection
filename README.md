# Lateral Movement Detection Using ML & Drift-Aware Methods

This repository supports a PhD-level research project focused on **detecting lateral movement** in Windows environments using **machine learning**, **streaming data analysis**, and **drift-aware models**. The project includes a full virtual lab setup, a log ingestion pipeline, baseline models, drift detectors, and thesis writing.

---

## Repository Structure

| Path                      | Purpose |
|---------------------------|---------|
| `src/`                    | Source code for log parsing, ML baselines, drift detection, and pipelines |
| `data/`                   | Raw and processed datasets, including Parquet logs and attack traces |
| `configs/`                | Sysmon, audit policy, and Prometheus configuration files |
| `scripts/`                | PowerShell scripts for enabling auditing and automation |
| `infrastructure/`         | Dockerized ELK stack and VirtualBox VM setup |
| `models/`                 | Data schemas and trained ML models |
| `notes/`                  | Research notes, drafts, and planning docs |
| `tasks/`                  | Weekly TODOs and project task files |
| `docs/`                   | Lab setup guides, snapshots, hardening steps, and checksums |
| `.github/workflows/`      | CI pipelines for code, notebooks, and Docker images |
| `.devcontainer.json`      | Dev container setup for consistent development environments |

---

## Lab Setup & Monitoring Stack

- **VMs**:
  - `gold` snapshot of Windows 10 Enterprise
  - `benign-ws01`, `attacker-ws01`, and `dc-srv01` (Domain Controller)
- **Monitoring tools**:
  - **Sysmon**, **WEF (Windows Event Forwarding)**
  - Docker-based **ELK stack** (Elasticsearch, Logstash, Kibana)
  - **Prometheus + Grafana** for performance/resource tracking
- **Audit Policy**: Full (success + failure) logging enabled and exported
- **Snapshots**: Tracked and stored for reproducibility

---

## Machine Learning & Drift-Aware Detection

- **Baseline models**: Logistic Regression, Random Forest, XGBoost, MLP
- **Drift detectors**: ADWIN, HDDM, Hoeffding Tree, Adaptive Tree
- **Feature engineering**: `sysmon_parser.py` with JSON schema validation
- **Data management**: Using `Feast`, `DVC`, and `lakeFS`
- **Active learning**: Uncertainty sampling wrapper with label-budget metrics
- **Pipelines**: Scheduled with Prefect for retraining and detection
- **CI for notebooks**: Using `nbQA`, `papermill`, and `pytest`


## Deliverables So Far

| Artifact | Description |
|----------|-------------|
| `snapshot_win10-gold` | Gold image of Windows 10 Enterprise |
| `.gitignore`, `.devcontainer.json` | Git & dev environment initialized |
| `docs/windows_os_hardening_guide.md` | SecOps documentation |
| `configs/sysmon/sysmonconfig.xml` | Early Sysmon config draft |


## Inspiration & Philosophy

This project integrates principles from:
- MLOps best practices
- Modern cybersecurity frameworks (e.g., MITRE ATT&CK)
- Academic rigor with industrial-level tooling
