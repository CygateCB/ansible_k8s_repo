## Running Molecule Tests for CNI Roles
To test CNI roles like `cni_calico` locally:

```bash
# Install Molecule and Docker driver
pip install molecule[docker]

# Navigate to the role directory and run tests
cd roles/cni_calico
molecule test
```

### In CI/CD
Add the following step in your GitHub Actions workflow:
```yaml
- name: Run Molecule tests for CNI roles
  run: |
    cd roles/cni_calico && molecule test
```
This ensures Calico is applied only when needed and verifies idempotence.
