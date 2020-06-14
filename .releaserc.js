module.exports = {
  branch: 'master',
  plugins: [
    '@semantic-release/commit-analyzer',
    '@semantic-release/release-notes-generator',
    ["@semantic-release/exec", {
      "publishCmd": "make _set_version VERSION=${nextRelase.version}"
    }],
    '@semantic-release/github',
  ],
};
