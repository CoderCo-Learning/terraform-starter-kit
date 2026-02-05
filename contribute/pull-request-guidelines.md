# Pull Request Guidelines

## Before Opening a PR

### ✅ Checklist

- [ ] Code is formatted and follows standards (see [terraform-standards.md](./terraform-standards.md))
- [ ] Code works and has been tested locally
- [ ] All tests pass locally
- [ ] README files are complete
- [ ] Examples work and are tested
- [ ] No sensitive data in code or examples (no AWS keys, secrets, or credentials)
- [ ] Commit messages are clear and descriptive
- [ ] Branch is up to date with dev/main (depending on where you are pushing to)
- [ ] No merge conflicts
- [ ] Self-review completed

## PR Format

Use this format for all PRs:

```markdown
## Summary
<!-- Briefly describe what this PR changes and why -->

## Context / Motivation
<!-- Why is this change needed? What problem does it solve? -->

## Type of Change
<!-- Check all that apply -->
- [ ] Terraform module
- [ ] Example update
- [ ] Bug fix
- [ ] Refactor
- [ ] Documentation
- [ ] CI / Tooling

## Related Issues
<!-- Use "Closes #<issue>" to auto-close -->
Closes #

## Testing
<!-- Check what was performed -->
- [ ] terraform fmt
- [ ] terraform validate
- [ ] examples validated
- [ ] tflint
- [ ] terratest (if applicable)
- [ ] not applicable (explain below)

## Evidence / Notes
<!-- Commands run, output, or anything reviewers should know -->

## Checklist
- [ ] PR title is clear and descriptive
- [ ] Code follows module conventions
- [ ] Inputs and outputs are documented
- [ ] No secrets or sensitive data included
```

## Review Process

Pull requests go to the `dev` branch first, then to `main` for production. A maintainer will review your PR and merge once approved.

## Good PR Practices

- Keep PRs small (50-200 lines of changes)
- One feature/fix per PR
- Write clear, descriptive commit messages
- Respond to feedback promptly
- Test thoroughly before submitting
- Update documentation in the same PR

## Responding to Review Feedback

### Be Receptive
- Reviews make code better
- Don't take feedback personally
- Ask questions if unclear
- Thank reviewers for their time

### Try to respond to Every Comment
- ✅ "Fixed in commit abc123"
- ✅ "Good catch, updated"
- ✅ "I disagree because X, what do you think?"
- ✅ "Will address in follow-up PR"

### Don't

- ❌ Ignore comments
- ❌ Get defensive or take it personally
- ❌ Make changes without replying
- ❌ Mark as resolved without addressing

## Merging Your PR

### Merge Requirements

- ✅ Minimum approvals met
- ✅ All CI checks pass
- ✅ No unresolved comments
- ✅ Up to date with main branch
- ✅ Merge conflicts resolved

### Merge Methods

#### Squash and Merge (Recommended)

- Combines all commits into one
- Clean history on main
- Use for feature branches

#### Merge Commit

- Preserves all commits
- Shows complete history
- Use for important features

#### Rebase and Merge

- Replays commits on main
- Linear history
- Use if commits are clean

**Default**: Squash and Merge for most PRs

## After Merging

1. Delete the feature branch
2. Close related issues
3. Update project board