# Molecule Scenario for cni_calico

## Overview
This Molecule scenario tests the `cni_calico` role using Podman for containerized environments and ensures ansible-lint compliance.

## Files Included
- `molecule.yml`: Defines the Podman driver and lint configuration.
- `converge.yml`: Applies the `cni_calico` role with proper variable handling.
- `verify.yml`: Verifies that Calico is installed correctly.

## How to Run
1. Install dependencies:
   ```bash
   pip install molecule podman ansible ansible-lint
   ```

2. Run lint:
   ```bash
   molecule lint
   ```

3. Create and test scenario:
   ```bash
   molecule create
   molecule converge
   molecule verify
   ```

4. Destroy environment:
   ```bash
   molecule destroy
   ```

## Compliance
- All tasks have descriptive names with prefixes.
- Variables are properly defined and not hardcoded.
- Idempotence ensured by role logic.
