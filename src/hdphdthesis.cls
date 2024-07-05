% A class for Heidelberg University Dr. rer. nat. thesis in physics (English)
\ProvidesClass{hdphdthesis}[01 Oct 2024 Heidelberg University Dr. rer. nat. Thesis class]
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{xkeyval}

% Default options
\newif\if@thesislanguageenglish
\newif\if@facultyphysik

\DeclareOption{english}{\@thesislanguageenglishtrue}
\DeclareOption{physicsastro}{\@facultyphysiktrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions \relax

\DeclareOptionX{marginleft}{\def\@marginleft{#1}}
\DeclareOptionX{marginright}{\def\@marginright{#1}}
\DeclareOptionX{margintop}{\def\@margintop{#1}}
\DeclareOptionX{marginbottom}{\def\@marginbottom{#1}}
\DeclareOptionX{bindingoffset}{\def\@bindingoffset{#1}}
\ProcessOptionsX \relax

\LoadClass{book}

\ifx\@marginleft\undefined \def\@marginleft{1in} \fi
\ifx\@marginright\undefined \def\@marginright{1in} \fi
\ifx\@margintop\undefined \def\@margintop{1in} \fi
\ifx\@marginbottom\undefined \def\@marginbottom{1in} \fi
\ifx\@bindingoffset\undefined \def\@bindingoffset{6mm} \fi

\RequirePackage[left=\@marginleft,right=\@marginright,top=\@margintop,bottom=\@marginbottom,bindingoffset=\@bindingoffset]{geometry}
\RequirePackage{pgffor}
\RequirePackage{etoolbox}
\RequirePackage{stfloats}
%\RequirePackage{cite}
\RequirePackage{caption}
\RequirePackage{multirow}
\RequirePackage{adjustbox}
\RequirePackage{longtable}
\RequirePackage{emptypage}

\setlength\LTleft{0pt}
\setlength\LTright{0pt}

\RequirePackage{fancyhdr}
\setlength{\headheight}{\baselineskip}
\renewcommand{\sectionmark}[1]{\markright{#1}}

\fancypagestyle{firstpage}{%
  \fancyhf{} % clear all six fields
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{firstcoverpage}{%
  \fancyhf{} % clear all six fields
  \fancyfoot[C]{\textbf{\thepage}}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{followingpage}{%
  \fancyhf{} % clear all six fields
  \fancyhead[LE,RO]{\textbf{\thepage/\pageref{LastPage}}}
  \fancyhead[LO,RE]{\textsc{\rightmark}}
  \renewcommand{\headrulewidth}{0.7pt}
  \renewcommand{\footrulewidth}{0pt}
  %\renewcommand{\headrule}{\color{darkred}\hrulefill}

}

\pagestyle{followingpage}

\linespread{1.3}

\makeatletter

\def\@referees{}
\newcommand{\setreferees}[1]{\def\@referees{#1}}
\def\@examdate{}
\newcommand{\examdate}[1]{\def\@examdate{#1}}
\def\@bornin{}
\newcommand{\bornin}[1]{\def\@bornin{#1}}
\newcommand{\insertcopyrightnotice}{%
  \thispagestyle{firstpage}
  \null\vfill
  \doclicenseThis
  \newpage
}

\def\@presentedby{Put forward by}
\def\@borninhead{born in}
\def\@examdatehead{Oral examination}
\def\@refereeshead{Referees}
\def\@firstpagehead{
  % Double line on top
  \noindent\rule{\textwidth}{2pt} % Top line 1
  %\noindent\rule{\textwidth}{1pt}\\ % Top line 2
  \textit{\textbf{Dissertation}}\\*\textit{submitted to the}\\*
  \textit{Combined Faculty of Mathematics, Engineering and Natural Sciences}\\*
  \textit{of Heidelberg University, Germany}\\*
  \textit{for the degree of}\\*\textit{\textbf{Doctor of Natural Sciences}}\\
  % Double line below
  \noindent\rule{\textwidth}{2pt} % Bottom line 1
  %\vspace{10pt}
  %\noindent\rule{\textwidth}{1pt}% Bottom line 2
  }


  \renewcommand\maketitle{%
    \def\@refereestable{\@refereeshead: }
    \foreach \@i in \@referees {%
      \protected@xappto\@refereestable{\null & \@i \\}
    }
    \begin{titlepage}
      {
        \linespread{1.6}
        \fontsize{15}{18}\selectfont{}
        \thispagestyle{firstpage}
        \null\vfil
        \noindent\makebox[\textwidth][c]{%
          \begin{minipage}[t][10cm][t]{\textwidth}
            \begin{center}
              {\@firstpagehead\par}
            \end{center}
          \end{minipage}
        }
        \null\vfill
        \begin{center}
          {\@presentedby\\*\@author\par\vskip 1.6em}
          \begin{tabular}{ l l }
            \@borninhead: & \@bornin \\
            \@examdatehead: & \@examdate
          \end{tabular}
        \end{center}
        \if@twoside
          \newpage\null
          \thispagestyle{firstpage}
        \fi
        \newpage
        \thispagestyle{firstpage}
        \noindent\makebox[\textwidth][c]{%
          \begin{minipage}[t][10cm][c]{\textwidth}
            \begin{center}\@title\end{center}
          \end{minipage}
        }
        \null\vfill
        \begin{center}
          \begin{tabular}{ l l }
            \@refereestable
          \end{tabular}
        \end{center}
        \if@twoside
          \newpage\null
          \thispagestyle{firstpage}
        \fi
      }
    \end{titlepage}%
    \setcounter{footnote}{0}%
  }
\makeatother

\newenvironment{coverpage}[1]{%
  \cleardoublepage
  \thispagestyle{firstcoverpage}
  \renewcommand{\sectionmark}[1]{\markright{#1}{}}
  \chaptermark{#1}\sectionmark{#1}
  \null\vskip 50pt
  \begin{center}
    \section*{#1}
    \addcontentsline{toc}{chapter}{#1}
    \null\vskip 20pt
  \end{center}
}{%
  \newpage
}

% https://tex.stackexchange.com/questions/95838/how-to-write-a-perfect-equation-parameters-description
\RequirePackage{amsmath}
\RequirePackage{array}
\RequirePackage{titlesec}

\newenvironment{conditions}
  {\par\vspace{\abovedisplayskip}\noindent\begin{tabular}{>{$}l<{$} @{${}:{}$} l}}
  {\end{tabular}\par\vspace{\belowdisplayskip}\vspace{\baselineskip}}
