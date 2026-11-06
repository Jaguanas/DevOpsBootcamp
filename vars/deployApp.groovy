// Reusable deploy step. Note: a library step contains steps only, NOT a whole pipeline { } block.
def call(Map config) {
    echo "Deploying ${config.appName} to ${config.environment}"
    sh """
        echo 'Deployment started for ${config.appName}'
        echo 'Environment: ${config.environment}'
        echo 'Version: ${config.version}'
        sleep 5
        echo 'Deployment completed successfully'
    """
}
EOF

cat > vars/notifySlack.groovy <<'EOF'
def call(String message) {
    echo "Slack notification: ${message}"
}