# CV bullet style guide

Reference material for `cv-bullet-writer`. British `-ise` spellings throughout,
to match `cv.tex`.

## Action-verb bank

Grouped by the kind of claim you're making. Lead with one of these, not with a
weak verb.

- **Built / created:** Architected, Built, Created, Designed, Developed,
  Engineered, Implemented, Programmed, Prototyped
- **Improved / optimised:** Optimised, Accelerated, Hardened, Improved,
  Parallelised, Reduced, Refactored, Reworked, Streamlined, Tuned, Upgraded
- **Automated / shipped:** Automated, Configured, Containerised, Deployed,
  Integrated, Migrated, Released
- **Investigated / analysed:** Analysed, Benchmarked, Debugged, Diagnosed,
  Investigated, Modelled, Profiled, Simulated, Validated, Verified, Visualised
- **Led / drove** (only when genuinely true): Coordinated, Drove, Led, Mentored,
  Owned, Spearheaded
- **Communicated / taught:** Communicated, Documented, Explained, Presented,
  Tutored

Avoid opening with: Helped, Worked (on), Assisted, Participated (in), Involved
(in), Was responsible for — they hide your actual contribution.

## Weak words → cut or replace

| Weak | Why it's weak | Fix |
| --- | --- | --- |
| responsible for | states a duty, not an achievement | lead with the verb: "Owned / Built / Ran…" |
| worked on / helped to | hides what you actually did | name the contribution |
| various / several / multiple | vague, reads as padding | name them, or give a count |
| successfully | all listed work is assumed to have worked | delete |
| in order to | three words doing one word's job | "to" |
| utilise | jargon for a plain word | "use" |
| leverage (as filler) | jargon unless there's real leverage | "use", or keep only if literal |
| really / very / a lot | imprecise intensifiers | a number |

## Quantify with…

Speedup (`8.88x`), throughput or scale (`1,000,000s of packets`, `10k req/s`),
percentage (`20\% faster`, `83.3\%`), ranking (`top score in the year`),
score / grade (`100\%`), time saved, test coverage, count of users / modules /
queries. No honest number available? End on a concrete, checkable qualitative
outcome instead of a vague claim.

## LaTeX escaping

| Char | Write as | Example |
| --- | --- | --- |
| `%` | `\%` | `20\% faster` |
| `&` | `\&` | `Research \& Technologies` |
| `#` | `\#` | `C\#` |
| `_` | `\_` | `user\_id` |
| `$` | `\$` | `\$2M` |
| `~` | `\textasciitilde{}` | `\textasciitilde{}5ms` |

Use `--` for ranges (`June 2024 -- Present`).

## Before → after

Each "before" is the kind of flat line people write first; each "after" is in
this CV's voice.

1. **Before:** Worked on a packet sniffer that could handle a lot of packets.
   **After:** Implemented a thread-safe packet queue with pthreads to dispatch
   work to a thread pool, processing 1,000,000s of packets without loss.

2. **Before:** Made the conjugate gradient code faster using vector
   instructions.
   **After:** Optimised a 3D-mesh conjugate gradient solver with AVX-256
   intrinsics, OpenMP, and locality-focused refactoring to achieve an 8.88x
   speedup.

3. **Before:** Used multiprocessing to speed up the simulation.
   **After:** Parallelised the simulation with multiprocessing to bypass the
   GIL, achieving a 20x performance improvement.

4. **Before:** Responsible for build pipeline improvements.
   **After:** Reworked the CI/CD pipeline to support C\# builds and tests on
   Linux, raising code coverage and unblocking Linux developers.

5. **Before:** Built a chatbot with various tools.
   **After:** Developed an LLM support assistant (React.js) using a ReAct loop
   with custom tools for multi-step reasoning, context access, and output
   verification, improving response accuracy.

6. **Before:** Did image processing for resistor detection.
   **After:** Built OpenCV pipelines for resistor localisation,
   denoising/deblurring/glare removal, and colour extraction to read resistor
   values from photos.

7. **Before:** Helped students with maths and computer science.
   **After:** Communicated complex concepts simply to help A-Level and GCSE
   students master subject material. *(Some bullets are about clarity, not
   metrics — that's the right call for a non-technical role.)*

## Tense & person

- No "I" / "my" — bullets are implicitly first person and verb-first.
- Past tense for completed work; present-continuous ("Improving…") only for the
  current, ongoing role.
- Vary the opening verb within a section so two lines never start the same way.
