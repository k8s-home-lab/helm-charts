module.exports = {
  // dryRun: 'full',
  branchPrefix: 'renovate/',
  username: 'k8s-home-lab-renovate[bot]',
  gitAuthor: 'Renovate Bot <bot@renovateapp.com>',
  onboarding: false,
  platform: 'github',
  repositories: [
    'k8s-home-lab/helm-charts'
  ],
  allowedPostUpgradeCommands: [
    '^bash .github/scripts/.*'
  ]
};
