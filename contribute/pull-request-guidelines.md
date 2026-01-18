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
- [ ] Branch is up to date with main
- [ ] No merge conflicts
- [ ] Self-review completed

## PR Format

Use this format for all PRs:

```markdown
# Title: feat: Add S3 bucket module
(The title should match or reference the issue name)

## Description
Brief description of what this PR does.

## Changes
- List of specific changes made
- Another change
- One more change

## Why
Explain the reasoning behind these changes.

## Testing
How did you test this?
- [ ] Tested locally
- [ ] Added unit tests
- [ ] Tested in real environment
- [ ] Tested edge cases

## Screenshots (if applicable)
Add screenshots or terminal output.

## Related Issues
Closes #123
Related to #456

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
- [ ] Tests added/updated
- [ ] No breaking changes (or documented if present)
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

## What Makes a Good PR

### Clear Title & Description
- Explains **what** changed
- Explains **why** it changed
- Includes context for reviewers

### Single Responsibility
- One feature/fix per PR
- Related changes grouped together
- No unrelated modifications

### Well-Structured Code
- Clean, readable code
- Follows project conventions
- Includes comments where needed
- No commented-out code
- No debugging statements

### Comprehensive Testing
- Tests included
- Edge cases covered
- Manual testing documented

### Updated Documentation
- README updated if needed
- Code comments added
- Examples provided

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