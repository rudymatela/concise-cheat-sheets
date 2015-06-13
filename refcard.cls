%% refcard.cls
%% Copyright 2014  Rudy Matela
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% The Current Maintainer of this work is Rudy Matela.
%
% This work consists of the files refcard.cls and tempalte-refcard.tex


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{refcard}[2014/02/17 Reference Card]
\LoadClass[8pt]{extarticle}
\RequirePackage[margin=9mm,bmargin=6mm,landscape,a4paper,includefoot,foot=24pt]{geometry}
\RequirePackage{array}
\RequirePackage{fancyhdr}
\RequirePackage{xcolor}
\RequirePackage{threecols}

\newcounter{line}

\setlength{\columnseprule}{0.4pt}
\setlength{\columnsep}{24pt}
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

\AtBeginDocument{\threecolumn}
\renewcommand\maketitle{
	\begin{center}
		\huge
		\@title
	\end{center}
}
\newcolumntype{C}{>{\ttfamily\arraybackslash}l}
\newcolumntype{E}{>{\ttfamily\arraybackslash}c}
\newcolumntype{R}{>{\ttfamily\arraybackslash}r}
\newcolumntype{b}{>{\bfseries\arraybackslash}l}
\newenvironment{tabularlc}[1]{
\setcounter{line}{0}
\begin{tabular}{#1}
}{
\end{tabular}
}
\newenvironment{ldesc}{
\begin{tabularlc}{lC}
}{
\end{tabularlc}
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
\newcommand{\CI}[1]{\texttt{\textit{#1}}}
\newcommand{\N}{\textnormal}
\newcommand{\T}[1]{\hphantom{\I{#1}}}
\newcommand{\D}[1]{\hphantom{#1}}
\newcommand{\lditem}[2]{
	#1 & #2 \\
}
\newcommand{\li}[1][]{%
\stepcounter{line}%
\ifnum\theline>1 \\\fi%
#1 &
}
\newcommand{\lI}[1][]{%
\stepcounter{line}%
\ifnum\theline>1 \\[1ex]\fi%
#1 &
}
\newcommand{\Li}[1][]{%
\stepcounter{line}%
\ifnum\theline>1 \\\hline\fi%
#1 &
}
\newcommand{\LI}[1][]{%
\stepcounter{line}%
\ifnum\theline>1 \\[1ex]\fi%
#1 &
}
\newcommand{\s}{\hphantom{A}}
\newcommand{\comm}[1]{\textcolor{gray}{#1}}
\newcommand{\commi}[1]{\textit{\comm{#1}}}
