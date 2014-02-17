
% vim:set filetype=tex:
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{refcard}[2014/02/17 Reference Card]
\LoadClass{article}
\RequirePackage{multicol}
\RequirePackage[landscape,a4paper]{geometry}
\RequirePackage[cm]{fullpage}

\setlength{\columnseprule}{0.4pt}
\AtBeginDocument{\begin{multicols}{3}}
\AtEndDocument{\end{multicols}}
\pagestyle{empty}

