
% vim:set filetype=tex:
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{refcard}[2014/02/17 Reference Card]
\LoadClass{article}
\RequirePackage{multicol}
\RequirePackage[margin=8mm,landscape,a4paper]{geometry}

\setlength{\columnseprule}{0.4pt}
\setcounter{secnumdepth}{0}
\pagestyle{empty}
\AtBeginDocument{\begin{multicols*}{3}}
\AtEndDocument{\end{multicols*}}
\renewcommand\maketitle{
	\begin{center}
		\huge
		\@title
	\end{center}
}
\newenvironment{ldesc}{
\begin{tabular}{ll}
}{
\end{tabular}
}
\newcommand{\C}{\texttt}
\newcommand{\B}{\textbf}
\newcommand{\I}{\textit}
\newcommand{\lditem}[2]{
	#1 & \C{#2} \\
}
