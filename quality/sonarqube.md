
# Issues
There are three types of issues

- **Bug**: A coding mistake that can lead to an error or unexpected behavior at runtime.
- **Vulnerability**: A point in your code that's open to attack.
- **Code Smell**: A maintainability issue that makes your code confusing and difficult to maintain.

## Issue severity

Each issue has one of five severities:

- **BLOCKER**: Bug with a high probability to impact the behavior of the application in production. For example, a memory leak, or an unclosed JDBC connection are BLOCKERs that must be fixed immediately.
- **CRITICAL**: Either a bug with a low probability to impact the behavior of the application in production or an issue that represents a security flaw. An empty catch block or SQL injection would be a CRITICAL issue. The code must be reviewed immediately.
- **MAJOR**: A quality flaw that can highly impact the developer's productivity. An uncovered piece of code, duplicated blocks, or unused parameters are examples of MAJOR issues.
- **MINOR**: A quality flaw that can slightly impact the developer's productivity. For example, lines should not be too long, and "switch" statements should have at least 3 cases, are both be considered MINOR issues.
- **INFO**: Neither a bug nor a quality flaw, just a finding.

Ideally, the team wouldn't introduce any new issues (new technical debt).
`SonarLint` helps developers by performing local analyses to check code before pushing it back to the SCM.
But in real life, it's not always possible to code without any new technical debt, and sometimes it's not worth it.



