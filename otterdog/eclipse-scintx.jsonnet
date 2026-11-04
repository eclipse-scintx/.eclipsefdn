local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('technology.scintx', 'eclipse-scintx') {
  settings+: {
    description: "",
    members_can_change_project_visibility: false,
    members_can_change_repo_visibility: false,
    members_can_create_teams: false,
    members_can_delete_repositories: false,
    name: "Eclipse SCINTX project",
    packages_containers_internal: false,
    packages_containers_public: false,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  _repositories+:: [
    orgs.newRepo('scintx') {
      allow_merge_commit: true,
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      private_vulnerability_reporting_enabled: true,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      rulesets: [
        orgs.newRepoRuleset('default') {
          allows_creations: true,
          include_refs+: [
            "~DEFAULT_BRANCH"
          ],
          required_status_checks: null,
          requires_commit_signatures: true,
          required_pull_request+: {
            required_approving_review_count: 1,
            requires_code_owner_review: true,
          },
        },
      ],
    },
  ],
}
