%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This is unibe-msc document class file.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Author:   René Widmer
%           Institute for Surgical Technology and Biomechanics ISTB
%           University of Bern
%           rene.widmer@istb.unibe.ch
%
% Date:     10/28/2009
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[2001/01/01]
\ProvidesClass{unibe-msc}
              [2009/10/28 v2.1 Document Class for UniBE MSc Theses]
\newif\if@uthesis@electronic \@uthesis@electronicfalse
\DeclareOption{electronic}{\@uthesis@electronictrue}
\def\@uthesis@setpapersize@afour{%
  \setstocksize{297mm}{210mm}
  \settrimmedsize{297mm}{210mm}{*}
  \settypeblocksize{49pc}{33pc}{*}}
\def\@uthesis@setpapersize@gfive{%
  \if@uthesis@electronic
    \setstocksize{239mm}{169mm}
    \settrimmedsize{239mm}{169mm}{*}
    \ifpdf
    \else
      \special{papersize=169mm,239mm}
    \fi
  \else
    \setstocksize{297mm}{210mm}
    \settrimmedsize{239mm}{169mm}{*}
    \setlength{\trimtop}{\stockheight}
    \addtolength{\trimtop}{-\paperheight}
    \setlength{\trimtop}{0.5\trimtop}
    \setlength{\trimedge}{\stockwidth}
    \addtolength{\trimedge}{-\paperwidth}
    \ifpdf
      \AtBeginDocument{%
        \setlength{\pdfpagewidth}{\stockwidth}
        \setlength{\pdfpageheight}{\stockheight}}
    \fi
  \fi
  \settypeblocksize{43pc}{30pc}{*}}
\DeclareOption{g5paper}{\def\uthesis@trimmedsize{gfive}}
\DeclareOption{a3paper}{\OptionNotUsed}
\DeclareOption{a4paper}{\def\uthesis@trimmedsize{afour}}
\DeclareOption{a6paper}{\OptionNotUsed}
\DeclareOption{a5paper}{\OptionNotUsed}
\DeclareOption{b3paper}{\OptionNotUsed}
\DeclareOption{b4paper}{\OptionNotUsed}
\DeclareOption{b5paper}{\OptionNotUsed}
\DeclareOption{b6paper}{\OptionNotUsed}
\DeclareOption{letterpaper}{\OptionNotUsed}
\DeclareOption{legalpaper}{\OptionNotUsed}
\DeclareOption{executivepaper}{\OptionNotUsed}
\DeclareOption{ebook}{\OptionNotUsed}
\DeclareOption{landscape}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ExecuteOptions{g5paper}
\ProcessOptions\relax
\LoadClass[a4paper]{memoir}
\AtBeginDocument{\RequirePackage{graphics}}
\@nameuse{@uthesis@setpapersize@\uthesis@trimmedsize}
\setlrmargins{*}{*}{*}
\setulmargins{*}{*}{*}
\checkandfixthelayout
\def\subtitle{\gdef\thesubtitle}
\def\frontsignature{\gdef\thefrontsignature}
\def\unibelogo{\gdef\theunibelogo}
\def\htilogo{\gdef\thehtilogo}
\def\place{\gdef\theplace}
\def\faculty{\gdef\thefaculty}
\def\affiliation{\gdef\theaffiliation}
\def\examiner{\gdef\theexaminer}
\def\discipline{\gdef\thediscipline}
\def\supervisor{\gdef\thesupervisor}
\def\origin{\gdef\theorigin}
\let\thesubtitle\relax
\let\theunibelogo\relax
\let\thehtilogo\relax
\let\theplace\relax
\let\thefaculty\relax
\let\theaffiliation\relax
\let\thediscipline\relax
\let\thesupervisor\relax
\let\theorigin\relax
\def\maketitle{%
  \begingroup
  %\sffamily
  \pagestyle{empty}
  \renewcommand*{\thepage}{title-\arabic{page}}
  \vspace*{-30mm}
  \noindent
  \scalebox{0.84}{\includegraphics{\thehtilogo}}  \hfill
    \scalebox{0.35}{\includegraphics{\theunibelogo}}
  \parbox[b][0.65\textheight]{\textwidth}{\centering\noindent
    \vskip2cm
    {\large\mdseries \thefaculty \par \thediscipline}\par
    \vskip1cm
    \Large\mdseries\thesubtitle\par
    \vskip2cm
    \huge\bfseries\thetitle\par
    \vskip2cm
    \large\mdseries by
    \vskip2cm
    \LARGE\bfseries\theauthor\par\vfill
    \vskip1cm
    \large\mdseries of \theorigin
  }
  \vfill\noindent
  \parbox[b]{\textwidth}{\centering\noindent
    \large\mdseries Supervisors \\ \thesupervisor\par
    \vskip1cm
    \large\mdseries Institutions \\ \theaffiliation\par
    \vskip1cm
    \large\mdseries Examiners \\ \theexaminer
    \vskip1cm
    \large\mdseries \thefrontsignature
  }
  \cleardoublepage
  \endgroup
}
\endinput
