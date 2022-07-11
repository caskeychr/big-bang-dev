gpg --batch --full-generate-key --rfc4880 --digest-algo sha512 --cert-digest-algo sha512 <<EOF
    %no-protection
    # %no-protection: means the private key won't be password protected
    # (no password is a fluxcd requirement, it might also be true for argo & sops)
    Key-Type: RSA
    Key-Length: 4096
    Subkey-Type: RSA
    Subkey-Length: 4096
    Expire-Date: 0
    Name-Real: bigbang-dev-environment
    Name-Comment: bigbang-dev-environment
EOF

# The following command will store the GPG Key's Fingerprint in the $fp variable
export fp=$(gpg --list-keys --fingerprint | grep "bigbang-dev-environment" -B 1 | grep -v "bigbang-dev-environment" | tr -d ' ' | tr -d 'Keyfingerprint=')
echo $fp

## On linux
# sed -i "s/pgp: FALSE_KEY_HERE/pgp: ${fp}/" .sops.yaml

## On MacOS
sed -i "" "s/pgp: FALSE_KEY_HERE/pgp: ${fp}/" .sops.yaml

# Save encrypted secrets into Git
# Configuration changes must be stored in Git to take affect
git add .sops.yaml
git commit -m "chore: update default encryption key"
git push --set-upstream origin main

cd base

# Encrypt the existing certificate
sops -e bigbang-dev-cert.yaml > secrets.enc.yaml

# Save encrypted TLS certificate into Git
git add secrets.enc.yaml
git commit -m "chore: add bigbang.dev tls certificates"
git push


# ## On linux
# sed -i "s/pgp: FALSE_KEY_HERE/pgp: ${fp}/" .sops.yaml

# ## On MacOS
# sed -i "" "s/pgp: FALSE_KEY_HERE/pgp: ${fp}/" .sops.yaml

