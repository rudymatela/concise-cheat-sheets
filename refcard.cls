
% vim:set filetype=tex:
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{refcard}[2014/02/17 Reference Card]
\LoadClass{article}
\RequirePackage{multicol}
\RequirePackage[margin=8mm,bmargin=4mm,landscape,a4paper,includefoot,foot=24pt]{geometry}
\RequirePackage{array}
\RequirePackage{fancyhdr}

\newcounter{line}

\setlength{\columnseprule}{0.4pt}
\setcounter{secnumdepth}{0}
\pagestyle{fancy}
\lhead{}
\chead{}
\rhead{}
\lfoot{}
\cfoot{}
\rfoot{}

\newcommand{\cright}[2]{%
	\lfoot{\footnotesize #1}%
	\rfoot{\footnotesize #2}%
}

\AtBeginDocument{\begin{multicols*}{3}}
\AtEndDocument{\end{multicols*}}
\renewcommand\maketitle{
	\begin{center}
		\huge
		\@title
	\end{center}
}
\newcolumntype{C}{>{\ttfamily\arraybackslash}l}
\newenvironment{ldesc}{
\setcounter{line}{0}
\begin{tabular}{lC}
}{
\end{tabular}
}
\newenvironment{Ldesc}{
\begin{ldesc}
\hline
}{
\\\hline
\end{ldesc}
}
\newcommand{\C}{\texttt}
\newcommand{\B}{\textbf}
\newcommand{\I}{\textit}
\newcommand{\lditem}[2]{
	#1 & #2 \\
}
\newcommand{\li}[1][]{%
\stepcounter{line}%
\ifnum\theline>1 \\\fi%
#1 &
}

\newcommand{\Li}[1][]{%
\stepcounter{line}%
\ifnum\theline>1 \\\hline\fi%
#1 &
}
\newcommand{\s}{\hphantom{\_}}
