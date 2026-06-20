%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Vignesh Iyer                                 %
% MS CSE ASU                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{%
  \fontsize{9}{11.6}\selectfont
}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2023/01/11 v0.2 Resume class]

\LoadClass[9pt,letterpaper]{article} % Font size and paper type

\usepackage[left=0.4in,top=0.4in,right=0.4in,bottom=0.4in]{geometry} % set document margins
\usepackage[parfill]{parskip} % Remove paragraph indentation

\usepackage{etoolbox}
\usepackage{keycommand}
\usepackage{xstring}
\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    urlcolor=black,
}

% Load the fontspec package to set the font
\usepackage{lmodern}
\usepackage[default]{sourcesanspro} % Source Sans 3 (Pro): clean, modern sans
\renewcommand\familydefault{\sfdefault} % Set the  font family to sans-serif
\usepackage[T1]{fontenc} % Use the T1 font encoding to ensure proper character rendering

\pagestyle{empty}

\usepackage{enumitem}
\usepackage{microtype}

% ----- Consistent spacing system -----
% One vertical rhythm used everywhere, replacing the per-entry negative \vspace hacks.
\setlength{\parskip}{0pt}                % no automatic paragraph spacing -- entries are separated by \entryskip (defined below)
% topsep is the tight gap from a title to its first bullet; itemsep separates the bullets.
\setlist[itemize]{leftmargin=2em, labelsep=0.6em, topsep=2pt, itemsep=2.5pt, parsep=0pt, partopsep=0pt}

\newcommand{\kw}[1]{\textbf{#1}}         % bold a keyword (tech / metric) inside body text

% -------------- README --------------
% Visit https://github.com/vgnshiyer/ASU-sparkysundevil-resume-template for comprehensive documenation.

% ------------ Utilities ------------

\def \separator {
    \textbf{\small\textbullet}
}

\newcommand{\email}[1]{\href{mailto:#1}{#1}}%
\newcommand{\profilelink}[1]{\href{https://#1}{#1}}%

\newcommand{\isA}[1]{
    \expandafter\ifstrequal\expandafter{#1}{default}{}{a}
}

% One shared gap before EVERY entry and after every section rule. \addvspace makes adjacent
% copies merge to their max, so header-to-first-entry equals entry-to-entry automatically.
\newcommand{\entryskip}{\addvspace{8.5pt}}
\newcommand\sectionTitle[1]{%
    \begingroup
        \vspace{9pt}%                       space ABOVE header: groups it with the content below
        {\fontsize{10.5}{12}\selectfont\bfseries\textls[80]{\MakeUppercase{#1}}}
        \vspace{2.5pt}%
        \hrule height 0.8pt%                one consistent rule weight everywhere
    \endgroup
    \entryskip
}%

% ------------------------------------

% ------------- Header --------------
\newcommand\printNameTitle[1]{%
    {\fontsize{19}{22}\selectfont\bfseries\textls[100]{\MakeUppercase{#1}}}\\[3pt]
}%

\newkeycommand{\introduction}[
    fullname,
    email,
    phone,
    linkedin,
    github
]{%
    \begin{center}%
        \printNameTitle{\commandkey{fullname}}% Full name title
        {%
            \expandafter\ifstrequal\expandafter{phone}{}{}% Contact number
            {%
                \ifcommandkey{phone}{\commandkey{phone}}{}%
                \expandafter\ifstrequal\expandafter{email}{}%
                {%
                    \expandafter\ifstrequal\expandafter{linkedin}{}%
                    {%
                        \expandafter\ifstrequal\expandafter{github}{}%
                        {%
                            % empty %
                        }{\separator}%
                    }{\separator}%
                }{\separator}%
            }% Contact number field ends here
            \expandafter\ifstrequal\expandafter{email}{}{}% Email
            {%
                \email{\commandkey{email}}%
                \expandafter\ifstrequal\expandafter{linkedin}{}%
                {%
                    \expandafter\ifstrequal\expandafter{github}{}%
                    {%
                        % empty %
                    }{\separator}%
                }{\separator}%
            }% Email fields ends here
            \expandafter\ifstrequal\expandafter{linkedin}{}{}% Linkedin
            {%
                \profilelink{\commandkey{linkedin}}
                \expandafter\ifstrequal\expandafter{github}{}
                {%
                    % empty %
                }{\separator}%
            }% Linkedin field ends here
            \expandafter\ifstrequal\expandafter{github}{}{}% Github
            {%
                \profilelink{\commandkey{github}}%
            }% Github field ends here
        }
    \end{center}%
}%

% -----------------------------------

% ------------ Summary --------------
\newcommand{\summary}[1]{%
    \sectionTitle{Summary}%
    #1
}%

% -----------------------------------

% ------------ Education ------------
\newenvironment{educationSection}[1]{%
    \sectionTitle{#1}%
}%

\newkeycommand{\lrTitle}[
    ltitle,
    rtitle
]{%
    \entryskip
    \begingroup
        \parfillskip=0pt\relax
        {\bfseries\commandkey{ltitle}}\hfill{\commandkey{rtitle}}\null\par
    \endgroup
}%

% ------------------------------------

% -------------- item --------------
\newenvironment{skillSection}[1]{%
    \sectionTitle{#1}%
}%

\newkeycommand{\keyValueItem}[
    key,
    value
]{%
    {%
        \bf \commandkey{key}:
    }{%
        \commandkey{value}%
    }
}%

% ------------------------------------

% -------------- Experience -------------
\newenvironment{experienceSection}[1]{%
    \sectionTitle{#1}%
}%

\newkeycommand{\experienceItem}[
    company,
    position,
    duration
]{%
    \entryskip
    \begingroup
        \parfillskip=0pt\relax
        \textbf{\commandkey{company} -- \commandkey{position}}\hfill{\commandkey{duration}}\null\par
    \endgroup
}%


