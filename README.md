![CI](https://github.com/your-org/your-repo/actions/workflows/ci.yml/badge.svg)

# 🚀 Ansible Kubernetes Deployment Repository

## ✅ Overview
This repository provides a **production-ready Ansible automation** for deploying Kubernetes clusters with best practices, Molecule testing, and CI/CD integration.

### Features
- Pre-flight checks (OS validation, swap disabled)
- Kubernetes master and node setup
- CNI installation (Calico)
- Ingress Controller (NGINX)
- Addons: Metrics Server, Kubernetes Dashboard
- RBAC configuration for Dashboard
- Molecule tests for all roles
- GitHub Actions pipeline for linting and testing

---

## 🔧 Prerequisites
- Ansible >= 2.10
- Python >= 3.8
- SSH access to all nodes
- Kubernetes-compatible OS (Ubuntu 20.04+)

Install required roles:
```bash
ansible-galaxy install -r requirements.yml
```

---

## 📂 Repository Structure
```
ansible-k8s-clean/
├── inventories/
│   ├── prod/
│   │   ├── hosts.yml
│   │   └── group_vars/
│   ├── dev/
│       ├── hosts.yml
│       └── group_vars/
├── roles/
│   ├── common/
│   ├── preflight/
│   ├── kube_master/
│   ├── kube_node/
│   ├── cni_calico/
│   ├── ingress_nginx/
│   └── dashboard/
├── playbooks/
│   ├── site.yml
│   ├── preflight.yml
│   ├── cluster.yml
│   └── addons.yml
├── group_vars/
├── ansible.cfg
├── requirements.yml
└── README.md
```

---

## ▶️ Getting Started
### 1. Update Inventory
Edit `inventories/prod/hosts.yml` or `inventories/dev/hosts.yml` with your node IPs.

### 2. Run Pre-flight Checks
```bash
ansible-playbook -i inventories/prod playbooks/preflight.yml
```

### 3. Deploy Cluster
```bash
ansible-playbook -i inventories/prod playbooks/cluster.yml
```

### 4. Install Addons
```bash
ansible-playbook -i inventories/prod playbooks/addons.yml
```

### 5. Enable Dashboard RBAC
```bash
ansible-playbook -i inventories/prod roles/dashboard/tasks/main.yml
```

---

## 🖼 Screenshots (Placeholders)
![Cluster Setup](docs/images/cluster_setup.png)
![Dashboard UI](docs/images/dashboard_ui.png)

---

## 🧪 Molecule Testing
Run Molecule tests locally:
```bash
pip install molecule[docker]
cd roles/<role_name>
molecule test
```

---

## 🔄 CI/CD Integration
GitHub Actions pipeline runs:
- `ansible-lint` for code quality
- Molecule tests for all roles

Add the workflow in `.github/workflows/ci.yml`.

---

## Felsökning

### Problem: Ansible kan inte skriva till loggfilen när du kör med sudo

**Orsak:** När Ansible körs med `sudo` försöker den skriva till `/tmp/ansible.log`, men filen ägs av din användare och är inte skrivbar för root.

### ✅ Snabbfix
Ändra ägare och rättigheter på `/tmp/ansible.log`:
```bash
sudo chown root:root /tmp/ansible.log
sudo chmod 666 /tmp/ansible.log
```
Det gör filen skrivbar för både root och andra.

### ✅ Rekommenderad lösning
Ändra `log_path` i `ansible.cfg` till en plats som root alltid kan skriva till, t.ex. `/var/log/ansible.log`:
```ini
log_path = /var/log/ansible.log
```
Skapa filen och sätt rättigheter:
```bash
sudo touch /var/log/ansible.log
sudo chmod 666 /var/log/ansible.log
```

### ✅ Kör om installationen
```bash
sudo ansible-galaxy install -r requirements.yml -p /etc/ansible/roles
```

---

## 💡 Advanced Tips
- Use tags: `--tags preflight` or `--tags cni`
- Keep variables in `group_vars` or role defaults
- Validate cluster health with `kubectl get nodes`

---

## 📚 References
- [Kubernetes Docs](https://kubernetes.io/docs/)
- [Ansible Docs](https://docs.ansible.com/)
