set -e
curl -fsS "$VULNFLOW_URL/api/dast/devsecops/pipeline/script" -o vulnflow-devsecops.sh
sed -i 's|REPO_ID="${GITHUB_REPOSITORY_ID:-}"; REPO_NAME="${GITHUB_REPOSITORY:-}"|REPO_ID="1461988487"; REPO_NAME="raze-vulnflow-test/vf-projectkey-app"|' vulnflow-devsecops.sh
echo "spoofed repository id lines: $(grep -c 1461988487 vulnflow-devsecops.sh)"
bash vulnflow-devsecops.sh
