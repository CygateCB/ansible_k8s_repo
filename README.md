# Ansible Kubernetes Deployment Repo

## 📌 Overview
This repository provides an Ansible-based automation for deploying a Kubernetes cluster with best practices.

### ✅ Features
- Pre-flight checks (OS, swap, etc.)
- Kubernetes master and node setup
- CNI installation (Calico)
- Ingress Controller (NGINX)
- Environment-specific inventories (prod/dev)

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
│   └── ingress-nginx/
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

## 📚 References
- [Kubernetes Docs](https://kubernetes.io/docs/)
- [Ansible Docs](https://docs.ansible.com/)
