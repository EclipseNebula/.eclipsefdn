local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipsenebula') {
  settings+: {
    blog: "http://eclipse.org/nebula",
    description: "",
    name: "Eclipse Nebula Project",
    web_commit_signoff_required: false,
  },
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
    orgs.newRepo('nebula') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "java-kotlin",
        "javascript",
        "javascript-typescript",
        "typescript"
      ],
      code_scanning_default_setup_enabled: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Nebula Project",
      has_discussions: true,
      homepage: "https://eclipse.org/nebula",
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
