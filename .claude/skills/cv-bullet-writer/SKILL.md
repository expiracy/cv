---
name: cv-bullet-writer
description: >-
  Writes, rewrites, and tightens CV / résumé bullet points for this LaTeX CV
  (cv.tex), in the established house style — strong action verb, concrete
  technology, quantified impact, one line each. Use whenever the user is adding
  or editing an experience or project entry, or says things like "write a bullet
  for…", "add this role/project to my CV", "make these punchier / more
  impactful", "rewrite this bullet", "shorten this so it fits", or "tailor my CV
  to this job spec". Outputs ready-to-paste LaTeX \item lines (plus the
  \experienceItem / \lrTitle headers for new entries). Prefer this skill over
  free-handing CV prose so new bullets stay indistinguishable from the rest of
  the document.
---

# CV bullet writer

This CV (`cv.tex`) is a dense, single-page LaTeX résumé (ASU "sparkysundevil"
class, 8–9pt). Its bullets already have a strong, consistent voice. Your job is
to produce new or improved bullets that a reader couldn't tell apart from the
ones already there — and that survive an interview, because every claim is true.

## The house style, in one sentence

> **Lead with a specific action verb, say what you built and the concrete
> technology you used, and end on the quantified outcome.**

Real bullets from this CV that nail it:

- *Implemented a thread-safe packet queue with pthreads to dispatch work
  efficiently to a thread pool, allowing the application to successfully process
  1,000,000s of packets without loss.*
- *Optimised the conjugate gradient numerical method on a 3D mesh by leveraging
  AVX-256 intrinsics, OpenMP directives, and code refactoring to optimise memory
  data locality, to achieve an 8.88x speedup.*
- *Implemented multiprocessing to parallelise simulation code and bypass the
  Global Interpreter Lock (GIL) to achieve a 20x performance improvement.*

Notice the shape: **verb → what → how (named tech) → impact (a number).**

## Rules, and why they matter

1. **Open with a strong, specific verb.** Recruiters scan the first word of each
   line, so it should be a contribution, not a state of being. Past tense for
   finished work; reserve present-continuous ("Improving…") for the one current,
   ongoing role. Don't repeat the same opening verb twice in a section — varying
   it signals range. (Verb bank: `references/style-guide.md`.)

2. **Name the technology.** A software CV is judged on specifics. "using
   OpenCV", "with pthreads", "AVX-256 intrinsics" are credible and double as ATS
   keywords; "using various techniques" is neither. If the work used a notable
   tool, algorithm, or framework, name it.

3. **End on impact, quantified when you honestly can.** The reader cares about
   the result, and numbers stick: `8.88x`, `20x`, `1,000,000s of packets`,
   `100%`, "top score in the year". No number to hand? Use a concrete
   *qualitative* outcome ("without loss", "eliminating manual SSH interaction",
   "establishing a single source of truth") rather than a vague one ("improving
   efficiency").

4. **One idea, one printed line.** The page is small and single-sided; a bullet
   that wraps to a second line spends the budget for another accomplishment. If
   it won't fit, cut a clause — never the impact.

5. **Cut filler.** "responsible for", "worked on", "helped to", "various",
   "successfully", "in order to" (→ "to"), "utilised" (→ "used"). Every word
   competes for space on one page; weak words add length without signal.

6. **Never invent.** A CV has to hold up in the room. Do not fabricate a metric,
   a technology, or an outcome. If a quantified result *would* strengthen a
   bullet but you don't have the figure, ask the user for it, or leave a visible
   placeholder like `[TODO: Nx speedup?]` so nothing fake ever ships silently.

## Producing a bullet

1. Get the raw material — the user's notes, a repo README, or a spoken
   description. Pull out three things: the **action**, the **concrete
   tech/tools**, and the **outcome/scale**.
2. If the outcome isn't quantified and plausibly could be, ask one focused
   question for the single most valuable missing number (throughput, speedup,
   %, scale, ranking, score, time saved). Otherwise fall back to a concrete
   qualitative result.
3. Skim the target section of `cv.tex` first and match its verb choices and
   density — the goal is seamlessness, not a different register.
4. Draft 1–3 candidates, strongest first, each a single printed line.
5. Return them as ready-to-paste LaTeX (below), with a one-line note on where
   they go and any placeholder left to fill.

## Output format

Emit `\item` lines meant to drop straight inside an existing block:

```latex
\item Developed ... using ... to achieve ...
```

The surrounding block already supplies `\begin{itemize}[leftmargin=*]` and
`\itemsep -5pt {}`, so generate only the `\item` lines unless asked for the
whole block.

For a **brand-new role**, also give the header:

```latex
\experienceItem[
    company={...},
    position={...},
    duration={Mon. YYYY -- Mon. YYYY}
]
```

For a **new project**, give the title line plus the optional one-sentence intro
that precedes the bullets (projects here open with a short framing line, e.g.
*"A web app that uses image processing techniques to identify resistor values
from images; achieved a score of 100\%."*):

```latex
\lrTitle[
    ltitle={Project Name},
    rtitle={(Lang, Lib, Concept)},
] \\
One-sentence framing; quantified result if there is one.
```

## LaTeX hygiene

Escape LaTeX specials or the document won't compile: `%`→`\%`, `&`→`\&`,
`#`→`\#`, `_`→`\_`, `$`→`\$`. So C# is `C\#` and "20% faster" is `20\% faster`.
Use `--` for date and number ranges, matching the class. Keep British `-ise`
spellings (optimise, analyse, parallelise) since that is the document's dominant
style — but mirror the surrounding line if it differs.

## Tailoring to a job description

When the user gives a target job spec:

1. Pull the role's real requirements and vocabulary out of the posting.
2. Reorder and lightly rephrase **existing, true** bullets so the matching
   experience surfaces first and uses the posting's words where honest. Do not
   invent experience to fit the posting.
3. Name any genuine gaps (a key requirement with no evidence in the CV) so the
   user can decide whether to address them — don't paper over them.
4. Keep the whole document to one page.

See `references/style-guide.md` for the action-verb bank, the weak-words
blocklist, the full LaTeX escaping table, and before/after examples.
