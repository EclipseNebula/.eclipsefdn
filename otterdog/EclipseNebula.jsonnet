local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('technology.nebula', 'EclipseNebula') {
  settings+: {
    blog: "https://eclipse.dev/nebula",
    description: "",
    name: "Eclipse Nebula Project",
    web_commit_signoff_required: false,
  },
  teams+: [
    orgs.newTeam('Owners') {
      members+: [
        "wimjongman"
      ],
      privacy: "secret",
    },
  ],
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/nebula/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('.github') {
    },
    orgs.newRepo('nebula') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Nebula Project",
      has_discussions: true,
      homepage: "https://eclipse.dev/nebula",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('nebula-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
  ],
}
