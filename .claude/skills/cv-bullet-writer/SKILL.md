---
name: cv-bullet-writer
description: >-
  Writes, rewrites, and tightens CV / résumé bullet points for this LaTeX CV
  (cv.tex), in the established house style — strong action verb, concrete
  technology, quantified impact, one line each, with keywords in bold. Use
  whenever the user is adding or editing an experience or project entry, or says
  things like "write a bullet for…", "add this role/project to my CV", "make
  these punchier / more impactful", "rewrite this bullet", "shorten this so it
  fits", or "tailor my CV to this job spec". Outputs ready-to-paste LaTeX \item
  lines (plus the \experienceItem / \lrTitle headers for new entries). Prefer
  this skill over free-handing CV prose so new bullets stay indistinguishable
  from the rest of the document.
---

# CV bullet writer

This CV (`cv.tex`) is a clean, single-page LaTeX résumé set in **Source Sans 3**.
All layout — the gap before each entry, the indentation, the bullet style — lives
in `cv.cls`, so your job is purely the **content**: produce new or improved
bullets a reader couldn't tell apart from the ones already there, and that
survive an interview because every claim is true.

## The house style, in one sentence

> **Lead with a specific action verb, name what you built and the concrete tech
> you used, end on the (ideally quantified) outcome — and bold the keywords.**

Real bullets from this CV (note the `\kw{…}` around the tech and the numbers):

```latex
\item Optimised a 3D-mesh conjugate gradient solver with \kw{AVX-256}, \kw{OpenMP}, and locality refactoring for an \kw{8.88x speedup}.
\item Implemented a thread-safe packet queue with \kw{pthreads} feeding a thread pool, processing \kw{1,000,000s of packets without loss}.
\item Built a \kw{top-down recursive-descent} lexer and parser in C++, generating code via \kw{LLVM IR}.
```

Shape: **verb → what → named tech → impact**, with the tech and the number bold.

## Rules, and why they matter

1. **Open with a strong, specific verb.** Recruiters scan the first word of each
   line, so it should be a contribution, not a state of being. Past tense for
   finished work; reserve present-continuous ("Improving…") for the one current,
   ongoing role. Don't repeat the same opening verb twice in a section — varying
   it signals range. (Verb bank: `references/style-guide.md`.)

2. **Name the technology.** A software CV is judged on specifics. "with
   pthreads", "via LLVM IR", "AVX-256" are credible and double as ATS keywords;
   "using various techniques" is neither. If the work used a notable tool,
   algorithm, or framework, name it.

3. **End on impact, quantified when you honestly can.** Numbers stick: `8.88x`,
   `20x`, `1,000,000s of packets`, `100\%`, "top score in the year". No number to
   hand? Use a concrete *qualitative* outcome ("without loss", "more detailed
   than mainstream C compilers", "eliminating manual SSH interaction") rather than
   a vague one ("improving efficiency").

4. **Bold the keywords with `\kw{…}`.** Wrap the key technology/technique and any
   hard metric in `\kw{…}` (defined in `cv.cls` as bold). This is what makes the
   page scannable — the reader's eye lands on the tech and the numbers. Bold 1–3
   *short* spans per bullet (the deliverable/technique and the result), never
   whole clauses. Bold the degree classification too: `\kw{First (83.3\%)}`.

5. **One idea, one printed line.** A bullet that wraps to a second line spends the
   budget for another accomplishment. If it won't fit, cut a clause — never the
   impact. (Bold text is slightly wider, so re-check the fit after adding `\kw`.)

6. **Cut filler.** "responsible for", "worked on", "helped to", "various",
   "successfully", "in order to" (→ "to"), "utilised" (→ "used").

7. **Never invent.** A CV has to hold up in the room. Do not fabricate a metric,
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
3. Skim the target section of `cv.tex` first and match its verbs, density, and
   `\kw{…}` usage — the goal is seamlessness, not a different register.
4. Draft 1–3 candidates, strongest first, each a single printed line.
5. Return them as ready-to-paste LaTeX (below), with a one-line note on where
   they go and any placeholder left to fill.

## Output format

Every sub-point under a title is a bullet, and `cv.cls` styles the list and owns
all spacing/indentation. So write plain `\item` lines inside a **bare**
`\begin{itemize} … \end{itemize}` — do NOT add `[leftmargin=…]`, `\itemsep`,
`\vspace`, or `\\`; those are handled centrally.

For a **new project**, give the title then a bullet list whose **first `\item`
is the one-line description** (what it is) and the rest are accomplishments —
there is no separate `\\` framing line any more:

```latex
\lrTitle[
    ltitle={Mini C Compiler},
    rtitle={(C++, LLVM, Compilers)}
]
\begin{itemize}
    \item A compiler for Mini C, a subset of C.
    \item Built a \kw{top-down recursive-descent} lexer and parser in C++, generating code via \kw{LLVM IR}.
    \item Produced \kw{colourised, informative error diagnostics} more detailed than mainstream C compilers.
\end{itemize}
```

For a **new role**, give the `\experienceItem` header then the bullets:

```latex
\experienceItem[
    company={...},
    position={...},
    duration={Mon. YYYY -- Mon. YYYY}
]
\begin{itemize}
    \item Verb ... \kw{tech} ... outcome.
\end{itemize}
```

For **education / skills**, each sub-point is an `\item` wrapping a
`\keyValueItem`:

```latex
\item \keyValueItem[key={Grade}, value={\kw{First (83.3\%)}}]
\item \keyValueItem[key={Languages}, value={C, C++, Python, ...}]
```

**Keep it to one page.** If you add a strong entry to an already-full page,
propose demoting a weaker project into the one-line "Other Projects" `\item`
rather than letting it spill onto a second page. Always rebuild and eyeball the
PDF — a bold word can tip a bullet onto a second line.

## LaTeX hygiene

Escape LaTeX specials or the document won't compile: `%`→`\%`, `&`→`\&`,
`#`→`\#`, `_`→`\_`, `$`→`\$`. So C# is `C\#` and "20% faster" is `20\% faster`.
Use `--` for date and number ranges. Keep British `-ise` spellings (optimise,
analyse, parallelise) since that is the document's dominant style — but mirror
the surrounding line if it differs.

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
blocklist, the `\kw{}` keyword-bolding guide, the LaTeX escaping table, and
before/after examples.
