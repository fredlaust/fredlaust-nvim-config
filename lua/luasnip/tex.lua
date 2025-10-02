return {
  s({ trig = ';a', snippetType = 'autosnippet', desc = 'alpha', wordTrig = false }, { t '\\alpha' }),

  s(
    { trig = 'fig', snippetType = 'snippet', dscr = 'A basic figure environment' },
    fmta(
      [[
        \begin{figure}
        \centering
        \includegraphics[width=0.9\linewidth]{<>}
        \caption{
            \textbf{<>}
            <>
            }
        \label{fig:<>}
        \end{figure}

        ]],
      { i(1, 'filename'), i(2, 'captionBold'), i(3, 'captionText'), i(4, 'figureLabel') }
    )
  ),

  -----------------
  -- DOC SETUPS --
  -----------------
  -- Setup for standard main doc
  s(
    { trig = ';main', snippetType = 'snippet', desc = 'Basic setup for main doc', wordTrig = false },
    fmta(
      [[
        \documentclass[a4paper,11pt]{article}
        \usepackage{subfiles}
        \include{setup}

        \begin{document}

        <>


        \end{document}
        ]],
      { i(1, '') }
    )
  ),

  -- Setup for standard main doc for latex report writing with sources
  s(
    { trig = ';main-with-sources', snippetType = 'snippet', desc = 'Basic setup for main doc', wordTrig = false },
    fmta(
      [[
        \documentclass[a4paper,11pt]{article}
        \usepackage{subfiles}
        \include{setup}

        \begin{document}

        \cfoot[]{ \fancyplain{}{\footnotesize} }
        \fancyhead{}

        \setcounter{tocdepth}{3}
        \tableofcontents
        \clearpage

    
        \pagenumbering{arabic}    
        \fancyhead[R]{\large \textlcsc{ \rightmark } }
        \fancyhead[L]{\large \textsc{ section } \protect\normalsize \thesection}
        \cfoot{\thepage\ of \pageref{LastPage}}
        
        \subfile{<>}

        \printbibliography
        \end{document}
        ]],
      { i(1, '') }
    )
  ),

  -- Setup for standard subfile
  s(
    { trig = ';sub', snippetType = 'snippet', desc = 'Basic setup for main doc', wordTrig = false },
    fmta(
      [[
        \documentclass[a4paper,11pt]{article}
        \usepackage{subfiles}
        \include{setup}

        \begin{document}
        <>      

        \end{document}
        ]],
      { i(1, '') }
    )
  ),

  -- Setup for standard setup
  s(
    { trig = ';setup', snippetType = 'snippet', desc = 'Basic setup for main doc', wordTrig = false },
    fmta(
      [[
        \ProvidesPackage{setup}
        \usepackage[headheight=14pt, top=3cm, bottom=3cm, left=3cm, right=3cm]{geometry}
        \usepackage{graphicx}  
        %\usepackage{showframe}     %Can be used to see the layout frame
        \usepackage{wrapfig}
        %\usepackage[danish]{babel}
        \usepackage[backend=biber, sorting=none]{biblatex}
        \usepackage[toc,page]{appendix}
        \renewcommand\appendixtocname{Appendices}
        \renewcommand\appendixname{Appendices}
        \renewcommand\appendixpagename{Appendices}
        \usepackage[table,xcdraw]{xcolor}
        \usepackage{lastpage}
        \usepackage{subfig}
        \usepackage{fancyhdr}
        \usepackage{multicol}
        \usepackage{multirow}
        \usepackage{hhline}
        \usepackage{caption}
        \usepackage{subcaption}
        \usepackage[T1]{fontenc}
        \usepackage{tocvsec2}
        \usepackage{float}
        \geometry{margin=1in}
        \usepackage{tabularx}
        \usepackage{parskip}
        \usepackage{mathtools}
        \usepackage{pdfpages}
        \usepackage{changepage}
        \usepackage{mdwlist}
        \usepackage{algorithm}
        \usepackage{algpseudocode}
        \usepackage{titlesec}
        \usepackage{subfiles}
        \usepackage{color}
        \usepackage{hyperref}
        \usepackage{booktabs}
        %\usepackage{todonotes}
        \usepackage{marginnote}
        \usepackage{enumitem}
        %\usepackage{soul}
        %\usepackage{natbib}
        \usepackage[nottoc,numbib]{tocbibind}
        \usepackage{setspace}
        \usepackage{booktabs}
        \usepackage[utf8]{inputenc}
        % \usepackage[latin1]{inputenc}
        \usepackage[siunitx]{circuitikz}
        \usepackage{amsmath}
        \usepackage{gensymb}
        \usepackage{listings}
        \usepackage{minted}
        %\usepackage{pgfplots}
        \usepackage{makecell}
        \usepackage[siunitx]{circuitikz}
        \usepackage{pgfkeys}
        \usepackage{csquotes}
        \usepackage{tikz}
        \usepackage{breqn} % For automatic line breaking in equations
        \usepackage{graphicx}
        \usepackage{array}
        %Kommenteret ud, da vi ikke behøver det der draft mark for nu
        %\usepackage[firstpage]{draftwatermark}
        %Kommenteret ud da vi ikke skriver på dansk
        %\usepackage[danish]{babel}
        \usepackage{graphics}
        \usepackage{amsmath}
        \setlength{\mathindent}{0pt} % Ensure no indentation for equations
        %\usepackage{background}
        % \backgroundsetup{bottom,contents={\includegraphics[width=\paperwidth,height=\paperheight,angle=-45]{Billeder/Forside.png}}}

        \definecolor{comment}{rgb}{0,0.3,0}
        \definecolor{number}{rgb}{0.5,0.5,0.5}
        \definecolor{keyword}{rgb}{0,0.33,1}
        \definecolor{backgroundColour}{rgb}{0.98,0.98,0.98}

        \lstset {
            backgroundcolor=\color{backgroundColour},
            commentstyle=\color{comment},
            keywordstyle=\color{keyword},
            numberstyle=\tiny\color{number},
            basicstyle=\ttfamily\footnotesize,
            numbers=left,
            numbersep=5pt,
            showspaces=false,
            showtabs=false,
            tabsize=2,
            language=C
        }

        \setlist{nolistsep}


        \pagestyle{fancy}

        \makeatletter
        \newcommand*{\currentname}{\@currentlabelname}
        \makeatother
        \newcommand{\NameOne}[1]{\todo[inline,author=Person1,color=red!20]{\currentname: ~ #1}}
        \newcommand{\NameTwo}[1]{\todo[inline,author=Person2,color=green!20]{\currentname: ~ #1}}
        \newcommand{\NameThree}[1]{\todo[inline,author=Person3,color=yellow!20]{\currentname: ~ #1}}
        \newcommand{\NameFour}[1]{\todo[inline,author=Person4,color=blue!20]{\currentname: ~ #1}}

        \newcommand\textlcsc[1]{\textsc{\MakeLowercase{#1}}}

        \renewcommand{\headrulewidth}{0pt}
        \renewcommand{\sectionmark}[1]{\markright{#1}}
        \renewcommand{\sectionmark}[1]{\markboth{}{#1}}
        \renewcommand{\subsectionmark}[1]{}% Remove \subsection from header


        \cfoot{\thepage\ of \pageref{LastPage}}

        \titlespacing*{\section}{0pt}{0.5cm}{0cm}
        \titlespacing*{\subsection}{0pt}{0.4cm}{0cm}
        \titlespacing*{\subsubsection}{0pt}{0.2cm}{0cm}
        \titlespacing*{\paragraph}{0pt}{0.2cm}{0cm}

        \DeclareMathOperator{\sininv}{sin^{-1}}
        \DeclareMathOperator{\cosinv}{cos^{-1}}
        \DeclareMathOperator{\taninv}{sin^{-1}}

        %\usepackage{biblatex} % Noget a la gøre vi kan bruge vores Zotero
        %\usepackage{bibtex}
        %\addbibresource{references-2.bib}

        %prøver at genkode paragraph commanden, til at være en overskrift: https://tex.stackexchange.com/questions/60209/how-to-add-an-extra-level-of-sections-with-headings-below-subsubsection

        \makeatletter
        \renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                    {-2.5ex\@plus -1ex \@minus -.25ex}%
                    {1.25ex \@plus .25ex}%
                    {\normalfont\normalsize\bfseries}}
        \makeatother
        \setcounter{secnumdepth}{4} % how many sectioning levels to assign numbers to
        %måske man også bare kunne have brugt titlesec pakken, men fuck det

        % \bibliographystyle{unsrt}
        <>
        ]],
      { i(1, '') }
    )
  ),
}
