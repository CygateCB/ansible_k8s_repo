
#!/bin/bash
# Sök efter kebab-case rollnamn i hela repo

echo "Söker efter kebab-case rollreferenser i projektet..."
echo "-----------------------------------------------"

# Lista av rollnamn att söka efter
roles=("kube-master" "kube-node" "cni-calico" "ingress-nginx")

for role in "${roles[@]}"; do
    echo "Kontrollerar: $role"
    grep -R --color=always "$role" .
    echo "-----------------------------------------------"
done

echo "Sökning klar!"
