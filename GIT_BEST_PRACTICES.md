# Git Best Practices & Common Don’ts

This document summarizes practical Git best practices and common mistakes learned through hands-on DevOps and engineering work.

Git itself is simple — **discipline and consistency** are what make repositories professional and maintainable.

---

## ✅ Git Best Practices

### 1. Make Small, Logical Commits
Each commit should represent **one clear change**.
- Easier code reviews
- Easier rollbacks
- Cleaner history

---

### 2. Write Meaningful Commit Messages
Bad:
fix
update
changes

---

Good:
Fix broken link in README
Add Linux fundamentals documentation
Ignore macOS system files

---

### 3. Pull Before You Push
Always sync with the remote branch before pushing:

git pull --rebase

This avoids unnecessary merge commits and conflicts.

---

### 4. Use .gitignore Properly

Ignore files that do not belong in version control:
	•	.DS_Store
	•	.env
	•	node_modules/
	•	build artifacts
	•	temporary downloads

---

### 5. Keep One Repository = One Purpose

A repository should have one clear goal.
Avoid mixing unrelated projects in the same repo.

---

### 6. Verify Before Pushing

Before pushing, always check:
git status
git log -1
This prevents accidental commits and mistakes.

---

### 7. Use Branches for Experiments
Never experiment directly on main.
git checkout -b feature-name

---

### 8. Configure Your Git Identity Early

Set your name and email once:
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
This ensures commits are properly attributed.

❌ Common Git Don’ts

1. Don’t Commit Secrets

Never commit:
	•	API keys
	•	passwords
	•	access tokens

Once pushed, secrets live forever in Git history.

2. Don’t Nest Git Repositories Accidentally

A .git folder inside another repo creates embedded repositories.
Only do this intentionally with submodules.


3. Don’t Commit Large Binary Files Blindly

Images, PDFs, and videos should be committed intentionally, not accidentally.

4. Don’t Rely Only on GitHub’s Web Editor

Local development gives:
	•	Better control
	•	Better testing
	•	Better commit discipline


5. Don’t Force Push on Shared Branches
git push --force
This can overwrite teammates’ work and should be avoided on shared branches like main.

6. Don’t Panic During Merge Conflicts

Conflicts are normal.
Slow down, read the conflict markers, resolve deliberately.

🧠 Key Takeaways

Git mastery isn’t about memorizing commands —
it’s about clean history, clarity, and consistency.

Well-managed Git repositories reflect professional engineering discipline.