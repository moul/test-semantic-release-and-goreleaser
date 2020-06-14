module.exports = {
  branch: 'master',
  plugins: [
    '@semantic-release/commit-analyzer',
    '@semantic-release/release-notes-generator',
    ["@semantic-release/exec", {
      "publishCmd": "make _set_version VERSION=${nextRelase.version}"
    }],
    ["@semantic-release/git", {
      "assets": ["version.go"],
      "message": "chore(release): ${nextRelease.version} [skip ci]\n\n${nextRelease.notes}"
    }],
    '@semantic-release/github',
  ],
};
