![CI](https://github.com/your-org/your-repo/actions/workflows/ci.yml/badge.svg)

# Ansible Kubernetes Deployment Repo

## 📌 Overview
This repository provides an Ansible-based automation for deploying a Kubernetes cluster with best practices.

### ✅ Features
- Pre-flight checks (OS, swap, etc.)
- Kubernetes master and node setup
- CNI installation (Calico)
- Ingress Controller (NGINX)
- Environment-specific inventories (prod/dev)
- Addons: Metrics Server, Kubernetes Dashboard

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
ansible-k8s/
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
│   ├── kube-master/
│   ├── kube-node/
│   ├── cni-calico/
│   ├── ingress-nginx/
│   └── dashboard/
├── playbooks/
│   ├── site.yml
│   ├── preflight.yml
│   ├── cluster.yml
│   └── addons.yml
├── group_vars/
├── ansible.cfg
└── requirements.yml
```

---

## ▶️ How to Use
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

---

## ✅ Best Practices
- Use tags: `--tags preflight` or `--tags cni`
- Keep variables in `group_vars` or role defaults
- Test roles with Molecule before production

---

## 🧪 Running Molecule Tests Locally
To test roles locally using Molecule:
```bash
# Install Molecule and Docker driver
pip install molecule[docker]

# Navigate to a role and run tests
cd roles/<role_name>
molecule test
```
This will create a Docker container, apply the role, and verify its behavior.

---

## 🔐 Enabling and Accessing Addons
### Metrics Server and Dashboard
After running `playbooks/addons.yml`, enable RBAC for Dashboard:
```bash
ansible-playbook -i inventories/prod roles/dashboard/tasks/main.yml
```

### Access Dashboard
Create a token for admin-user:
```bash
kubectl -n kubernetes-dashboard create token admin-user
```
Use this token to log in via the Dashboard UI.

---

## 📚 References
- [Kubernetes Docs](https://kubernetes.io/docs/)
- [Ansible Docs](https://docs.ansible.com/)
