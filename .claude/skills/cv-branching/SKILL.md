---
name: cv-branching
description: >-
  The branching model for this CV repo and its standing agreement with the
  portfolio site. The default branch always holds the central, general-purpose
  CV; every other branch is one CV tailored to a specific application, named
  <company>-<role>. Use whenever the user says things like "tailor my CV to this
  job", "make a version for this application", "I'm applying to X", "start a CV
  for this role", or asks where a CV change should land, which branch to use, or
  whether to branch at all. Also use before committing, merging or pushing
  anything in this repo, since every change to the central CV has to stay
  consistent with the portfolio site that renders the same facts.
---

# CV branching and portfolio agreement

This repo is a git submodule of the portfolio site. Two rules govern it: **where
a change lands**, and **what it has to agree with**.

## Where a change lands

**The default branch is the central CV.** It is the general-purpose version — no
company named, no role-specific slant. Improvements to it go straight in: edit,
rebuild, commit, done. No feature branch, no PR.

> The default branch on this repo is currently **`master`**, not `main`. Confirm
> with `git remote show origin | grep "HEAD branch"` before assuming either.

**Every other branch is one tailored CV**, cut for a single application and
named:

```
<company>-<role>
```

Lowercase, hyphen-separated, e.g. `janestreet-quant-dev`,
`optiver-graduate-swe`, `arm-firmware-engineer`. One branch per application.

To start one, branch from the current default so the tailoring begins from the
latest central CV:

```bash
git switch master && git pull && git switch -c janestreet-quant-dev
```

Then reorder, trim and re-emphasise for that spec — see `cv-bullet-writer` for
the house phrasing.

### The direction of travel matters

- **Central → tailored:** always fine. Rebase or merge the default branch into a
  tailored branch to pick up genuine improvements.
- **Tailored → central:** **do not merge.** A tailored branch is slanted at one
  employer; merging it back would bend the central CV toward that application.
  If you write a bullet on a tailored branch that is genuinely better in general,
  port *that bullet* to the default branch on its own — don't merge the branch.

Tailored branches are a record of what was sent to whom. Leave them; don't
delete them after applying.

## What it has to agree with

The portfolio site (`src/data/content.ts` in the parent repo) renders the same
career facts as the central CV. **They must never contradict each other.**

Whenever you change the CV on the default branch, check and update the site in
the same piece of work — dates, job titles, grades, awards and which institution
granted them, project names and their bullet wording.

- Extra detail on the site is fine; it isn't space-constrained and the CV is.
  Content the CV drops purely for length can stay on the site.
- A *contradiction* is never fine. Two different end dates for the same role, or
  an award under a different institution, is a bug in whichever is stale.
- Watch the knock-on effects: closing a date range means moving that entry's
  prose from present to past tense in both places.
- Commit the submodule first, then `git add cv` in the parent so the recorded
  SHA points at a commit that exists. Push the submodule before the parent, or a
  fresh clone gets a broken checkout.

**Tailored branches are exempt.** They are point-in-time artefacts aimed at one
employer, and the site does not track them.

## Before you commit

1. Rebuild and confirm it is still **one page** — this CV overflows easily:
   ```bash
   latexmk -pdf -interaction=nonstopmode cv.tex
   ```
   Check the reported page count, not just that it compiled.
2. On the default branch, confirm the portfolio agrees.
3. Commit. Never add `Co-Authored-By` lines.
