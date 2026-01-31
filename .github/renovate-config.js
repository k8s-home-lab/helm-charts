module.exports = {
  // dryRun: 'full',
  branchPrefix: 'renovate/',
  onboarding: false,
  platform: 'github',
  repositories: [
    'k8s-home-lab/helm-charts'
  ],
  allowedCommands: [
    '^bash .github/scripts/.*'
  ]
};
